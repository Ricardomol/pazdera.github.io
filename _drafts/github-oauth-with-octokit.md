---
layout: post
title: GitHub Authentication with Octokit
description: "Using Sinatra + Octokit to get an OAuth token from GitHub"
cover: paddington.jpg
comments: true
categories:
- Software
- Programming
tags:
- Github API
- OAuth
- Octokit
- Ruby
---

This short post serves as an additional resource to [GitHub's guide](https://developer.github.com/v3/oauth/) on how to use **OAuth** for their API. The official guide gives a more generic explanation of the authentication process, rather than describing a single library. That is fine, however, in case you're using the official [Octokit](http://octokit.github.io/) toolkit to access the API, you can make things even simpler for yourself.

<figure class="full">
    <img src="/assets/images/posts/octokit.png" alt="The Octokit logo">
    <figcaption>
        The logo of Octokitrb
    </figcaption>
</figure>

I try not to repeat too many things here, so please refer to the [original guide](https://developer.github.com/v3/oauth/) in case something doesn't make sense. I'll be using [Sinatra](http://www.sinatrarb.com/) as the backend framework of choice, just as the original guide does, but you should be able to do the same with any other toolkit as well.

## The Stages of Authentication

The process of OAuth authentication can be broken down to **three** stages. First, you need to redirect the user to GitHub to **request access**. When the user authorises your request, GitHub will redirect them to your **callback URL** that you need to set up when you register your app. The redirection will come with a **code parameter**. You will be required to send this back to GitHub along with your application's id and secret. If all three are correct, GitHub will issue an **access token** that you can use to perform actions on behalf of the user. What you are allowed to do is limited by the **scope** for which the token was issued.

That isn't too difficult, right? Basically, the only tricky part is constructing the HTTP requests and parsing the responses. Now, there is where **Octokit** can be useful. Let's take it stage by stage.

### 1. Redirect

This is simple, all you need is to paste your application's **client_id** and the requested **scopes** to the URL and redirect the user to it. Octokit has a handy method that will form the correct URL for you automatically.

{% highlight ruby %}
client = Octokit::Client.new
url = client.authorize_url(CLIENT_ID, :scope => 'user:email')

# Tell sinatra to redirect
redirect url
	{% endhighlight %}

### 2. Callback

The user approved your application with Github and is now being sent back from there to your site. For this, Github will use the **callback** you defined when registering the app and redirect everyone there with a specific **code**. Now you need to authenticate yourself as the application. You are required to respond with your application's credentials. Again,  there's a very convenient function in Octokit, so you don't need to do this by hand.

{% highlight ruby %}
get '/callback' do
  session_code = request.env['rack.request.query_hash']['code']
  result = Octokit.exchange_code_for_token(session_code, CLIENT_ID, CLIENT_SECRET)
  session[:access_token] = result[:access_token]

  redirect '/'
end
{% endhighlight %}

If your credentials were correct, you will receive the **access token** you need to make API calls on behalf of the user in question. Here, we'll just store it in the session and redirect back to the main application.

### 3. Access Token

It is time to initialise the API client with the token we got from the previous step. But what if the user managed to revoke in the meantime? It is important to check whether the token is still valid. 

{% highlight ruby %}
  # make anonymous requests on behalf of the application
  # this means the application can benefit from higher requests limits
  client = Octokit::Client.new \
    :client_id => CLIENT_ID,
    :client_secret => CLIENT_SECRET

  begin
    client.check_application_authorization access_token
  rescue => e
    # request didn't succeed because the token was revoked so we
    # invalidate the token stored in the session and render the
    # index page so that the user can start the OAuth flow again
    session[:access_token] = nil
    return authenticate!
  end
{% endhighlight %}

And in case the token was all right, we can finally start to make calls on behalf of the user.

{% highlight ruby %}
client = Octokit::Client.new :access_token => access_token
data = client.user

if client.scopes(access_token).include? 'user:email'
  data['private_emails'] = client.emails.map { |m| m[:email] }
end
{% endhighlight %}

## The Full Source

Here is the full source of the example above that I tested.

{% highlight ruby %}
#!/usr/bin/env ruby

require 'sinatra'
require 'octokit'

CLIENT_ID = ENV['GH_APP_CLIENT_ID']
CLIENT_SECRET = ENV['GH_APP_SECRET_ID']

use Rack::Session::Cookie, :secret => rand.to_s()

def authenticated?
  session[:access_token]
end

def authenticate!
  client = Octokit::Client.new
  url = client.authorize_url CLIENT_ID, :scope => 'user:email'

  redirect url
end

get '/' do
  if !authenticated?
    authenticate!
  else
    access_token = session[:access_token]
    scopes = []

    client = Octokit::Client.new \
      :client_id => CLIENT_ID,
      :client_secret => CLIENT_SECRET

    begin
      client.check_application_authorization access_token
    rescue => e
      # request didn't succeed because the token was revoked so we
      # invalidate the token stored in the session and render the
      # index page so that the user can start the OAuth flow again
      session[:access_token] = nil
      return authenticate!
    end

    client = Octokit::Client.new :access_token => access_token
    data = client.user

    if client.scopes(access_token).include? 'user:email'
      data['private_emails'] = client.emails.map { |m| m[:email] }
    end

    erb :email, {:locals => data.to_attrs}
  end
end

get '/callback' do
  session_code = request.env['rack.request.query_hash']['code']
  result = Octokit.exchange_code_for_token(session_code, CLIENT_ID, CLIENT_SECRET)
  session[:access_token] = result[:access_token]

  redirect '/'
end
{% endhighlight %}

To use the above app, you'll also need to have the following `views/email.erb` template prepared. This is for the page that will Sinatra display when successfully authenticated.

{% highlight erb %}
<html>
  <head>
  </head>
  <body>
    <p>Well, well, well, <%= login %>!</p>
    <p>
      <% if email && !email.empty? %> It looks like your public email address is <%= email %>.
      <% else %> It looks like you don't have a public email. That's cool.
      <% end %>
    </p>
    <p>
      <% if defined? private_emails %>
      With your permission, we were also able to dig up your private email addresses:
      <%= private_emails.join(', ') %>
      <% else %>
      Also, you're a bit secretive about your private email addresses.
      <% end %>
    </p>
  </body>
</html>
{% endhighlight %}

## Summary

That's it, you need about 60 lines of code and you're done. It is that easy to setup a Ruby application to use the Github API. You'd normally use Octokit to make the API calls, but you can use the same library to avoid much of the boilerplate that is required during the OAuth process and make it even simpler for yourself.