using System.Collections.Generic;

namespace WizzErr.Domain.Models
{
    public class Membership
    {
        public int MembershipId { get; set; }
        public string Name { get; set; }
        public float FlightDiscountPercentage { get; set; }

        public List<MembershipAddonDiscount> AddonDiscounts { get; set; } = new List<MembershipAddonDiscount>();

        public float GetFlightDiscount()
        {
            return FlightDiscountPercentage;
        }
    }
}