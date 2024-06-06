class UserMailer < ApplicationMailer
    require 'csv'
    def people_report(user)
        @people = Person.order(:name)
        @user = user
        csv_contem = generate_csv()
        
        attachments['people_x_balance.csv'] = {mime_type: 'text/csv',content: csv_contem}
        mail(to: user.email, subject: 'People Report', attachments: attachments)
    end

    def generate_csv()
        CSV.generate(headers: true) do |csv|
            csv << ["Name", "Saldo"]
            @people.each do |person|
            csv << [person.name, person.balance]
            end
        end
    end
end
