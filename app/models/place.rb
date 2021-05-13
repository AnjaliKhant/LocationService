require 'csv'
class Place < ApplicationRecord
    has_one :tag

    reverse_geocoded_by :latitude, :longitude

    reverse_geocoded_by :latitude, :longitude do |obj,results|
        if geo = results.first
            obj.country = geo.country
            obj.zip_code = geo.postal_code
            obj.address = geo.address
        end
    end

    after_validation :reverse_geocode

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            place = Place.find_by(name: row['name'])
            if place.nil?
                place = Place.create!(name: row['name'], latitude: row['lat'] ,longitude: row['lon'])
                place.valid?
                place.create_tag(tag_0: row[3], tag_1: row[4], tag_2: row[5], tag_3: row[6])
            else
                place.update(name: row['name'], latitude: row['lat'] ,longitude: row['lon'])
                place.tag.destroy
                place.create_tag(tag_0: row[3], tag_1: row[4], tag_2: row[5], tag_3: row[6])
            end
        end
    end
end
