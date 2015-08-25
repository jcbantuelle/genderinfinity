class LocationImporter

  CSV_COLUMNS = {
    name: 0,
    phone: 1,
    contact: 2,
    address: 3,
    notes: 4
  }

  def initialize(file)
    @file = file
    @errors = []
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
    CSV.foreach(@file.tempfile.path) do |row|
      Location.create Hash[parsed_row(row)]
    end
  end

  def success?
    @errors.empty?
  end

  def valid_file?
    @file.content_type == 'text/csv'
  end

  def parsed_row(row)
    CSV_COLUMNS.map{ |field, column|
      [field, row[column]]
    }
  end

end
