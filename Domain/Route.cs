using System;

namespace WizzErr.Domain.Models
{
    public class Route
    {
        public int RouteId { get; set; }
        public Company Company { get; set; }
        public Airport Airport { get; set; }
        public string RouteType { get; set; }
        public DateTime DepartureTime { get; set; }
        public DateTime ArrivalTime { get; set; }
        public int Capacity { get; set; }
    }
}