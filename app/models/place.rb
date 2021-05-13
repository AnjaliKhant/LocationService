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
            # place = Place.find_or_create_by!(name: row['name'], latitude: row['lat'] ,longitude: row['lon'])
            place = Place.build_from_csv(row)
            # place.tag.build(tag_0: row['tag-0'], tag_1: row['tag-1'], tag_2: row['tag-2'], tag_3: row['tag-3'])
            if place.valid?
                place.save
            else
                @errors << row
            end
        end
    end

    def self.build_from_csv(row)
        # find existing customer from name or create new
        place = find_or_initialize_by(name: row[0])
        place.attributes ={:name => row[0],
                          :longitude => row[1],
                          :latitude => row[2]}
        return place
    end
end
