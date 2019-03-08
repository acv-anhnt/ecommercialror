class Payment < ActiveRecord::Base
  belongs_to :order

  def paypal_url(return_path, notify_path)
    values = {
        business: "soaptavish1993-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: return_path,
        invoice: id,
        amount: order.total_price,
        item_name: 'Example order',
        item_number: order.id,
        quantity: 1,
        notify_url: notify_path
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

end