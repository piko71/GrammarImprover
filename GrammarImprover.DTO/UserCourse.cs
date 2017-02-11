using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GrammarImprover.DTO
{
    public class UserCourse
    {
        public Guid Id { get; set; }
        public Course BaseCourse { get; set; }
    }
}
