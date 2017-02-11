using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GrammarImprover.DTO
{
    public class Session
    {
        public Guid Id { get; set; }
        public DateTimeOffset SessionOn { get; set; }
        public DateTimeOffset SessionOff { get; set; }
    }
}
