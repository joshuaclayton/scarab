require "bundler/setup"
Bundler.require(:development)

require "aruba/cucumber"

Before('@slow_process') do
  @aruba_io_wait_seconds = 5
end
