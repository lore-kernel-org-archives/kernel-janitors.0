From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 25 Apr 2008 20:29:01 +0000
Subject: Re: [PATCH] Documentation:  Explain 4K stacks in slightly more
Message-Id: <alpine.LFD.1.10.0804251624420.24682@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.10.0804251549050.20250@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.10.0804251549050.20250@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 25 Apr 2008, Matthew Wilcox wrote:

> [patch mangled so I can comment on each sentence]
> On Fri, Apr 25, 2008 at 03:50:34PM -0400, Robert P. J. Day wrote:
> > -	  If you say Y here the kernel will use a 4Kb stacksize for the
> > -	  kernel stack attached to each process/thread.
> > +	  If you say Y here, this will redefine the value of THREAD_SIZE
> > +	  from 8K to 4K and subsequently use a 4K kernel stack for each
> > +	  process/thread.
>
> This is a terrible change.  The user doesn't care what THREAD_SIZE
> is or means within the kernel.  The programmer can grep for the
> CONFIG option to see what changed.  Nack this portion.

i thought about that, and the only reason i mentioned it is that
the consequences of selecting 4K stacks is not at all obvious.  i
figured that, if someone was going to try something that tricky,
he/she might want to understand what was happening under the hood.
but i'm happy to take it out.

> > -       This facilitates
> > -	  running more threads on a system and also reduces the pressure
> > -	  on the VM subsystem for higher order allocations.
> > +       This facilitates running more threads on a
> > +	  system and also reduces the pressure on the VM subsystem for
> > +	  higher-order allocations (that is, trying to find two consecutive
> > +	  4K pages rather than just one for each per-process kernel stack).
>
> Good that you've explained the jargon.  But I'd rather see it removed.
> How does this read?
>
> 	 This facilitates running more threads on your system and means
> 	 the VM system has to work less hard to find two consecutive 4k
> 	 pages.

that sounds reasonable.  i can find some middle ground between the
two.

> > -	  This option
> > -	  will also use IRQ stacks to compensate for the reduced stackspace.
> > +	  To compensate for the smaller per-process stack, interrupts will
> > +	  now be given their own 4K per-cpu stacks.
>
> Again, your text is an improvement.  How about this though:
>
> 	To partially compensate for the smaller stack size, interrupts
> 	will run on their own stack, reducing the chances of a stack
> 	overflow.

i would want to keep the explanation that there is going to an
interrupt stack *per CPU*.  that's not obvious from your text.

> > +	  For more discussion,
> > +	  see http://lwn.net/Articles/150580/.  Also, see the implementation
> > +	  in the source file arch/x86/kernel/irq_32.c.
>
> I'm not keen on this sentence.

i can leave out the reference to the source file, but i still think a
pointer to a discussion of the feature would be useful.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
