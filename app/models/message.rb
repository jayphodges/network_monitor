class Message < ApplicationRecord
  belongs_to :device

  def self.by_hour
    group_by_hour(:created_at).count
  end

  def self.by_month
    Message.group_by_minute(:created_at).average(:ave)
  end

  def something
    Message.find_by_sql(
      "SELECT user.id, sum(invoice_items.quantity) AS quantity
        FROM items
        JOIN invoice_items
            ON items.id = invoice_items.item_id
        JOIN invoices
            ON invoice_items.invoice_id = invoices.id
        JOIN transactions
            ON transactions.invoice_id = invoices.id
            WHERE transactions.result = 'success'
        GROUP BY items.id
        ORDER BY quantity DESC
        LIMIT #{quantity};"
      )
    end
end
