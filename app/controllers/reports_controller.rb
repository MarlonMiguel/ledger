class ReportsController < ApplicationController
  def balance
    UserMailer.people_report(current_user).deliver_later
    redirect_to root_path, notice: 'Você recebera um relatório por email'
  end
end
