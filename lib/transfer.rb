class Transfer

  attr_accessor :balance, :deposit, :status, :amount,:sender, :receiver 

    def initialize(sender, receiver, amount)
      @sender = sender 
      @receiver = receiver
      @status = "pending"
      @amount = amount
    end 

    def valid? 
     sender.valid? && receiver.valid? 
    end 

    def execute_transaction 
     if valid? && sender.balance > @amount && self.status == "pending"
      onetransfer 
     else  
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
      end  
    end

    def onetransfer
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
      end 

    def reverse_transfer
      if @status == "complete"
        sender.balance += @amount
        receiver.balance -= @amount 
        self.status = "reversed"
      else  
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end 
    end 
end 
