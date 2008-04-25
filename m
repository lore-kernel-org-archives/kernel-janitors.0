From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 25 Apr 2008 20:11:13 +0000
Subject: Re: [PATCH] Documentation:  Explain 4K stacks in slightly more detail.
Message-Id: <20080425201113.GN14990@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.10.0804251549050.20250@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.10.0804251549050.20250@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[patch mangled so I can comment on each sentence]
On Fri, Apr 25, 2008 at 03:50:34PM -0400, Robert P. J. Day wrote:
> -	  If you say Y here the kernel will use a 4Kb stacksize for the
> -	  kernel stack attached to each process/thread.
> +	  If you say Y here, this will redefine the value of THREAD_SIZE
> +	  from 8K to 4K and subsequently use a 4K kernel stack for each
> +	  process/thread.

This is a terrible change.  The user doesn't care what THREAD_SIZE is or
means within the kernel.  The programmer can grep for the CONFIG option
to see what changed.  Nack this portion.

> -       This facilitates
> -	  running more threads on a system and also reduces the pressure
> -	  on the VM subsystem for higher order allocations.
> +       This facilitates running more threads on a
> +	  system and also reduces the pressure on the VM subsystem for
> +	  higher-order allocations (that is, trying to find two consecutive
> +	  4K pages rather than just one for each per-process kernel stack).

Good that you've explained the jargon.  But I'd rather see it removed.
How does this read?

	 This facilitates running more threads on your system and means
	 the VM system has to work less hard to find two consecutive 4k
	 pages.

> -	  This option
> -	  will also use IRQ stacks to compensate for the reduced stackspace.
> +	  To compensate for the smaller per-process stack, interrupts will
> +	  now be given their own 4K per-cpu stacks.

Again, your text is an improvement.  How about this though:

	To partially compensate for the smaller stack size, interrupts
	will run on their own stack, reducing the chances of a stack
	overflow.

> +	  For more discussion,
> +	  see http://lwn.net/Articles/150580/.  Also, see the implementation
> +	  in the source file arch/x86/kernel/irq_32.c.

I'm not keen on this sentence.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
