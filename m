From: "Kevin D. Kissell" <kevink@paralogos.com>
Date: Wed, 26 May 2010 17:27:53 +0000
Subject: Affinity Automation (was Re: [PATCH 3/17] arch/mips/kernel: Add missing
Message-Id: <4BFD5A19.5030602@paralogos.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261754390.23743@ask.diku.dk> <20100526163227.GA17043@linux-mips.org>
In-Reply-To: <20100526163227.GA17043@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Julia Lawall <julia@diku.dk>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Ralf Baechle wrote:
> Your patch appears correct - and mipsmt_sys_sched_setaffinity() even
> more broken than you thought.  It duplicates some code from kernel/sched.c
> and has gotten out of sync.
Yeah, that was inevitable.  Since the distribution of the previous 
message seems to cover concerned developers outside the MIPS community, 
let me make one final(?) plea to actually do this right.

The MIPS SMTC support for managing a single FPU context on a processor 
with multiple integer TC contexts involves having the system make 
automous, real time, decisions about scheduling affinity.  It may be a 
first, but it can't possibly be the only case, especially as we've 
started seeing more and more mainstream multi-core, multi-thread 
designs.  System and chip resources are going to be "closer" to one 
processor or another.  The current Linux paradigm is that it's the 
responsibility of programs, or users, to know what the optimal placement 
of processes should be for a given system platform, and while it's 
absolutely appropriate to provide that level of control for the cases 
where the user really does know best, it's mildly insane to make that 
the only way that thread placement can be optimized.  It's really the 
OS's job to match demand to resources.

My contention years ago was, and remains, that it would be a bad idea to 
burden the main scheduler loop with checks for two different levels of 
affinity, system-automatic and user-specified.  It would add 
non-trivially to the cache footprint and execution overhead of thread 
dispatch, and there's no logical need for it.  So the model I proposed, 
and implemented in the cloned affinity system calls for SMTC, was that a 
*single* affinity mask continue to be used by the scheduler, but that 
the per-thread data structures carry two:  The one requested explicitly 
by the user, and the one actually used by the scheduler.  The idea is 
that normally those two are the same, but that the system - in the MIPS 
SMTC case, the FPU emulator - can overlay its constraints with the 
user's constraints to come up with an intersection-of-sets constraint 
that satisfies both (there was a clause which prevents system affinity 
heuristics from restricting the affinity mask to a null set of CPUs, 
though of course the user can do that if he really wants to).

There's nothing particularly MIPS-specific about the problem or the 
solution.  Most of the mechanisms should really be in 
platform-independent code, so we don't get the drift of cloned components.

I don't recall who owned the scheduler at the time, but whoever it was 
was too busy dealing with mainstream processor problems to even engage 
in a dialogue about this.  Is it time to raise the question again?

          Regards,

          Kevin K.
