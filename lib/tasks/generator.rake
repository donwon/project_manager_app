namespace :generator do

desc "Generate default Categories"
task :set_default_categories => :environment do
  ["Wellsites", "Pipelines", "Procurment", "Construction", 
    "Management", "Reconsolidation", "Reactivation", 
    "Tie-in", "Brown Field", "New, Amendment"].each do |name|
    Category.create(name: name)
  end
end

end
