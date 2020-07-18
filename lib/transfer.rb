class Transfer
  # your code here
  attr_accessor :receiver, :status, :amount
  attr_reader :sender
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid? 
    # @status == "open" && @balance > 0 ? true : false
    sender.valid? && receiver.valid? ? true : false
  end

  # def execute_transaction
  #   if @sender.balance > @amount && @status == "pending"
  #     @sender.balance -= @amount
  #     @receiver.balance += @amount
  #      @status = "complete"
  #   else
  #     @status = "closed"
  #     # @status = "rejected"
  #     return "Transaction rejected. Please check your account balance."
  #   end 
  # end

  def execute_transaction
    if valid? && @sender.balance >= @amount && @sender.balance <= @sender.balance && @status == "pending"
      @receiver.balance = @receiver.balance + @amount
      @sender.balance = @sender.balance - @amount
      @status = "complete"
   else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    # # if valid? && @reciever.balance >=  @amount && @reciever.balance <= @sender.balance && @status == "pending"
    # #   @sender.balance = @sender.balance + @amount
    # #   @sender.balance = @sender.balance - @amount
    # #   @status = "complete"
    # end
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
