Order.class_eval do
  has_many :payment_notifications
  
  def shipment_cost
    adjustment_total - credit_total
  end
  
  def payable_via_paypal?
    !!self.class.paypal_payment_method
  end

  def self.paypal_payment_method
    PaymentMethod.available(:front_end).select{ |pm| pm if pm.name.downcase =~ /paypal/}.first
  end
end
