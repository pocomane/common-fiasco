#!/usr/bin/lua

package.path = package.path .. ';util/?.lua'

local function extract_section_nest(section, x, s)
  local sep = ('#'):rep(s)
  local heading = ''
  local pos_prev = 1
  while pos_prev do
    local hb, he = x:find('[\r\n]'..sep..'[^#][^\r\n]*', pos_prev)
    if heading then
      section[heading]= x:sub(pos_prev, hb or #x)
    end
    if hb then
      heading = x:sub(hb+1,he)
    end
    if not he then
      pos_prev = nil
    else
      pos_prev = he + 1
    end
  end
end

local function extract_section(x)
  local section = {}
  extract_section_nest(section, x, 1)
  local section_2 = {}
  for _, x in pairs(section) do
    extract_section_nest(section_2, x, 2)
  end
  local section_3 = {}
  for _, x in pairs(section_2) do
    extract_section_nest(section_3, x, 3)
  end
  for k, v in pairs(section_3) do section[k] = v end
  for k, v in pairs(section_2) do section[k] = v end
  return section
end

local function render(x)

  local t, e = io.open('build/tmp.md', 'w')
  if e then error(e) end
  t:write(x,'\n')
  t:close()
  local t, err = io.popen('markdown -f footnotes build/tmp.md')
  if e then error(e) end
  x = t:read('a')
  t:close()

  x = x:gsub('<h(.)>Scenario ([%d]*)</h.>',function(a,b)
    local result = '<h'..a..'>Scenario '..b..'</h'..a..'>'
    if 1 == tonumber(b)%3 then result = '<div class="PageBreak"></div>' .. result end
    return result
  end)
  -- x = x:gsub('<(.*)>([^\n]-)</(.*)>', function(a,b,c)
  --   if a ~= c then return nil end
  --   if a == 'h1' and b:match('^[^\n]*License') then return '<div class="PageBreak"></div>'..'<'..a..'>'..b..'</'..c..'>' end
  --   if a == 'h3' and b:match('^Scenario') then return '<h3 class="HeadScenario>'..b..'</h3>' end
  --   if a == 'li' and b:match('^Player') then return '<li class="ItemPlayer>'..b..'</li>' end
  -- end)
  x = x:gsub('<h1>[^\n]*License','<div class="PageBreak"></div>%0')
  x = x:gsub('(<li>)(Player[^\n]*)','%1<div class="ItemPlayer">%2</div>')
  x = x:gsub('<h3>Scenario','<h3 class="HeadScenario">Scenario')

  x = [[
  <!doctype html>
  <html>
  <head>
      <title>Example</title>
      <meta charset="utf-8" />
      <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <style type="text/css">
        :root {
          --FSA: 5.6mm;
          --FSB: 4.9mm;
          --FSC: 4.6mm;
          --FSD: 3.2mm;
          --FSE: 2.8mm;
        }
        @font-face {
          font-family: "thefont";
          src: url(../util/gentium.ttf) format("truetype");
        }
        @page {
          size: A5;
          margin-bottom: 17mm;
          margin-top: 12mm;
        }
        @page :left {
          margin-left: 23mm;
          margin-right: 20mm;
        }
        @page :right {
          margin-left: 20mm;
          margin-right: 23mm;
        }
        body {
          font-family: "thefont";
          font-size: var(--FSD);
          line-height: var(--FSC);
          text-align: justify;
        }
        /*
        .PageBreak {
          page-break-after: always;
        }
        */
        ul {
          list-style-type: none;
          padding-left: 0pt;
        }
        .HeadScenario {
          margin-bottom: 0;
          padding-bottom: 0;
        }
        .ItemPlayer {
          text-transform: uppercase;
          font-size: var(--FSE);
          padding-left: 30pt;
          margin: 4pt;
        }
        strong {
          text-transform: uppercase;
          font-size: var(--FSE);
          margin-left: 5pt;
          margin-right: 5pt;
        }
        h1 {
          text-align: center;
          text-transform: uppercase;
          font-size: var(--FSB);
        }
        h2 {
          text-align: center;
          text-transform: uppercase;
          font-size: var(--FSD);
        }
        h3 {
          text-transform: uppercase;
          font-size: var(--FSD);
        }
        h1:first-letter {
          font-size: var(--FSA);
        }
        h2:first-letter {
          font-size: var(--FSC);
        }
        h3:first-letter {
          font-size: var(--FSC);
        }
        h1:first-letter {
          font-size: var(--FSA);
        }
        h2:first-letter {
          font-size: var(--FSB);
        }
        h3:first-letter {
          font-size: var(--FSC);
        }
      </style>    
  </head>
  <body>
  <div>
  ]] .. x .. [[
  </div>
  </body>
  </html>
  ]]

  return x
end

-----------------------------------------------------------------------------------

os.execute('mkdir build')
local ok, st, err = os.execute('echo CommonFiasco.md > build/files.txt')
if 'exit' ~= st then error(err) end
os.execute('find playset/ -name "*.md" >> build/files.txt')

local f, e = io.open('build/files.txt', 'r')
if e then error(e) end
local fileliststr = f:read('a')
f:close()

-- fileliststr = ''
-- fileliststr = fileliststr .. 'CommonFiasco.md\n'
-- fileliststr = fileliststr .. 'playset/ScienceComics.md\n'
-- fileliststr = fileliststr .. 'playset/Borderlands.md\n'

local library = {}
local f, e = io.open('playset/text_pieces.txt', 'r')
if e then error(e) end
local x = f:read('a')
f:close()
library["text_pieces.txt"] = extract_section(x)
for src in fileliststr:gmatch('[^\n]*') do
  local nam = src:match('[^/\\]*$')
  if '' ~= nam then
    local f, e = io.open(src, 'r')
    if e then error(e) end
    local x = f:read('a')
    f:close()
    library[nam] = extract_section(x)
  end
end

for src in fileliststr:gmatch('[^\n]*') do

  local dst = src:match('[^/\\]*$')
  if '' ~= dst then
    dst = dst:gsub('%..*$','')
    print('generating '..dst..'.pdf')

    local f, e = io.open(src, 'r')
    if e then error(e) end
    local playset = f:read('a')
    f:close()

    while true do
      local expanded = playset:gsub('{{import:([^:]*):([^}]*)}}',function(a,b)
        if nil == library[a] then error('no file "'..a..'" found') end
        if nil == library[a][b] then error('no section "'..b..'" found in file "'..a..'"') end
        return library[a][b]
      end)
      if expanded == playset then break end
      playset = expanded
    end

    local x=render(playset)

    local f, e = io.open('build/'..dst..'.html', 'wb')
    if e then error(e) end

    f:write(x)
    f:close()

    local ok, st, err = os.execute('weasyprint build/'..dst..'.html build/'..dst..'.pdf')
    if 'exit' ~= st then error(err) end
  end
end

