From: David Daney <ddaney@caviumnetworks.com>
Date: Thu, 21 Jan 2010 20:21:45 +0000
Subject: Re: Lots of bugs with current->state = TASK_*INTERRUPTIBLE
Message-Id: <4B58B759.8000002@caviumnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1263932978.31321.53.camel@gandalf.stny.rr.com>	 <4B58A89A.8050405@caviumnetworks.com>	 <1264102455.31321.293.camel@gandalf.stny.rr.com>	 <4B58B1B3.6000502@caviumnetworks.com> <1264105104.31321.298.camel@gandalf.stny.rr.com>
In-Reply-To: <1264105104.31321.298.camel@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rostedt@goodmis.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arch@vger.kernel.org, Greg KH <greg@kroah.com>, Andy Whitcroft <apw@canonical.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips <linux-mips@linux-mips.org>

>>
>> This is what I thought.
>>
>> My cpu (Cavium Octeon) does not have out of order reads, so my wmb() is 
> 
> Can you have reads that are out of order wrt writes? Because the above
> does not have out of order reads. It just had a read that came before a
> write. The above code could look like:
> 
> (hypothetical assembly language)
> 
> 	ld r2, TASK_UNINTERRUPTIBLE
> 	st r2, (current->state)
> 	wmb
> 	ld r1, (x)
> 	cmp r1, 0
> 
> Is it possible for the CPU to do the load of r1 before storing r2? If
> so, then the bug still exists.
> 

Indeed it is.  Lockless operations make my head hurt.

Thanks for clarifying.

David Daney



> -- Steve
> 
> 
>> in fact a full mb() from the point of view of the current CPU.  So I 
>> think I could weaken my bariers in set_current_state() and still get 
>> correct operation.  However as you say...
>>
> 
> 
> 

