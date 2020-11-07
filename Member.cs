namespace HKHNoticeBoard
{
    public class Member
    {
        private int userId;
        private string id;
        private string pwd;
        private string userName;
        private string userEmail;
        private int birthYear;
        private int birthMon;
        private int birthDay;
        private string phoneNum;
        private int alarm;
        private string userProfile;

        public Member(int userId, string id, string pwd, string userName, string userEmail, int birthYear, int birthMon, int birthDay, string phoneNum, int alarm, string userProfile)
        {
            this.userId = userId;
            this.id = id;
            this.pwd = pwd;
            this.userName = userName;
            this.userEmail = userEmail;
            this.birthYear = birthYear;
            this.birthMon = birthMon;
            this.birthDay = birthDay;
            this.phoneNum = phoneNum;
            this.alarm = alarm;
            this.userProfile = userProfile;
        }

        public int getUserId()
        {
            return userId;
        }
        public void setUserId(int userId)
        {
            this.userId = userId;
        }
        public string getId()
        {
            return id;
        }
        public void setId(string id)
        {
            this.id = id;
        }
        public string getPwd()
        {
            return pwd;
        }
        public void setPwd(string pwd)
        {
            this.pwd = pwd;
        }
        public string getUserName()
        {
            return userName;
        }
        public void setUserName(string userName)
        {
            this.userName = userName;
        }
        public string getUserEmail()
        {
            return userEmail;
        }
        public void setUserEmail(string userEmail)
        {
            this.userEmail = userEmail;
        }
        public int getBirthYear()
        {
            return birthYear;
        }
        public void setBirthYear(int birthYear)
        {
            this.birthYear = birthYear;
        }
        public int getBirthMon()
        {
            return birthMon;
        }
        public void setBirthMon(int birthMon)
        {
            this.birthMon = birthMon;
        }
        public int getBirthDay()
        {
            return birthDay;
        }
        public void setBirthDay(int birthDay)
        {
            this.birthDay = birthDay;
        }
        public string getPhoneNum()
        {
            return phoneNum;
        }
        public void setPhoneNum(string phoneNum)
        {
            this.phoneNum = phoneNum;
        }
        public int getAlarm()
        {
            return alarm;
        }
        public void setAlarm(int alarm)
        {
            this.alarm = alarm;
        }
        public string getUserProfile()
        {
            return userProfile;
        }
        public void setUserProfile(string userProfile)
        {
            this.userProfile = userProfile;
        }

        public string printMember()
        {
            return "uid : " + userId + ", id : " + id + ", pwd : " + pwd + ", userName : " + userName + ", birthMon : " + birthMon + ", birthDay : " + birthDay + ", phoneNum : " + phoneNum + ", alarm : " + alarm;
        }
    }
}