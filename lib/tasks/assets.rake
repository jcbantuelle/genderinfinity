# lib/tasks/assets.rake

require 'zlib'

namespace :assets do
  task :gzip => :environment do
    logger = Logger.new(STDOUT)
    asset_root = Rails.root.join('public', 'assets')
    Dir["#{asset_root}/**/*.{js,css,html,svg}"].each do |asset|
      gz_asset_name = "#{asset}.gz"
      next if File.exist? gz_asset_name
      logger.info "#Compressing #{gz_asset_name}..."
      Zlib::GzipWriter.open(gz_asset_name, Zlib::BEST_COMPRESSION) do |gz_asset|
        gz_asset.mtime = File.mtime(asset)
        gz_asset.orig_name = asset
        gz_asset.write IO.binread(asset)
      end
    end
  end
end

Rake::Task['assets:precompile'].enhance { Rake::Task['assets:gzip'].invoke }
