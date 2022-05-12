cd ~/Library/Containers/com.microsoft.SkypeForBusiness/Data/Library/Application\ Support/com.microsoft.SkypeForBusiness
# Remove all Conversations
sqlite3 DataStore.sqlite "delete from Conversation"
# Remove all Conversation items
sqlite3 DataStore.sqlite "delete from ConversationHistoryItem"
