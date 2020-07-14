require "pry"
class Transfer
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def valid?
    # check that both accounts are valid
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    #execute a successful transaction
    #each transfer can only happen once
    #rejects a transfer if sender.valid? == false
    if sender.balance < self.amount || !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif sender.balance > self.amount && self.status == "pending" && self.valid?
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
    #reverse transfer between two accounts
    #can only reverser executed transfers
  end
end
