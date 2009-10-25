require 'culerity'

Before do
  $server ||= Culerity::run_server
  $browser = Culerity::RemoteBrowserProxy.new $server, {:browser => :firefox, :log_level => :warning}
  @host = 'http://localhost:3001'
end

at_exit do
  $browser.exit if $browser
  $server.close if $server
end
