module Yodaism
  class Command
    class << self
      def execute(*args)
        command = args.shift
        major = args.shift
        minor = args.empty? ? nil : args.join(' ')

        output(Yodaism.quote.random) unless command
        parse_commands(command, major, minor)
      end

      def parse_commands(command, major, minor)
        return ascii_yoda   if command == "ascii"
        return version      if command == "version"
        return help_yoda    if command == "help"
      end

      def ascii_yoda
        output(Yodaism.quote.ascii)
      end

      def help_yoda
        text = %{
        - yodaism: help ---------------------------------------------------
        yodaism                       outputs a random yoda quote
        yodaism ascii                 outputs a ascii yoda with a quote
        yodaism version               outputs the current version
        }.gsub(/^ {8}/, '')
        output text
      end

      def version
        output "You're running with yoda version #{Yodaism::VERSION}. Congrats!"
      end

      def output(s)
        puts(s)
      end
    end
  end
end
