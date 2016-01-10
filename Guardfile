guard :rspec, cmd: "bundle exec rspec" do

  watch(%r{^spec/(.+)_spec.rb}) do |m|
    "spec/#{m[1]}_spec.rb"
  end
  
  watch(%r{^(.+)\.rb}) do |m|
    "spec/#{m[1]}_spec.rb"
  end
end
