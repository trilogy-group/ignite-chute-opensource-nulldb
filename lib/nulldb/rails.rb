require 'nulldb/core'
require 'rack'

# Need to defer calling Rails.root because when bundler loads, Rails.root is nil
NullDB.configure  do |ndb| 
	def ndb.project_root
		Rails.root
	rescue NameError
		Rack::Directory.new('').root
	end
end
