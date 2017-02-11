using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GrammarImprover.DTO
{
    public class User
    {
        public Guid Id
        {
            get
            {
                throw new System.NotImplementedException();
            }

            set
            {
            }
        }

        public String Login
        {
            get
            {
                throw new System.NotImplementedException();
            }

            set
            {
            }
        }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public IEnumerable<Session> Sessions { get; set; }
        public IEnumerable<UserCourse> Courses { get; set; }
    }
}