class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.valid?
      if status == "pending"
        sender.balance -= amount
        receiver.deposit(amount)
        @status = "complete"
      end
    elsif !sender.valid?
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end



end
