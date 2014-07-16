class Spawner
  @@gofer_pid = nil

  def self.spawn
    @@gofer_pid = Process.spawn("go run $GOPATH/src/github.com/arjunsharma/gobot/main.go", :pgroup => true)
    num_attempts = 0
    while num_attempts < 50
      begin
        uri = URI.parse("http://localhost:9999")
        Net::HTTP.get_response(uri)
        return
      rescue Errno::ECONNREFUSED
        num_attempts += 1
        sleep 0.1
      end
    end
  end

  def self.kill
    begin
      `kill -9 -#{Process.getpgid(@@gofer_pid)}`
    rescue Errno::ESRCH
    end
  end
end