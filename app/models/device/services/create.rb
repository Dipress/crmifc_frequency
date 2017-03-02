class Device
  module Services
    class Create
      attr_reader :device, :contract

      def initialize(device)
        @device = device
        @contract = find_contract
        set_frequency
      end

      def find_contract
        inet = InetService.find_by(login: device.login)
        raise ActiveRecord::RecordNotFound if inet.nil?
        Contract.find(inet.contractId)
      end

      def set_frequency
        if contract.contract_parameter_type1.where(pid: 75).empty?
          contract.contract_parameter_type1.where(pid: 75).create(val: device.frequency)
        end
        contract.contract_parameter_type1.where(pid: 75).update(val: device.frequency)
        device.update(contract_id: contract.id, contract_title: contract.title, contract_comment: contract.comment)
      end
    end
  end
end