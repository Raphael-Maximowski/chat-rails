schemas_path = Rails.root.join('app', 'validators', 'schemas')
require File.join(schemas_path, 'message_base_schema')

# Depois os que herdam
require File.join(schemas_path, 'message_create_schema')
require File.join(schemas_path, 'message_update_schema')
