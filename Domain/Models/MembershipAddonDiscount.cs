namespace WizzErr.Domain.Models
{
    public class MembershipAddonDiscount
    {
        public Membership Membership { get; set; }
        public AddOn AddOn { get; set; }
        public float DiscountPercentage { get; set; }
    }
}