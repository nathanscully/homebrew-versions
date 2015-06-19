require 'formula'

class Grails23 < Formula
  homepage 'http://grails.org'
  url 'https://github.com/grails/grails-core/releases/download/v2.5.0/grails-2.5.0.zip'
  sha1 '3415b14440eb3fb0de7fb39964fc3d5a4d3ee0f9'

  def install
    rm_f Dir["bin/*.bat", "bin/cygrails", "*.bat"]
    prefix.install %w[LICENSE README]
    libexec.install Dir['*']
    bin.mkpath
    Dir["#{libexec}/bin/*"].each do |f|
      next unless File.extname(f).empty?
      ln_s f, bin+File.basename(f)
    end
  end
end
