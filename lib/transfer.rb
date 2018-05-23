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
    else
      @status = "rejected"
      puts "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(amount)
      receiver.balance -= amount
      @status = "reversed"
    end
  end


end
