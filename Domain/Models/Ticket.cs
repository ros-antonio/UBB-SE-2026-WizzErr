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

            throw new NotImplementedException("Logica pentru calcularea prețului total nu a fost încă implementată.");
        }

        public void CancelTicket()
        {
            throw new NotImplementedException("Logica pentru anularea biletului nu a fost încă implementată.");
        }
    }
}