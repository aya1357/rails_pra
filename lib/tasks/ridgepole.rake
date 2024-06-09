namespace :ridgepole do
  desc 'Apply database schema'
  task apply: :environment do
    ridgepole('--apply', "--file #{schema_file}")
    Rails::Command.invoke('db:schema:dump')
    Rake::Task['annotate_models'].invoke if defined?(Annotate) && Rails.env.development?
  end

  desc 'Export database schema'
  task export: :environment do
    ridgepole('--export', "--output #{Rails.root.join('db/export.Schemafile.rb')}")
  end

  private

  def schema_file
    Rails.root.join('db/Schemafile.rb')
  end

  def config_file
    Rails.root.join('config/database.yml')
  end

  def ridgepole(*options)
    command = ['bundle exec ridgepole', "--config #{config_file}", "--env #{Rails.env}"]
    system [command + options].join(' ')
  end
end
