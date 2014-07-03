class ClientMailer < ActionMailer::Base
  default from: "artisan@joaillier.com"

    def valid_commande(client)
        # puts YAML::dump( clients )
        mail(to: client.email, subject: 'coucou hubou')
    end

    def mail_info(client)
        # puts YAML::dump( clients )
            mail(to: client.email, subject: 'coucou hubou')
    end
end
