require 'bundler/setup'
Bundler.require

require_all 'lib'


ActiveRecord::Base.logger = nil

 Start.new.main #comment this out to debug

binding.pry 
0