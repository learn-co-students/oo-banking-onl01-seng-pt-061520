class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? && @sender.balance >= @amount && @sender.balance <= @sender.balance && @status = "pending"
      
      @receiver.balance = @receiver.balance + @amount
      @sender.balance = @sender.balance - @amount
      @status = "complete"
  elsif sender.valid? && @status = "complete"
      @receiver.balance = @receiver.balance
      @sender.balance = @sender.balance

      
  else
    @status = "Transaction rejected. Please check your account balance."
  end
end 



  def reverse_transfer
     @sender.balance = 1000
     @receiver.balance = 1000
     @status = "reversed"
  end



end
