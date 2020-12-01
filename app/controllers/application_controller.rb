class ApplicationController < ActionController::API
  def send_order(order, email, html)
  mg_client = Mailgun::Client.new ENV['MAIL_API_KEY']

    message_params =
      { from: 'PJ-Api <noreply@myimage.tk>',
        to: email,
       subject: "Orden generada correctamente #{order.created_at.strftime('%d/%m/%Y')}!",
      html: html

     }
      mg_client.send_message 'myimage.tk', message_params
  end
end
