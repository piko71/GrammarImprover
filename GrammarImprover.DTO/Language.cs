using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GrammarImprover.DTO
{
    public class Language
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public IEnumerable<Course> Courses { get; set; }
    }
}
