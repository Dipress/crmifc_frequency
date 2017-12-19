require 'json'
require 'net/ssh'

class ScrapDevicesTasks
  def self.putdata
    nodes = BaseStation.all.map { |node| node.ip }.to_a.compact.sort
    nodes.each do |n|
      begin
        data_hash = Hash.new

        Net::SSH.start("#{n}", ENV["bs_login"], password: ENV["bs_password"]) do |ssh|
          data_hash  = ssh.exec!("wstalist")
          ssh.close
        end
        array = JSON.parse(data_hash)
        station_id = BaseStation.where(ip: n).map {|node| node.id}.to_a.first
        array.map do |a|
          device = Device.where(login: "#{a['name']}")
          if device.empty?
            Device.create(
              base_station_id: station_id, 
              hardware_id: "591ffb1d61f9ce213f90712d", 
              mac: "#{a["mac"]}", 
              login: "#{a['name']}",
              ip: "#{a['lastip']}", 
              frequency: "0000"
              )
          else
            Device.update(
              base_station_id: station_id, 
              hardware_id: "591ffb1d61f9ce213f90712d", 
              mac: "#{a["mac"]}", 
              login: "#{a['name']}",
              ip: "#{a['lastip']}", 
              frequency: "0000"
              )
          end
        end
      rescue Errno::EHOSTUNREACH => e
        puts "#{e.message}"
      end
    end
  end
end