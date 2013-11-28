class DbConnect

  module ENV
    URL = ""
    PASS = ""
    DBNAME = ""
  end

  private

  def get_connection_status
    #TODO check the status of connection, use rescue when is wrong
  end

  def reconnect
    #TODO reconnect when is down
  end

  def fall_back_as_file
    #TODO as file
  end
end