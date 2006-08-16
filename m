From: walter harms <wharms@bfs.de>
Date: Wed, 16 Aug 2006 14:12:13 +0000
Subject: Re: [KJ] timeslice calculation
Message-Id: <44E327BD.5080000@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c49434130608150411i1a1c3597h18f3d7dfa1e093ff@mail.gmail.com>
In-Reply-To: <c49434130608150411i1a1c3597h18f3d7dfa1e093ff@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

there is also a high resolution timer patch with dynamic ticks that 
promisses a better response time.
http://lwn.net/Articles/152363/

re,
  walter


Andreas Mohr wrote:
> Hi,
> 
> On Wed, Aug 16, 2006 at 05:50:20PM +0530, Tharindu Rukshan Bamunuarachchi wrote:
>> Dear All,
>>
>> They have changed HZ value. So, they says my timer interrupt occures
>> at 1ms interval. IS it true??
>>
>> Anyway, is it impossible to calculate HZ value in running linux system.
>>
>> Because, we wanted to have highly interactive system. So they have
>> suggested change of timer interval fire. What about decrease of
>> minimum time slice.
> 
> Wanting a highly interactive system is precisely the very best reason
> to go with a -ck kernel, I guess.
> 
>>From what I see CONFIG_HZ doesn't influence timeslice length, however.
> This is because timeslice length is NOT directly related to timer tick rate.
> The TIMESLICE defines in sched.c indicate the standard (*average*)
> timeslice values for processes, regardless how often the timer interrupt
> (which is a process rescheduling point) fires (this might be much more often
> than process rescheduling actually takes place).
> 
> If you have definite need for a lower timeslice, then I believe there's
> no way around modifying those sched.c defines and recompiling.
> 
> Note that lowering timeslice values will deteriorate your cache-hot
> efficiency due to too frequently swapped processes/memory sets (IIRC the
> usual time to get a cache really hot was more than 3ms on a P3 or so).
> As such you might want to tend to replacing the entire scheduler instead
> of doing some timeslice tweaks...
> 
> Andreas Mohr
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
