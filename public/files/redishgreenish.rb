# (The MIT License)
# 
# Copyright (c) 2001-2006 Ryan Davis, Eric Hodel, Zen Spider Software
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# -*- ruby -*-

# special thanks to Pat Eyler, Sean Carley, and Rob Sanheim

# http://kpumuk.info/ruby-on-rails/colorizing-console-ruby-script-output/
module Autotest::RedishGreenish
  BAR = "=" * 80
  COLOURS = { 
      :black => 30,
      :red => 31,
      :green => 32,
      :yellow => 33,
      :blue => 34,
      :magenta => 35,
      :cyan => 36,
      :white => 37
  }
  
  PASSED = :green unless defined? PASSED
  FAILED = :red unless defined? FAILED

  Autotest.add_hook :ran_command do |at|
    if at.results.last.match(/^.* (\d+) failures, (\d+) errors$/)
      code = ($1 != "0" or $2 != "0") ? COLOURS[FAILED] : COLOURS[PASSED]
      puts "\e[#{code}m#{BAR}\e[0m\n\n"
    end
  end
end