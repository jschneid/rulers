require 'rack/test'
require 'test/unit'

# Always use local directory's Rulers first (not the installed gem).
# Check the local path before anything else in $LOAD_PATH.
d = File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH.unshift File.expand_path(d)

require 'rulers'
