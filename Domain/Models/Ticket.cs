using System;
using System.Collections.Generic;

namespace WizzErr.Domain.Models
{
	public class Ticket
	{
		public int TicketId { get; set; }

		public User User { get; set; }
		public Flight Flight { get; set; }

		public string Seat { get; set; }
		public float Price { get; set; }
		public string Status { get; set; }

		public string PassengerFirstName { get; set; }
		public string PassengerLastName { get; set; }
		public string PassengerEmail { get; set; }
		public string PassengerPhone { get; set; }

		public List<AddOn> SelectedAddOns { get; set; } = new List<AddOn>();

		public float CalculateTotalPrice()
		{
			float finalTotal = Price;

			if (User != null && User.Membership != null)
			{
				float flightDiscount = User.Membership.GetFlightDiscount();
				finalTotal -= finalTotal * (flightDiscount / 100.0f);

				foreach (var addon in SelectedAddOns)
				{
					float addonPrice = addon.GetBasePrice();
					float specificAddonDiscount = 0f;

					if (User.Membership.AddonDiscounts != null)
					{
						foreach (var discount in User.Membership.AddonDiscounts)
						{
							if (discount.AddOn != null && discount.AddOn.AddOnId == addon.AddOnId)
							{
								specificAddonDiscount = discount.DiscountPercentage;
								break;
							}
						}
					}

					finalTotal += addonPrice - (addonPrice * (specificAddonDiscount / 100.0f));
				}
			}
			else
			{
				foreach (var addon in SelectedAddOns)
				{
					finalTotal += addon.GetBasePrice();
				}
			}

			return finalTotal;
		}

		public void CancelTicket()
		{
			Status = "Cancelled";
			Seat = string.Empty;
		}
	}
}