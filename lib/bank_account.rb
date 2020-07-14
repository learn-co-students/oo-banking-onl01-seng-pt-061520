class BankAccount

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  attr_reader :name
  attr_accessor :balance, :status

  def deposit(deposit)
    self.balance += deposit
    #can deposit money into it's account
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    #can close its acccount
    self.status = "closed"
  end

end
