require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance >= self.amount && self.status == "pending"
  end

  def execute_transaction
  #  binding.pry
    if self.valid?
      self.receiver.balance += amount
      self.sender.balance -= amount
      self.status = "complete"
    else
      self.status ="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
    self.sender.balance += amount
    self.receiver.balance -= amount
    self.status = "reversed"
    end
  end
end
