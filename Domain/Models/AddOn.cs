namespace WizzErr.Domain.Models
{
    public class AddOn
    {
        public int AddOnId { get; set; }
        public string Name { get; set; }
        public float BasePrice { get; set; }

        public float GetBasePrice()
        {
            return BasePrice;
        }
    }
}