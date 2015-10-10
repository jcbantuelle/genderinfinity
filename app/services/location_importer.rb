class LocationImporter

  CSV_COLUMNS = {
    name: 0,
    specialties: 1,
    phone: 2,
    contact: 3,
    address: 4,
    notes: 5
  }

  def initialize(file)
    @file = file
    @errors = []
    @specialties = Specialty.all
  end

  def import
    if valid_file?
      read_file
    else
      @errors['format'] = 'File must be in CSV format'
    end
    success?
  end

  private

  def read_file
    CSV.foreach(@file.tempfile.path, :encoding => 'windows-1251:utf-8') do |location_row|
      location = location_hash(location_row)
      location[:specialties] = location_specialties(location[:specialties])
      Location.create(location)
    end
  end

  def success?
    @errors.empty?
  end

  def valid_file?
    @file.content_type == 'text/csv'
  end

  def location_hash(location)
    CSV_COLUMNS.map { |field, column|
      [field, location[column]]
    }.to_h
  end

  def location_specialties(location_specialties)
    specialty_names(location_specialties).map { |name|
      find_specialty(name.downcase.titleize)
    }
  end

  def specialty_names(location_specialties)
    location_specialties.nil? ? [] : location_specialties.split(';').map(&:strip)
  end

  def find_specialty(name)
    @specialties.find { |specialty|
      specialty.name == name
    } || create_missing_specialty(name)
  end

  def create_missing_specialty(missing_specialty)
    new_specialty = Specialty.create(name: missing_specialty)
    @specialties << new_specialty
    new_specialty
  end

end
