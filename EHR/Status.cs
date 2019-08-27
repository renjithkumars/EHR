using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EHR
{
    public class Status
    {
        public enum Request
        {
            New = 0,
            Read = 1,
            Accepted = 2
        }
    }
}