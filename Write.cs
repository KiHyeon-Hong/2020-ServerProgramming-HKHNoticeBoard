using System;

namespace HKHNoticeBoard
{
    public class Write
    {
        private int writeId;
        private int category;
        private string title;
        private string body;
        private DateTime createDay;
        private DateTime updateDay;
        private string emailAtt;
        private int userId;

        public Write(int writeId, int category, string title, string body, DateTime createDay, DateTime updateDay, string emailAtt, int userId)
        {
            this.writeId = writeId;
            this.category = category;
            this.title = title;
            this.body = body;
            this.createDay = createDay;
            this.updateDay = updateDay;
            this.emailAtt = emailAtt;
            this.userId = userId;
        }
        public int getWriteId()
        {
            return writeId;
        }
        public void setWriteId(int writeId)
        {
            this.writeId = writeId;
        }
        public int getCategory()
        {
            return category;
        }
        public void setCategory(int category)
        {
            this.category = category;
        }
        public string getTitle()
        {
            return title;
        }
        public void setTitle(string title)
        {
            this.title = title;
        }
        public string getBody()
        {
            return body;
        }
        public void setBody(string body)
        {
            this.body = body;
        }
        public DateTime getCreateDay()
        {
            return createDay;
        }
        public void setCreateDay(DateTime createDay)
        {
            this.createDay = createDay;
        }
        public DateTime getUpdateDay()
        {
            return updateDay;
        }
        public void setUpdateDay(DateTime updateDay)
        {
            this.updateDay = updateDay;
        }
        public string getEmailAtt()
        {
            return emailAtt;
        }
        public void setEmailAtt(string emailAtt)
        {
            this.emailAtt = emailAtt;
        }
        public int getUserId()
        {
            return userId;
        }
        public void setUserId(int userId)
        {
            this.userId = userId;
        }
        public string printWrite()
        {
            return "writeId :" + writeId + ", title :" + title + ", body :" + body + ", createDay :" + createDay + ", updateDay :" + updateDay + ", userId :" + userId;
        }
    }
}