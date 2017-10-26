tabchi = dofile('tdcli.lua')
json = dofile('./libs/JSON.lua')
tabchi_id = 0
URL = require "socket.url"
serpent = dofile("./libs/serpent.lua")
http = require "socket.http"
https = require "ssl.https"
d = dofile('./libs/redis.lua')
sudo = {115740444,69053098,187290449}
function dl_cb(arg, data)
end
function is_sudo(msg)
  local var = false
  for v,user in pairs(sudo) do
    if user == msg.sender_user_id_ then
      var = true
    end
  end
  return var
end
	  function showedit(msg,data)
         if msg then
  tabchi.viewMessages(msg.chat_id_, {[0] = msg.id_})
      if msg.send_state_.ID == "MessageIsSuccessfullySent" then
      return false 
      end
	if not d:sismember('all'..tabchi_id..'id',msg.chat_id_) then
       d:sadd('all'..tabchi_id..'id',msg.chat_id_)
end  
	
 if msg.chat_id_ then
      local id = tostring(msg.chat_id_)
      if id:match('-100(%d+)') then
        chat_type = 'super'
        elseif id:match('^(%d+)') then
        chat_type = 'user'
        else
        chat_type = 'group'
        end
      end

 local text = msg.content_.text_
	if text and text:match('[QWERTYUIOPASDFGHJKLZXCVBNM]') then
		text = text
		end
    if msg.content_.ID == "MessageText" then
      msg_type = 'text'
    end
    if msg.content_.ID == "MessageChatAddMembers" then
      msg_type = 'user'
    end
    if msg.content_.ID == "MessageChatJoinByLink" then
      msg_type = 'Joins'
    end
   if msg.content_.ID == "MessageDocument" then
        print("This is [ File Or Document ]")
        msg_type = 'Document'
      end
      -------------------------
      if msg.content_.ID == "MessageSticker" then
        print("This is [ Sticker ]")
        msg_type = 'Sticker'
      end
      -------------------------
      if msg.content_.ID == "MessageAudio" then
        print("This is [ Audio ]")
        msg_type = 'Audio'
      end
      -------------------------
      if msg.content_.ID == "MessageVoice" then
        print("This is [ Voice ]")
        msg_type = 'Voice'
      end
      -------------------------
      if msg.content_.ID == "MessageVideo" then
        print("This is [ Video ]")
        msg_type = 'Video'
      end
      -------------------------
      if msg.content_.ID == "MessageAnimation" then
        print("This is [ Gif ]")
        msg_type = 'Gif'
      end
      -------------------------
      if msg.content_.ID == "MessageLocation" then
        print("This is [ Location ]")
        msg_type = 'Location'
      end
    
      -------------------------
      if msg.content_.ID == "MessageContact" then
        print("This is [ Contact ]")
        msg_type = 'Contact'
      end
      
 if not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
        print("This is [ MarkDown ]")
        msg_type = 'Markreed'
      end
    if msg.content_.ID == "MessagePhoto" then
      msg_type = 'Photo'
end
-----------------------------------------------
function check_markdown(text) 
		str = text
		if str:match('_') then
			output = str:gsub('_',[[\_]])
		elseif str:match('*') then
			output = str:gsub('*','\\*')
		elseif str:match('`') then
			output = str:gsub('`','\\`')
		else
			output = str
		end
	return output
end
    -------------------------------------------
    if msg_type == 'text' and text then
      if text:match('^[/]') then
      text = text:gsub('^[/]','')
      end
    end
  local savecontact = (d:get('savecontact') or 'no') 
    if savecontact == 'yes' then
 if msg.content_.ID == "MessageContact" then
	  tabchi.importContacts(msg.content_.contact_.phone_number_, (msg.content_.contact_.first_name_ or '--'), '#New', msg.content_.contact_.user_id_)
        print("ConTact Added")
local function c(a,b,c) 
  tabchi.sendContact(msg.chat_id_, msg.id_, 0, 1, nil, b.phone_number_, b.first_name_, (b.last_name_ or ''), 0)
 end
tabchi.getMe(c)
d:sadd('tcom', msg.content_.contact_.user_id_)
local text = d:get('pm')
if not text then
text = 'ادی بیا پیوی عشقم'
end
        tabchi.sendText(msg.chat_id_, msg.id_, 1, text,1, 'md')
        print("Tabchi [ Message ]")

end
end
   if text == 'leave sgp' and is_sudo(msg) then
          local list = d:smembers('tsgps')
          for k,v in pairs(list) do
       tabchi.changeChatMemberStatus(v, tabchi_id, "Left")
        print("Tabchi [ Left ]")

d:del('tsgps')
   end
tabchi.sendText(msg.sender_user_id_, 0, 1,'*انجام شد*', 1, 'md')
   print("Tabchi [ Message ]")

      end
if text and text:match('^setapi (%d+)') and is_sudo(msg) then
          local id = text:match('^setapi (%d+)')
d:set('apiid',id)
tabchi.sendText(msg.chat_id_, msg.id_, 1,'*انجام شد*', 1, 'md')
end
 if text == 'addapi' and is_sudo(msg) then
if d:get('apiid') then
local id = d:get('apiid')
  local add = d:smembers("tsgps")
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,20)
  end
 local add = d:smembers("tgp")
local id = d:get('apiid')
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,20)
  end
tabchi.sendText(msg.chat_id_, msg.id_, 1,'*انجام شد*', 1, 'md')
end
end
        if text == 'bcsgp' and tonumber(msg.reply_to_message_id_) > 0 and is_sudo(msg) then
          function cb(a,b,c)
          local text = b.content_.text_
          local list = d:smembers('asgp')
          for k,v in pairs(list) do
        tabchi.sendText(v, 0, 1, text,1, 'md')
          end
   tabchi.sendText(msg.chat_id_, msg.id_, 1,'*انجام شد*', 1, 'md')
          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end

  if text == 'bcgp' and tonumber(msg.reply_to_message_id_) > 0 and is_sudo(msg) then
          function cb(a,b,c)
          local text = b.content_.text_
          local list = d:smembers('agp')
          for k,v in pairs(list) do
        tabchi.sendText(v, 0, 1, text,1, 'md')
          end
					tabchi.sendText(msg.chat_id_, msg.id_, 1,'*انجام شد*', 1, 'md')
          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end
  if text == 'bcuser' and tonumber(msg.reply_to_message_id_) > 0 and is_sudo(msg) then
          function cb(a,b,c)
          local text = b.content_.text_
          local list = d:smembers('ausers')
          for k,v in pairs(list) do
        tabchi.sendText(v, 0, 1, text,1, 'md')
          end
tabchi.sendText(msg.chat_id_, msg.id_, 1,'*انجام شد*', 1, 'md')
          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end
  if text == 'fwdsgp' and tonumber(msg.reply_to_message_id_) > 0 and is_sudo(msg) then
          function cb(a,b,c)
          local list = d:smembers('asgp')
          for k,v in pairs(list) do
         tabchi.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end
tabchi.sendText(msg.chat_id_, msg.id_, 1,'*انجام شد*', 1, 'md')

          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end
if text == 'fwdgp' and tonumber(msg.reply_to_message_id_) > 0 and is_sudo(msg) then
          function cb(a,b,c)
          local list = d:smembers('agp')
          for k,v in pairs(list) do
         tabchi.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end
		tabchi.sendText(msg.chat_id_, msg.id_, 1,'*انجام شد*', 1, 'md')
          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end

if text == 'fwduser' and tonumber(msg.reply_to_message_id_) > 0 and is_sudo(msg) then
          function cb(a,b,c)
          local list = d:smembers('ausers')
          for k,v in pairs(list) do
         tabchi.forwardMessages(v, msg.chat_id_, {[0] = b.id_}, 1)
          end 
     tabchi.sendText(msg.chat_id_, msg.id_, 1,'*انجام شد*', 1, 'md')
          end
          tabchi.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb)
          end
 if text == 'leave gp' and is_sudo(msg) then
          local list = d:smembers('tgp')
          for k,v in pairs(list) do
       tabchi.changeChatMemberStatus(v, tabchi_id, "Left")
        print("Tabchi [ Left ]")
d:del('tgp')       
   end
tabchi.sendText(msg.chat_id_, msg.id_, 1,'*انجام شد*', 1, 'md')
   print("Tabchi [ Message ]")
      end
if text == 'panel' and is_sudo(msg) then
local pm = d:get('pm')
if not pm then
pm = 'ادی بیا پیوی عشقم'
end
 if d:get('savecontact') then
              co = '✅'
            else
              co = '☑️'
            end
 if d:get('joinlink') then
              join = '✅'
            else
              join = '☑️'
            end
local gps = d:scard("tsgps") or 0
local user = d:scard("tusers")
local gp = d:scard("tgp") or 0
local com = d:scard("tcom") or 0
local block = d:scard("tblock") or 0
local allmsg = d:get("tallmsg") or 0
local link = d:scard('links') or 0 
local text = '✳مشخصات تبچی شما✳\nــــــــــــــــــــــــــــــ\n💠تعداد گروه ها : *'..gps..'*\n💠تعداد گروه ها  : *'..gp..'*\n💠تعداد کاربران : *'..user..'*\n💠تعداد مخاطبین  : *'..com..'*\n💠تعداد لینک ها : *'..link..'*\n💠جوین خودکار : *'..join..'*\n💠ادد مخاطب : *'..co..'*\n💠پیام اد : *'..pm..'*'
 tabchi.sendText(msg.chat_id_, msg.id_,1,text,1,'md')
 end
if text == 'addmembers' and is_sudo(msg) then
  local pv = d:smembers("tusers")
  for i = 1, #pv do
    tabchi.addChatMember(msg.chat_id_, pv[i], 5)
  end
 local co = d:smembers("tcom")
  for i = 1, #co do
    tabchi.addChatMember(msg.chat_id_, co[i], 5)
  end
  tabchi.sendText(msg.chat_id_, msg.id_,1,'تمام مخاطبین به گروه اضافه شدند',1,'md')
 end
  if text and text:match('^addtoall (%d+)') and is_sudo(msg) then
          local id = text:match('^addtoall (%d+)')
  local add = d:smembers("tsgps")
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,5)
  end
 local add = d:smembers("tgp")
          for k,v in pairs(add) do
    tabchi.addChatMember(v, id,5)
  end
  tabchi.sendText(msg.chat_id_, msg.id_,1,'کاربر به همه گروه های ربات اد شد',1,'md')
end
if text == 'join enable' and is_sudo(msg) then
          d:set('joinlink','yes')
         tabchi.sendText(msg.chat_id_, msg.id_, 1,'جوین خودکار فعال شد', 1, 'md')
                  print("Tabchi [ Message ]")

end
        if text == 'join disable' and is_sudo(msg) then

          d:set('joinlink','no')
         d:del('joinlink','yes')  
        tabchi.sendText(msg.chat_id_, msg.id_, 1,'جوین خودکار غیرفعال شد', 1, 'md')
                print("Tabchi [ Message ]")

  end
if text == 'savecontact enable' and is_sudo(msg) then

          d:set('savecontact','yes')
         tabchi.sendText(msg.chat_id_, msg.id_, 1,'اد مخاطب فعال شد', 1, 'md')
                 print("Tabchi [ Message ]")

 end
        if text == 'savecontact disable' and is_sudo(msg) then

          d:set('savecontact ','no')
          d:del('savecontact','yes')

          tabchi.sendText(msg.chat_id_, msg.id_, 1,'اد مخاطب غیرفعال شد', 1, 'md')
                  print("Tabchi [ Message ]")

end
if text and text:match('^setpm (.*)') and is_sudo(msg) then
            local link = text:match('setpm (.*)')
            d:set('pm', link)
          tabchi.sendText(msg.chat_id_, msg.id_, 1,'*انجام شد*', 1, 'md')
            end
 if text == 'delpm' then
            d:del('pm')
          tabchi.sendText(msg.chat_id_, msg.id_, 1,'*انجام شد*', 1, 'md')
            end 

  local joinlink = (d:get('joinlink') or 'no') 
    if joinlink == 'yes' and is_sudo(msg) then
	if text and text:match("https://telegram.me/joinchat/%S+") or text and text:match("https://t.me/joinchat/%S+") or text and text:match("https://t.me/joinchat/%S+")  or text and text:match("https://telegram.dog/joinchat/%S+") then
		local text = text:gsub("t.me", "telegram.me")
		for link in text:gmatch("(https://telegram.me/joinchat/%S+)") do
			if not d:sismember("links", link) then
				d:sadd("links", link)
				tabchi.importChatInviteLink(link)
			end
		end
end
end

		if text then
if d:get('apiid') then
local id = d:get('apiid')
tabchi.addChatMember(msg.chat_id_, id,1)
           tabchi.addChatMembers(msg.chat_id_,{[0] = id})

  end
end
  end

------------------------------------
------------------------------------
d:incr("tallmsg")
------------------------------------
 if msg.chat_id_ then
      local id = tostring(msg.chat_id_)
      if id:match('-100(%d+)') then
        if not d:sismember("sgps",msg.chat_id_) then
          d:sadd("tsgps",msg.chat_id_)

        end
-----------------------------------
elseif id:match('^-(%d+)') then
if not d:sismember("tgp",msg.chat_id_) then
d:sadd("tgp",msg.chat_id_)

end
-----------------------------------------
elseif id:match('') then
if not d:sismember("tusers",msg.chat_id_) then
d:sadd("tusers",msg.chat_id_)
end
   else
        if not d:sismember("tsgps",msg.chat_id_) then
            d:sadd("tsgps",msg.chat_id_)

end
end
end
end
      function tdcli_update_callback(data)
 ------vardump(data)
    if (data.ID == "UpdateNewMessage") then
     showedit(data.message_,data)
  elseif (data.ID == "UpdateMessageEdited") then
    data = data
    local function edit(extra,result,success)
      showedit(result,data)
    end
     tdcli_function ({ ID = "GetMessage", chat_id_ = data.chat_id_,message_id_ = data.message_id_}, edit, nil)
  elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
    tdcli_function ({ ID="GetChats",offset_order_="9223372036854775807", offset_chat_id_=0,limit_=20}, dl_cb, nil)
  end
end


