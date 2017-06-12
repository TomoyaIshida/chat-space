module MessagesHelper
 def chatinfo(group)
  if group.messages.blank?
    "まだメッセージはありません。"
  elsif group.messages.last.image.present?
    "画像が投稿されています。"
  else
    group.messages.last.body
  end
 end
end
