module InvestecOpenApi::Models
  class Account < Base
    attribute :id
    attribute :number
    attribute :name
    attribute :reference_name
    attribute :product_name

    has_many :transactions, class_name: "Transaction"

    def self.from_api(params = {})
      if params['accountId'].present?
        params['id'] = params['accountId']
      end

      if params['accountNumber'].present?
        params['number'] = params['accountNumber']
      end

      if params['accountName'].present?
        params['name'] = params['accountName']
      end

      super
    end

    def self.find(id)
      account = all.find { |acc| acc.id == id }
      raise InvestecOpenApi::NotFoundError unless account.present?

      account
    end

    def self.all
      client.accounts
    end
  end
end
