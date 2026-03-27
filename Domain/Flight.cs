using System;

namespace WizzErr.Domain.Models
{
    public class Flight
    {
        public int FlightId { get; set; }
        public Route Route { get; set; }
        public Gate Gate { get; set; }
        public DateTime Date { get; set; }
        public string FlightNr { get; set; }
    }
}