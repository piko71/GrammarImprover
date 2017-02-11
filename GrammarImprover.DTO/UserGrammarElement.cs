using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GrammarImprover.DTO
{
    public class UserGrammarElement: GrammarElement
    {
        public bool Confidence { get; set; }
        public int NumberOfViews { get; set; }
    }
}
