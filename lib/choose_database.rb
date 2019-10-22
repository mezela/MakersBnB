def which_database

  if ENV['ENVIRONMENT'] == 'test'
    return 'makersbnb_test'
  else
    return 'makersbnb'
  end
  
end
