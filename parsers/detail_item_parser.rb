# encoding: utf-8

=begin
  Klasa parsera służącego do pobierania szczegółowych danych o zgłoszeniu
=end

require_relative 'base_parser'

class DetailItemParser < BaseParser
  @@subpage_uri = 'show_bug.cgi?ctype=xml&id='

  def initialize(id)
    @results = {
      :fields => Hash.new,
      :comments => Hash.new,
      :attachments => Hash.new,
      :people => Hash.new,
      :ccs => Hash.new
    }
    #puts id
    item_html = load_file(@@subpage_uri + id)
    current_is_comment = false
    current_is_attachment = false
    id = ""
    author_fullname = ""
    author_nickname = ""
    date = ""
    text = ""
    last_modified = ""
    description = ""
    filename = ""
    file_type = ""
    file_size = ""
    attacher = ""
    #CommentStructure = Struct.new(:id, :author_fullname, :author_nickname, :date, :text)
    item_regex_occurances = item_html.scan(/<(?!\bbug\b)(\w+?)(?: name="([^\n]*)")*>(.+?)<\/\1>/m)
    item_regex_occurances.each do |item_info|
      #Schemat komentarzy: ID, twórca, data wystawienia, treść
      if (item_info[0] == "commentid")
        current_is_comment = true
      end
      #Schemat załączników: ID, data dodania, data ostatniej modyfikacji, opis, nazwa pliku, typ pliku,
      #rozmiar pliku, osoba dodająca 
      if (item_info[0] == "attachid" && !current_is_comment)
        current_is_attachment = true
      end
      if (current_is_comment)
        if (item_info[0] == "commentid")
          id = item_info[2]
        elsif (item_info[0] == "who")
          author_fullname = item_info[1]
          author_nickname = item_info[2]
        elsif (item_info[0] == "bug_when")
          date = item_info[2]
        elsif (item_info[0] == "thetext")
          text = item_info[2]
          comment = {
            :id => id,
            :author_fullname => author_fullname,
            :author_nickname => author_nickname,
            :date => date,
            :text => text
          }
          @results[:comments][comment[:id]] = comment
          current_is_comment = false
        end
      elsif (current_is_attachment)
        if (item_info[0] == "attachid")
          id = item_info[2]
        elsif (item_info[0] == "date")
          date = item_info[2]
        elsif (item_info[0] == "delta_ts")
          last_modified = item_info[2]
        elsif (item_info[0] == "desc")
          description = item_info[2]
        elsif (item_info[0] == "filename")
          filename = item_info[2]
        elsif (item_info[0] == "type")
          file_type = item_info[2]
        elsif (item_info[0] == "size")
          file_size = item_info[2]
        elsif (item_info[0] == "attacher")
          attacher = item_info[2]
          attachment = {
            :id => id,
            :date => date,
            :last_modified => last_modified,
            :description => description,
            :filename => filename,
            :file_type => file_type,
            :file_size => file_size,
            :attacher => attacher
          }
          @results[:attachments][attachment[:id]] = attachment
          current_is_attachment = false
        end
      elsif (item_info[0] == "reporter" || item_info[0] == "assigned_to")
        person = {
          :state => item_info[0],
          :fullname => item_info[1],
          :nickname => item_info[2]
        }
        @results[:people][person[:state]] = person
      elsif (item_info[0] == "cc")
        @results[:ccs][item_info[2]] = item_info[2]
      else  
        field = {
          :name => item_info[0],
          :value => item_info[2]
        }
        @results[:fields][field[:name]] = field
      end
    end
  end

  def get_all_info_array()
    return @results
  end

  def subpage_uri_by_product_name(name)
    @results.each do |result|
      return result[:subpage_uri] if result[:name] == name
    end
  end

  def uri_name_by_product_name(name)
    @results.each do |result|
      return result[:uri_name] if result[:name] == name
    end
  end

  def product_info_by_product_name(name)
    @results.each do |result|
      return result if result[:name] == name
    end
  end

end