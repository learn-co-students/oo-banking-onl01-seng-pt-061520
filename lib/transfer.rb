class Transfer
	  attr_accessor :amount, :sender, :receiver, :transfer, :status 

  def initialize(sender, receiver, status = 'pending', amount)
    @sender = sender
    @receiver = receiver
    @transfer = transfer
    @status = status
    @amount = amount
  end

  def valid?
    sender.valid? == receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? && @sender.balance > @amount && @status == "pending"
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status= "complete"
    else
      @status= "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

   def reverse_transfer
    if @status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end


end 