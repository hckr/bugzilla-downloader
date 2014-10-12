=begin
  Testy jednostkowe dla klasy parsera listy produktów
=end

require 'test/unit'
require_relative '../products_list_parser'

class TestProductsListParser < Test::Unit::TestCase
  def setup()
    @html = %{
<table align="center" border="0" width="600" cellpadding="5" cellspacing="0"><tr>
          <td><a href="describecomponents.cgi?product=Core">
              <img src="extensions/BMO/web/producticons/component.png" height="64" width="64" border="0"></a></td>
          <td><h2 align="left" style="margin-bottom: 0px"><a href="describecomponents.cgi?product=Core">Core</a>:</h2>
                <p style="margin-top: 0px;">Shared components used by Firefox and other Mozilla software, including handling of Web content; Gecko, HTML, CSS, layout, DOM, scripts, images, networking, etc. Issues with web page layout probably go here, while Firefox user interface issues belong in the <a href="https://bugzilla.mozilla.org/editproducts.cgi?action=edit&amp;product=Firefox">Firefox</a> product. (<a href="https://wiki.mozilla.org/Modules/All#Core">More info</a>)</p>
          </td>
        </tr><tr>
          <td><a href="describecomponents.cgi?product=Firefox">
              <img src="extensions/BMO/web/producticons/firefox.png" height="64" width="64" border="0"></a></td>
          <td><h2 align="left" style="margin-bottom: 0px"><a href="describecomponents.cgi?product=Firefox">Firefox</a>:</h2>
                <p style="margin-top: 0px;">For bugs in  Firefox Desktop, the Mozilla Foundation's web browser. For Firefox user interface issues in menus, developer tools, bookmarks, location bar, and preferences. Many Firefox bugs will either be filed here or in the <a href="https://bugzilla.mozilla.org/describecomponents.cgi?product=Core">Core</a> product.   (<a href="https://wiki.mozilla.org/Modules/All#Firefox">more info</a>)</p>
          </td>
        </tr><tr>
          <td><a href="describecomponents.cgi?product=Firefox%20OS">
              <img src="extensions/BMO/web/producticons/firefox_os.png" height="64" width="64" border="0"></a></td>
          <td><h2 align="left" style="margin-bottom: 0px"><a href="describecomponents.cgi?product=Firefox%20OS">Firefox&nbsp;OS</a>:</h2>
                <p style="margin-top: 0px;">FirefoxOS, or Boot2Gecko (B2G) is Mozilla's operating system built on web standards. (<a href="https://wiki.mozilla.org/B2G">more info</a>)</p>
          </td>
        </tr><tr>
          <td><a href="describecomponents.cgi?product=Firefox%20for%20Android">
              <img src="extensions/BMO/web/producticons/firefox_android.png" height="64" width="64" border="0"></a></td>
          <td><h2 align="left" style="margin-bottom: 0px"><a href="describecomponents.cgi?product=Firefox%20for%20Android">Firefox&nbsp;for&nbsp;Android</a>:</h2>
                <p style="margin-top: 0px;">Firefox for Android is a mobile version of Firefox for Android devices. (<a href="http://wiki.mozilla.org/Mobile/FennecVision">more info</a>)</p>
          </td>
        </tr><tr>
          <td><a href="describecomponents.cgi?product=Marketplace">
              <img src="extensions/BMO/web/producticons/marketplace.png" height="64" width="64" border="0"></a></td>
          <td><h2 align="left" style="margin-bottom: 0px"><a href="describecomponents.cgi?product=Marketplace">Marketplace</a>:</h2>
                <p style="margin-top: 0px;">Mozilla's website (<a href="https://marketplace.firefox.com">marketplace.firefox.com</a>) to bring personalized discovery, worldwide distribution, and easy payments to the largest platform for app development: the Web. (<a href="https://wiki.mozilla.org/Marketplace">more info</a>)</p>
          </td>
        </tr><tr>
          <td><a href="describecomponents.cgi?product=Webmaker">
              <img src="extensions/BMO/web/producticons/webmaker.png" height="64" width="64" border="0"></a></td>
          <td><h2 align="left" style="margin-bottom: 0px"><a href="describecomponents.cgi?product=Webmaker">Webmaker</a>:</h2>
                <p style="margin-top: 0px;">The Mozilla Foundation's project to build a generation of web makers (<a href="https://wiki.mozilla.org/Webmaker/Product">More info</a>)</p>
          </td>
        </tr><tr>
          <td><a href="describecomponents.cgi?product=Toolkit">
              <img src="extensions/BMO/web/producticons/component.png" height="64" width="64" border="0"></a></td>
          <td><h2 align="left" style="margin-bottom: 0px"><a href="describecomponents.cgi?product=Toolkit">Toolkit</a>:</h2>
                <p style="margin-top: 0px;">The Mozilla Toolkit is a set of APIs, built on top of Gecko, which provide advanced services to XUL applications. These services include Profile Management, Chrome Registration, Browsing History, Extension and Theme Management, Application Update Service, and Safe Mode. (<a href="https://wiki.mozilla.org/Modules/Toolkit">More info</a>)</p>
          </td>
        </tr><tr>
          <td><a href="describecomponents.cgi?product=Thunderbird">
              <img src="extensions/BMO/web/producticons/thunderbird.png" height="64" width="64" border="0"></a></td>
          <td><h2 align="left" style="margin-bottom: 0px"><a href="describecomponents.cgi?product=Thunderbird">Thunderbird</a>:</h2>
                <p style="margin-top: 0px;">Email client originally developed by the Mozilla Foundation and now maintained by its community. (<a href="https://wiki.mozilla.org/Thunderbird">more info</a>)</p>
          </td>
        </tr><tr>
          <td><a href="describecomponents.cgi?product=SeaMonkey">
              <img src="extensions/BMO/web/producticons/seamonkey.png" height="64" width="64" border="0"></a></td>
          <td><h2 align="left" style="margin-bottom: 0px"><a href="describecomponents.cgi?product=SeaMonkey">SeaMonkey</a>:</h2>
                <p style="margin-top: 0px;">An all-in-one internet application suite, including web browser, e-mail and newsgroup client, and HTML composer. (<a href="http://www.seamonkey-project.org/">more info</a>)</p>
          </td>
        </tr><tr>
          <td><a href="describecomponents.cgi?product=Mozilla%20Localizations">
              <img src="extensions/BMO/web/producticons/localization.png" height="64" width="64" border="0"></a></td>
          <td><h2 align="left" style="margin-bottom: 0px"><a href="describecomponents.cgi?product=Mozilla%20Localizations">Mozilla&nbsp;Localizations</a>:</h2>
                <p style="margin-top: 0px;">Translation, spelling and other errors in language
packs and localized builds (<a href="https://wiki.mozilla.org/L10n:Home_Page">more info</a>)</p>
          </td>
        </tr><tr>
          <td><a href="describecomponents.cgi?product=Mozilla%20Services">
              <img src="extensions/BMO/web/producticons/sync.png" height="64" width="64" border="0"></a></td>
          <td><h2 align="left" style="margin-bottom: 0px"><a href="describecomponents.cgi?product=Mozilla%20Services">Mozilla&nbsp;Services</a>:</h2>
                <p style="margin-top: 0px;">For bugs in Firefox Sync, Firefox Home, metrics, Health Report, Server, Share, and other services. (<a href="https://wiki.mozilla.org/Services">more info</a>)</p>
          </td>
        </tr>
<tr>
   <td><a href="describecomponents.cgi?full=1">
             <img src="extensions/BMO/web/producticons/other.png" height="64" width="64" border="0"></a></td>
   <td><h2 align="left" style="margin-bottom: 0px;"><a href="describecomponents.cgi?full=1">
             Other Products</a></h2>
       <p style="margin-top: 0px;">Other Mozilla products which aren't listed here</p>
   </td>
</tr>
</table>
    }
  end

  def test_products_list_parser()
    products_parser = ProductsListParser.new(@html)
    expected = [
      {:name=>"Core", :subpage_uri=>"describecomponents.cgi?product=Core"},
      {:name=>"Firefox", :subpage_uri=>"describecomponents.cgi?product=Firefox"},
      {:name=>"Firefox OS", :subpage_uri=>"describecomponents.cgi?product=Firefox%20OS"},
      {:name=>"Firefox for Android", :subpage_uri=>"describecomponents.cgi?product=Firefox%20for%20Android"},
      {:name=>"Marketplace", :subpage_uri=>"describecomponents.cgi?product=Marketplace"},
      {:name=>"Webmaker", :subpage_uri=>"describecomponents.cgi?product=Webmaker"},
      {:name=>"Toolkit", :subpage_uri=>"describecomponents.cgi?product=Toolkit"},
      {:name=>"Thunderbird", :subpage_uri=>"describecomponents.cgi?product=Thunderbird"},
      {:name=>"SeaMonkey", :subpage_uri=>"describecomponents.cgi?product=SeaMonkey"},
      {:name=>"Mozilla Localizations", :subpage_uri=>"describecomponents.cgi?product=Mozilla%20Localizations"},
      {:name=>"Mozilla Services", :subpage_uri=>"describecomponents.cgi?product=Mozilla%20Services"}
    ]
    assert_equal(expected, products_parser.results)
  end
end