#!/usr/bin/env ruby

# Description: Convert HTML posts exported from Wordpress.com to Markdown
#              suitable for Jekyll
# Author:      Radek Pazdera <radek@pazdera.co.uk>

require "reverse_markdown"

def error(msg)
  puts msg
  exit 1
end

def process_file(file_name)
  error "File #{file_name} doesn't exist!" unless File.exists? file_name
  post = File.read file_name

  puts "Processing #{file_name} ..."

  # \r\n to \n
  post.gsub! /\r\n/, "\n"

  # split the frontmatter
  fmt_re = /---\n(.*)\n---\n(.*)/m
  if match = fmt_re.match(post)
    frontmatter = match[1]
    content = match[2]

    # reverse markdown
    content = ReverseMarkdown.parse content
    puts content

    # [sourcecode language="*"]
    src_open_re = /\[sourcecode\s+language="([^"]+)"\]/
    src_close_re = /\[\/sourcecode\]/
    content.gsub! src_open_re, "\n"'{% highlight \1 %}'"\n"
    content.gsub! src_close_re, "\n{% endhighlight %}\n"

    puts "==================="
    puts content

    # Wrap lines at 78 chars
    lines = []
    new_line = ""
    content.lines do |line|

      words = line.split " "
      words.each do |word|
        if new_line.length + word.length <= 78
          new_line << " " << word
        else
          if word.length >= 78
            lines.push new_line.strip unless new_line == ""
            lines.push word.strip
            new_line = ""
          else
            lines.push new_line.strip
            new_line = word
          end
        end
      end
      lines.push new_line.strip
      new_line = ""
    end

    lines.push new_line.strip
    content = lines.join "\n"
    puts "---------------------"
    puts content

    post = <<EOS
---
#{frontmatter}
image:
  feature: abstract-3.jpg
share: true
comments: true
---
#{content}
EOS

    # Write output
    new_file_name = file_name.gsub /\.html$/, ".md"
    File.open new_file_name, "w" do |f|
      f.write post
    end
  else
    puts "#{file_name} is not formatted correctly!"
  end
end

if ARGV.length >= 1 then
  input_file = ARGV[0]
  process_file input_file
else
  puts "Usage: posts_convert <input-file>"
  exit 1
end

#Dir.foreach input_dir do |file_name|
#  if file_name =~ /\.html$/
#    process_file file_name
#  end
#end


