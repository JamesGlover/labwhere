# frozen_string_literal: true

Dir[Rails.root.join('lib/location_creator/*.rb')].each { |f| require f }

desc "locations"
namespace :locations do
  desc "create some locations"
  task :create, [:shelves, :trays] => :environment do |_t, args|
    args.with_defaults(:shelves => '2', :trays => '208')
    location_creator = LocationCreator.new("Site" => { location: "Sanger" },
                                           "Building" => { location: "Ogilvie" },
                                           "Room" => { location: "AA315" },
                                           "Shelf" => { location: "Shelf", number: args.shelves.to_i },
                                           "Tray" => { location: "Tray", number: args.trays.to_i })
    location_creator.run!
  end
end
