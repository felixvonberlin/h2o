require "pathname"

module MRuby
  module Source
    # mruby's source root directory
    ROOT = Pathname.new(File.expand_path('../../../',__FILE__))

    # Reads a constant defined at version.h
    MRUBY_READ_VERSION_CONSTANT = Proc.new do |name|
      ROOT.join('include','mruby','version.h').read.match(/^#define #{name} +"?([\w\. ]+)"?\r?$/)[1]
    end

    MRUBY_RUBY_VERSION = MRUBY_READ_VERSION_CONSTANT['MRUBY_RUBY_VERSION']
    MRUBY_RUBY_ENGINE = MRUBY_READ_VERSION_CONSTANT['MRUBY_RUBY_ENGINE']

    MRUBY_RELEASE_MAJOR = Integer(MRUBY_READ_VERSION_CONSTANT['MRUBY_RELEASE_MAJOR'])
    MRUBY_RELEASE_MINOR = Integer(MRUBY_READ_VERSION_CONSTANT['MRUBY_RELEASE_MINOR'])
    MRUBY_RELEASE_TEENY = Integer(MRUBY_READ_VERSION_CONSTANT['MRUBY_RELEASE_TEENY'])

    MRUBY_VERSION = [MRUBY_RELEASE_MAJOR,MRUBY_RELEASE_MINOR,MRUBY_RELEASE_TEENY].join('.')
    MRUBY_RELEASE_NO = (MRUBY_RELEASE_MAJOR * 100 * 100 + MRUBY_RELEASE_MINOR * 100 + MRUBY_RELEASE_TEENY)

    MRUBY_RELEASE_YEAR = Integer(MRUBY_READ_VERSION_CONSTANT['MRUBY_RELEASE_YEAR'])
    MRUBY_RELEASE_MONTH = Integer(MRUBY_READ_VERSION_CONSTANT['MRUBY_RELEASE_MONTH'])
    MRUBY_RELEASE_DAY = Integer(MRUBY_READ_VERSION_CONSTANT['MRUBY_RELEASE_DAY'])
    MRUBY_RELEASE_DATE = [MRUBY_RELEASE_YEAR,MRUBY_RELEASE_MONTH,MRUBY_RELEASE_DAY].join('.')

    MRUBY_BIRTH_YEAR = Integer(MRUBY_READ_VERSION_CONSTANT['MRUBY_BIRTH_YEAR'])

    MRUBY_AUTHOR = MRUBY_READ_VERSION_CONSTANT['MRUBY_AUTHOR']
  end
end
