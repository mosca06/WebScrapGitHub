require 'nokogiri'
require 'open-uri'

module Webscrap
  class GitHub
    def initialize(profile)
      @profile = profile
      fetch_html_page
    end

    def self.call(profile)
      new(profile).call
    end

    def call
      run
    end

    private

    def run
      return @profile if @profile.errors.any?

      @profile[:followers_count] = find_total_followers
      @profile[:following_count] = find_total_following
      @profile[:repositories_count] = find_total_repositories
      @profile[:company] = find_company
      @profile[:location] = find_location
      @profile[:linkedin] = find_linkedin
      @profile
    end

    def fetch_html_page
      @link = "https://github.com/#{@profile[:name]}"
      @doc = Nokogiri::HTML(open_link)
    rescue OpenURI::HTTPError
      @profile.errors.add(:base, 'Erro, perfil não encontrado ')
    end

    def open_link
      URI.parse(@link).open
    end

    def find_total_followers
      followers_link = @doc.at_css('a[href*="followers"]')
      followers_link&.at_css('span')&.text
    end

    def find_total_following
      following_link = @doc.at_css('a[href*="following"]')
      following_link&.at_css('span')&.text
    end

    def find_total_repositories
      repositories_link = @doc.at_css("a[data-selected-links=\"repositories /#{@profile[:name]}?tab=repositories\"]")
      repositories_link&.at_css('span')&.attr('title')
    end

    def find_company
      company_link = @doc.at_css('li[itemprop="worksFor"] span div')
      company_link&.text
    end

    def find_location
      location = @doc.at_css('li[itemprop="homeLocation"] span.p-label')
      location&.text
    end

    def find_linkedin
      @doc.at_css('a[class="Link--primary"]')&.attr('href')
    end
  end
end
