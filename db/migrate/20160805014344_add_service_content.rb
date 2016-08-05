class AddServiceContent < ActiveRecord::Migration
  def change
    services = [
      'educational resources',
      'health',
      'legal',
      'child / youth',
      'personal care',
      'social support',
      'surgery',
      'mental health',
      'spiritual wellness'
    ]

    Service.create(services.map{|service| {name: service}})
  end
end
