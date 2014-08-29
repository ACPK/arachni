require 'spec_helper'

describe name_from_filename do
    include_examples 'check'

    def self.platforms
        [:php, :asp, :jsp]
    end

    def self.elements
        [ Element::Form, Element::Link, Element::Cookie, Element::Header,
          Element::LinkTemplate ]
    end

    def issue_count_per_element
        {
            Element::Form         => 6,
            Element::Link         => 6,
            Element::Cookie       => 6,
            Element::Header       => 6,
            Element::LinkTemplate => 5
        }
    end

    easy_test
end
