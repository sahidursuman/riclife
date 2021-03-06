
RAILS_GEM_VERSION = '2.3.18' unless defined? RAILS_GEM_VERSION

RICLIFE_VERSION =   "1.2.1a" #  TODO(ricc): learn to cat /VERSION  
RICLIFE_HISTORY =   "" +
    "1.2.1 # 2017-11-24 Fixed numer of things and got it to RUN! Also saved Gemfile.lock (when does it recapit to me!)" +
    "1.2.0 # 2017-11-05 Rails v2.3.18 and new stuff to make this work " +
	  "1.1.0 # 2012-MM-DD SMTP TLS gmail ruscoric :)" +
    "0.9.3 # 20YY-MM-DD updated to rails 2.3.5 e un sacco di altro.."

require File.join(File.dirname(__FILE__), 'boot')
#require 'icalendar-1.1.0/lib/icalendar'

# 20110330 Added for support for ruby1.9 Riccardo, to be added between BOOT and INITIALIZER
# http://excid3.com/blog/2011/02/undefined-local-variable-or-method-version_requirements-for-nameerror/
if Gem::VERSION >= "1.3.6"
  module Rails
    class GemDependency
      def requirement
        r = super
        (r == Gem::Requirement.default) ? nil : r
      end
    end
  end
end

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  
  
  #config.gem "pincopallo"   if (RAILS_ENV == 'development')
  config.gem "calendar_date_select" # per le date
  config.gem "contacts" # per i contatti gmail, ...
  config.gem "geoip"    # automatic address resolution
  #config.gem "geokit" # per google maps
  config.gem "hpricot"  # something asks for it!
  # icalendar gives error: 
  # component.rb:206:in `generate_multi_setter': compile error (SyntaxError)
  # {}component.rb:201: undefined (?...) sequence: /^[^"].*(?<!\\),.*[^"]$/
  # {}component.rb:202: undefined (?...) sequence: /(?<!\\),
  # https://github.com/icalendar/icalendar/issues/48
  # seem to need icalendar v1.4.3
  config.gem "icalendar" # non ricordo
  config.gem "openrain-action_mailer_tls", :lib => "smtp_tls.rb", :source => "http://gems.github.com"
  config.gem "sqlite3"  # for naive DB... :)
  config.gem "ym4r"     # non ricordo
  

  #config.active_record.observers = :user_observer
  
  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"



  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
  
  #RICLIFE_CASINO
  #config.active_record.observers = :user_observer
  

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
end# These defaults are used in GeoKit::Mappable.distance_to and in acts_as_mappable

#GeoKit::default_units = :miles
GeoKit::default_units = :kms
GeoKit::default_formula = :sphere
GeoKit::Geocoders::timeout = 2
GeoKit::Geocoders::proxy_addr = nil
GeoKit::Geocoders::proxy_port = nil
GeoKit::Geocoders::proxy_user = nil
GeoKit::Geocoders::proxy_pass = nil
GeoKit::Geocoders::yahoo = 'REPLACE_WITH_YOUR_YAHOO_KEY'
# and http://www.google.com/apis/maps/documentation/#Geocoding_Examples
GeoKit::Geocoders::google = 'REPLACE_WITH_YOUR_GOOGLE_KEY'
GeoKit::Geocoders::geocoder_us = false 
# and http://geocoder.ca/?register=1
GeoKit::Geocoders::geocoder_ca = false
GeoKit::Geocoders::provider_order = [:google,:yahoo,:us]
