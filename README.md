# fluent-plugin-monitor-agent-modified

Modified version of the `in_monitor_agent` plugin in fluentd. It can monitor number of emitted records during `emit_interval` when `tag` is configured. 
The filed is `records`. 

## Installation

This Fluentd plugin is available as the `fluent-plugin-monitor-agent-modified` gem from RubyGems.

    gem install fluent-plugin-monitor-agent-modified

Or you can install this plugin for [td-agent][td-agent] as:

    td-agent-gem install fluent-plugin-monitor-agent-modified

## Usage

Same as the `in_monitor_agent` plugin in Fluentd

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fluent-plugin-monitor-agent-modified.
