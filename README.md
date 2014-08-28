# Jekyll Prisim Plugin

A Prism plugin for Jekyll with support included for the official plugins. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem mm-jekyll-prism
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mm-jekyll-prism

## Usage

These instructions assume you are familiar with using Prism. If not please read the [Prisim documentation](http://prismjs.com/index.html) from the Prism website. This plugin does not install prism but allows for easy inclusion of Prism code blocks in your Jekyll website.

To start using this plugin replace your `<pre><code class="language-*">...</code></pre>` block with `{% prism myLanguage %}...{% endprism %}` replacing `myLanguage` with any language supported by Prisim.

### Plugins

#### Line Highlighting

__Help document__: http://prismjs.com/plugins/line-highlight/

To use line highlighting provide the __highlight__ option with the values for the line-highlight plugin as specified on the plugins help page. The value is passed verbatim to the _data-line_ attribute used by Prism. 

###### Example

    {% prism javascript highlight="1-5,7,10-13" %}
    // ...
    {% endprism %}

#### Line Numbering
__Help document__: http://prismjs.com/plugins/line-numbers/

To use line numbering add the option __numbering__. To offset line numbering provide a value to the __numbering__ option as specified in the help page for the plugin. The value is passed verbatim to the _data-start_ attribute used by Prism.

###### Example
__No  offset__

    {% prism javascript numbering %}
    // ...
    {% endprism %}
    
__With  offset__

    {% prism javascript numbering=10 %}
    // ...
    {% endprism %}

#### Show invisibles
__Help document__: http://prismjs.com/plugins/show-invisibles/

Works without any further configuration assuming the plugin is installed.

#### Autolinker
__Help document__: http://prismjs.com/plugins/autolinker/

Works without any further configuration assuming the plugin is installed.

#### WebPlatform Docs
__Help document__: http://prismjs.com/plugins/wpd/

Works without any further configuration assuming the plugin is installed.

#### File Highlight
__Help document__: http://prismjs.com/plugins/file-highlight/

To use file highlighting add the option __file__ with the path to the file. See the help document for further information. There is no need to specifiy a language when using __File Highlight__ but you can provide one. The value is passed verbatim to the _data-src_ attribute used by Prism. Other plugins may not function with this plugin; this is a limitation of the Prism plugin.

###### Example
__No  language__

    {% prism file="myfile.js" %}
    // ...
    {% endprism %}
    
__With  offset__

    {% prism javascript file="myfile.js" %}
    // ...
    {% endprism %}


#### Show Language
__Help document__: http://prismjs.com/plugins/show-language/

Works without any further configuration assuming the plugin is installed.


## Contributing

1. Fork it ( https://github.com/mitmaro/jekyll-prism-plugin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
