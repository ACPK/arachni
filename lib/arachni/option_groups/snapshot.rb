=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@arachni-scanner.com>

    This file is part of the Arachni Framework project and is subject to
    redistribution and commercial restrictions. Please see the Arachni Framework
    web site for more information on licensing and terms of use.
=end

module Arachni::OptionGroups

# @author Tasos "Zapotek" Laskos <tasos.laskos@arachni-scanner.com>
class Snapshot < Arachni::OptionGroup

    # @return    [String]
    #   Directory or file path where to store the scan snapshot.
    #
    # @see Framework#suspend
    attr_accessor :save_path

end
end

