class ClientMailer < ActionMailer::Base
  default from: "artisan@joaillier.com"

  def valid_commande(client)
    @client = client
    mail(to: "s_kantari@hotmail.fr", subject: 'coucou hubou')
  end
end
