From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 25 Apr 2008 20:41:44 +0000
Subject: Re: [PATCH] Documentation:  Explain 4K stacks in slightly more detail.
Message-Id: <20080425204144.GO14990@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.10.0804251549050.20250@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.10.0804251549050.20250@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 25, 2008 at 04:29:01PM -0400, Robert P. J. Day wrote:
> On Fri, 25 Apr 2008, Matthew Wilcox wrote:
> > [patch mangled so I can comment on each sentence]
> > On Fri, Apr 25, 2008 at 03:50:34PM -0400, Robert P. J. Day wrote:
> > > -	  If you say Y here the kernel will use a 4Kb stacksize for the
> > > -	  kernel stack attached to each process/thread.
> > > +	  If you say Y here, this will redefine the value of THREAD_SIZE
> > > +	  from 8K to 4K and subsequently use a 4K kernel stack for each
> > > +	  process/thread.
> >
> > This is a terrible change.  The user doesn't care what THREAD_SIZE
> > is or means within the kernel.  The programmer can grep for the
> > CONFIG option to see what changed.  Nack this portion.
> 
> i thought about that, and the only reason i mentioned it is that
> the consequences of selecting 4K stacks is not at all obvious.  i
> figured that, if someone was going to try something that tricky,
> he/she might want to understand what was happening under the hood.
> but i'm happy to take it out.

I just ran a grep for 4KSTACKS ... this text appears to have been
duplicated into three other architectures, so should be updated on all
of them together.  Except for the bit about the interrupt stacks; as far
as I can tell, they don't do that.

> > > -	  This option
> > > -	  will also use IRQ stacks to compensate for the reduced stackspace.
> > > +	  To compensate for the smaller per-process stack, interrupts will
> > > +	  now be given their own 4K per-cpu stacks.
> >
> > Again, your text is an improvement.  How about this though:
> >
> > 	To partially compensate for the smaller stack size, interrupts
> > 	will run on their own stack, reducing the chances of a stack
> > 	overflow.
> 
> i would want to keep the explanation that there is going to an
> interrupt stack *per CPU*.  that's not obvious from your text.

Why does the user care?  It's important to you and me, but someone who's
configuring their kernel needs to be told enough information to make an
informed decision about an option.  There's already a lot of complex
information here, let's not distract them with an implementation detail.

> > > +	  For more discussion,
> > > +	  see http://lwn.net/Articles/150580/.  Also, see the implementation
> > > +	  in the source file arch/x86/kernel/irq_32.c.
> >
> > I'm not keen on this sentence.
> 
> i can leave out the reference to the source file, but i still think a
> pointer to a discussion of the feature would be useful.

I disagree; someone may be configuring their kernel on an aeroplane
(don't laugh, I have) or other location without internet access.  A
summary of the discussion may be useful, but keep it short.

By the way, something missing from the original is "what to do if you
don't understand".  A sentence like:

	  If you don't know how to answer this question, it is safest to
	  say "N".

goes a long way.  OK, this is under DEBUG_KERNEL, but even so.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
