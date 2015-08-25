Geocoder.configure(
  :lookup       => :google,
  :use_https    => true,
  :api_key      => ENV['GOOGLE_GEOCODING_API']
)
