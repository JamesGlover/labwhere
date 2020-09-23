# frozen_string_literal: true

namespace :labwares do
  desc "generate a number of fake barcodes to enter into scan page"
  task :generate_barcodes, [:num] => :environment do |_t, args|
    next_id = Labware.last.nil? ? 1 : Labware.last.id + 1
    next_id.upto(next_id + args.num.to_i - 1) do |i|
      puts "Labware:#{i}"
    end
  end

  task :generate_labwares, [:num] => :environment do |_t, args|
    spinner = "🕛🕧🕐🕜🕑🕝🕒🕞🕓🕟🕔🕠🕕🕡🕖🕢🕗🕣🕘🕤🕙🕥🕚🕦".chars.cycle
    core = DateTime.now.strftime("%Y%m%d%H%M%S")
    locations = Location.where(container: true).pluck(:id)
    args.num.to_i.times do |i|
      print "\r\33[2K #{spinner.next} Processing #{i} of #{args.num}"
      Labware.new(location_id: locations.sample, barcode: "#{core}#{i}", uuid: SecureRandom.uuid)
             .save!(validate: false)
    end
  end
end
