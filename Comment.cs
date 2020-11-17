namespace HKHNoticeBoard
{
    public class Comment
    {
        private int commentId;
        private int writeId;
        private int userId;
        private string body;
        private int bestCheck;

        public Comment(int commentId, int writeId, int userId, string body, int bestCheck)
        {
            this.commentId = commentId;
            this.writeId = writeId;
            this.userId = userId;
            this.body = body;
            this.bestCheck = bestCheck;
        }

        public int getCommentId()
        {
            return commentId;
        }
        public void setCommentId(int commentId)
        {
            this.commentId = commentId;
        }
        public int getWriteId()
        {
            return writeId;
        }
        public void setWriteId(int writeId)
        {
            this.writeId = writeId;
        }
        public int getuserId()
        {
            return userId;
        }
        public void setuserId(int userId)
        {
            this.userId = userId;
        }
        public string getBody()
        {
            return body;
        }
        public void setBody(string body)
        {
            this.body = body;
        }
        public void setBestCheck(int bestCheck)
        {
            this.bestCheck = bestCheck;
        }
        public int getBestCheck()
        {
            return bestCheck;
        }
    }
}