# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Add Firmware
Firmware.create(name: '-')
Firmware.create(name: '5.5.11')

# Add Hardware
ContractParameterType7Value.where(pid: 68).map do |hardware|
  Hardware.create(billing_hardware_id: hardware.id, name: hardware.title)
end

# Add Registered Frequency
i = 5000
while i <= 6000
  RegistrationFrequency.create(name: "#{i}")
  i += 5
end

# Add ActualFrequency
i = 5000
while i <= 6000
  ActualFrequency.create(name: "#{i}")
  i += 5
end

# Add Bandwidth
bandwidth = ['5 MHz', '10 MHz', '20 MHz', '40 MHz']
bandwidth.map do |band|
  Bandwidth.create(name: band)
end

# Add Antenna Type
types = ['-', 'Sector 90', 'Sector 120']
types.map do |type|
  AntennaType.create(name: type)
end 