namespace :web do
  desc "get request for root"

  task :get_root => :environment do
    session = ActionDispatch::Integration::Session.new(Rails.application)
    session.get "/"
    puts 'success!'
  end

end
