require 'mechanize'
require 'json'
require 'net/ssh'

class ScrapNodesTasks
  
  def self.cutdata
    mechanize = Mechanize.new
    nodes = BaseStation.all.map { |node| node.ip }.to_a.compact.sort

    nodes.each do |n|
      begin
        login_page = mechanize.get "http://#{n}:85"
        form = login_page.forms.first
        form.field_with(id: 'username').value = ENV["bs_login"]
        form.field_with(id: 'password').value = ENV["bs_password"]
        form.submit
      
        data_hash = Hash.new
        platform = ''
        data_hash = mechanize.get "http://#{n}:85/status.cgi"

        Net::SSH.start("#{n}", "control", password: "adm17in") do |ssh|
          platform  = ssh.exec!("mca-status | tr ',' '\n'")
          platform = platform.scan(/^platform=(.*)/) 
          ssh.close
        end
      
        station = BaseStation.where(ip: n)
        actual_frequency = ActualFrequency.where(name: JSON.parse(data_hash.body)["wireless"]["frequency"].gsub(/\s\w{3}/, '')).map {|m| m.id }.first
        bandwidth = Bandwidth.where(name: JSON.parse(data_hash.body)["wireless"]["chwidth"]).map {|m| m.id }.first
        hardware = Hardware.where(name: platform.first.join("")).map {|m| m.id }.first

        station.update(
          ssid: JSON.parse(data_hash.body)["wireless"]["essid"],
          mac: JSON.parse(data_hash.body)["interfaces"][2]["hwaddr"],
          actual_frequency_id: actual_frequency,
          bandwidth_id: bandwidth,
          hardware_id: hardware
          )
      rescue Errno::EHOSTUNREACH => e
        puts "#{e.message}"
      end
    end
    mechanize.shutdown
    sleep(10)
  end
end
