using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Group17Assignment1.Model
{
    public class Customers
    {
        public int UserID { get; set; }
        public int QuestionID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string SecurityAnswer { get; set; }
    }
}