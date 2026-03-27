namespace WizzErr.Domain.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public Membership Membership { get; set; }

        public int GetId()
        {
            return UserId;
        }

        public string GetEmail()
        {
            return Email;
        }
    }
}