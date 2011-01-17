=begin
                  Arachni
  Copyright (c) 2010-2011 Tasos "Zapotek" Laskos <tasos.laskos@gmail.com>

  This is free software; you can copy and distribute and modify
  this program under the term of the GPL v2.0 License
  (See LICENSE file for details)

=end

module Arachni

module Modules

#
# Simple shell command injection module.<br/>
# It audits links, forms and cookies.
#
#
# @author: Tasos "Zapotek" Laskos
#                                      <tasos.laskos@gmail.com>
#                                      <zapotek@segfault.gr>
# @version: 0.1.2
#
# @see http://cwe.mitre.org/data/definitions/78.html
# @see http://www.owasp.org/index.php/OS_Command_Injection
#
class SimpleCmdExec < Arachni::Module::Base

    def initialize( page )
        super( page )

        @__opts = {}
        @__opts[:regexp]   = /100434/ixm
        @__opts[:match]    = '100434'
        @__opts[:format]   = OPTIONS[:format] | [ Format::SEMICOLON ]
        @__injection_str   = 'expr 978 + 99456'

        @results = []
    end

    def run( )
        audit( @__injection_str, @__opts )
    end


    def self.info
        {
            :name           => 'SimpleCmdExec',
            :description    => %q{Simple shell command execution recon module},
            :elements       => [
                Issue::Element::FORM,
                Issue::Element::LINK,
                Issue::Element::COOKIE
            ],
            :author         => 'zapotek',
            :version        => '0.1.2',
            :references     => {
                 'OWASP'         => 'http://www.owasp.org/index.php/OS_Command_Injection'
            },
            :targets        => { 'Generic' => 'all' },
            :issue   => {
                :name        => %q{OS command injection},
                :description => %q{The web application allows an attacker to
                    execute arbitrary OS commands.},
                :cwe         => '78',
                :severity    => Issue::Severity::HIGH,
                :cvssv2       => '9.0',
                :remedy_guidance    => %q{User inputs must be validated and filtered
                    before being evaluated as OS level shell code.},
                :remedy_code => '',
                :metasploitable => 'unix/webapp/arachni_exec'
            }

        }
    end

end
end
end
