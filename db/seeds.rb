table_names = %w(users posts)
table_names.each do |table_name|
  path = Rails.root.join('db', 'seeds', Rails.env, "#{table_name}.rb")
  if File.exist?(path)
    puts "Craeting #{table_name}...."
    require(path)
  else
    puts "connot find #{table_name}.rb"
  end
end
