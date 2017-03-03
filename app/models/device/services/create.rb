class Device
  module Services
    class Create
      attr_reader :device, :contract, :parameter

      def initialize(device)
        @device = device
        @contract = find_contract
        @parameter = find_parameter
        set_frequency
      end

      def find_contract
        inet = InetService.find_by(login: device.login)
        raise Device::Services::InetNotFound if inet.nil?
        Contract.find(inet.contractId)
      end

      def find_parameter
        parameter = contract.contract_parameter_type1.find_by(pid: 75)
        return parameter if parameter.present?
        contract.contract_parameter_type1.create(pid: 75)
        find_parameter
      end

      def set_frequency
        parameter.update(val: device.frequency)
        device.update(contract_id: contract.id,
                      contract_title: contract.title,
                      contract_comment: contract.comment)
      end
    end
  end
end
