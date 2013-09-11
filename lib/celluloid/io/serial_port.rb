require 'celluloid/io'
require 'serialport'

module Celluloid
  module IO
    class SerialPort < Stream
      extend Forwardable

      def_delegators :@port, :close, :write_nonblock, :read_nonblock
      def_delegators :@port, :modem_params, :modem_params=
      def_delegators :@port, :get_modem_params, :set_modem_params
      def_delegators :@port, :baud, :baud=, :data_bits, :data_bits=
      def_delegators :@port, :stop_bits, :stop_bits=, :parity, :parity=
      def_delegators :@port, :flow_control, :flow_control=, :break, :signals
      def_delegators :@port, :dtr, :dtr=, :rts=, :rts
      def_delegators :@port, :cts, :dsr, :dcd, :ri

      def self.open(*args, &block)
        port = new(*args)

        if block_given?
          begin
            yield port
          ensure
            port.close
          end
        end

        port
      end

      def initialize(port, *args)
        super()
        
        if port.is_a? ::SerialPort
          @port = port
          @port.read_timeout = 0
          return self
        end

        @port = ::SerialPort.new(port, *args)
        @port.read_timeout = 0
      end

      def to_io
        @port
      end

    end
  end
end