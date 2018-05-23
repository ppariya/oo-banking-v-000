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
    if valid? && sender.balance > amount && status == "pending"
        sender.balance -= amount
        receiver.deposit(amount)
        @status = "complete"

    else
      reject_transfer

    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(amount)
      receiver.balance -= amount
      @status = "reversed"
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end
