class ServerData::KeysController < ServerDataController

  inherit_resources
  defaults :resource_class => ServerData::Key, :collection_name => 'server_data_keys', :instance_name => 'server_data_key'

  belongs_to :group
  belongs_to :server

  custom_actions :resource => :private_key

  def private_key
    # todo : Log into audit

    begin
      key = resource.private_key
      status = 200
    rescue OpenSSL::Cipher::CipherError => e
      key = "Error : #{e.class} (Unable to open encrypted data)"
      status = 500
    end

    render :text => key, :status => status
  end

end
