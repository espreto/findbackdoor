Findbackdoor
==

Description:
--
Script in Ruby for detect possible backdoors in files PHP. (Good for the Wordpress PHP files.)

The Findbackdoor is released under a MIT license. See
LICENSE for more details.

The public GitHub source repository can be found at:
 https://github.com/espreto/findbackdoor

Questions and suggestions can be sent to:
 robertoespreto(at)gmail.com

Installing:
--
You will only need the Ruby package installed.

Usage:
--
```
$ ruby findbackdoor.rb

 -s or -d missing

 Usage: findbackdoor [options]
    -s, --source <dir>               Directory containing the source code
    -d, --db <signatures>            Patterns signatures
    -r, --report <format>            Report format <console|xml|html>
    -l, --list                       List available signatures
    -h, --help                       Show this menu

```
Contributing
--
1. Fork it
2. Create your feature branch (```git checkout -b my-new-feature```)
3. Commit your changes (```git commit -am 'Add some feature'```)
4. Push to the branch (```git push origin my-new-feature```)
5. Create new Pull Request

To Do:
--
Missing some features, but it's a start.

