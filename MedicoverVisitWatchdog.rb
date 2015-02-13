#!/usr/bin/ruby
require 'net/http'
require 'net/https'
require 'openssl'
require 'uri'
require 'json/pure'

# require 'rubygems'
# require 'nokogiri'
# require 'open-uri'

ContentURI = URI.parse("https://mol.medicover.pl/api/MyVisits/SearchFreeSlotsToBook?language=pl-PL")
#ContentURI.path

@api_token = "D5A28D7F604E3967801CD8F5E4684AF20592BC9ED1D26530A0CF19D18FD932920C8D7AB60E994FDE289AAD390C19872F5D721E82D0198A1801636453B9E7B53B89653B0DB5D4EB374CA53A86958AD3B41A91DF97C20E7C5F7E0942CD313E6D6AC2567DF1AF298E352E1F31ED870D061EE5962E7A019D7CB79BD9BA39A62CF201C806A16033110C7658864B7E7EAAA9F2A7AB709660DE81E33EB51684CE8FE7737D0977E1D7074D24F84D6439FEC06883C62C3BF4DB5A29B7BF2DC9B5345ED7EE7AB24B3B583BD98DF37E477A578C70818CE976214A223827F72EF071933C0200A771FA6C5C5EADDB31E0F4BEC1D93D93E05AFBEAE9D1B980B75E8567B683CDC393C1BCE45C20DD3879E16FCDEC4B602C690F91B9C8EEC3CCD95B9F8A638A636D782183FFB063E5D8A764F5932ADFD8FE063AA510BD3247526C34890C8AB5C6F869EACC87127D4870DE067E5DA495C2ADF34D654CEFE83C707E9AE50ECD432A677948868004FE379BA0484E6CDD72EF50358F310279FFCB006C9816A0CD97FE94F1B024C8421976F7407F2D18975256B1B2987B1EBB7642773E5ED4448B3DA54A5FE1C068060D9B3E772F5401BD5D9E8AEB466240464C41AC2AE477F7C107A6E06BB3C864A2E3BA756A16A3DFED26F97D6144899DCAC0E56029F30ECFDBDC6AA453B5631B8B25E2CD897FCEDDFC93BCA6"

@toSend = {
    "regionId" => 200,
    "bookingTypeId" => 2,
    "specializationId" => 3,
    "clinicId" => -1,
    "languageId" => -1,
    "doctorId" => -1,
    "searchSince" => "2015-02-13T02:00:00.000Z",
    "searchForNextSince" => nil,
    "periodOfTheDay" => 0,
    "isSetBecauseOfPcc" => false,
    "isSetBecausePromoteSpecialization" => false
}
  
req = Net::HTTP::Post.new('/api/MyVisits/SearchFreeSlotsToBook?language=pl-PL', initheader = {
  'X-Requested-With' => 'XMLHttpRequest',
  'Content-Type' =>'application/json', 
  'Cookie' => '.ASPXAUTH=' + "#{@api_token}" + ';'
})

req.body = "#{@toSend.to_json}"
https = Net::HTTP.new(ContentURI.host, ContentURI.port)
https.use_ssl = true
resp = https.start { |cx| cx.request(req) }
respJson = JSON.parse(resp.body)
# p @toSend
p req['header']
p resp
p resp.message
# p resp.body
p respJson['FirstPossibleAppointmentDate']
p respJson

# make api token prolongate
reqRefresh = Net::HTTP::Get.new('/MyVisits', initheader = {
  'Cookie' => '.ASPXAUTH=' + "#{@api_token}" + ';'
})
respRefresh = https.start { |cx| cx.request(reqRefresh) }
# respJson = JSON.parse(resp.body)
p respRefresh
p respRefresh.message
