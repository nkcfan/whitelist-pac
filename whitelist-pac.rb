require 'sinatra'

replace_map = {
  /var\s+PROXY_METHOD\s*=.*?[;\n]/ => '',
  /return\s+"DIRECT"/ => 'return DIRECT_METHOD',
}

pac_template = ''
File.open('gfw_whitelist/whitelist.pac') do |f|
  while line = f.gets
    replace_map.each do |ma, re|
      line.gsub!(ma, re)
    end
    pac_template += line
  end
end

before do
  content_type 'application/octet-stream'
  headers('Content-Disposition' => 'attachment; filename="whitelist.pac"')
end

get '/whitelist.pac' do
  param_proxy = params['proxy']
  param_proxy ||= 'DIRECT'
  param_direct = params['direct']
  param_direct ||= 'DIRECT'
  p param_direct
  
  %Q{var PROXY_METHOD = '#{param_proxy}';
var DIRECT_METHOD = '#{param_direct}';
#{pac_template}}
end
