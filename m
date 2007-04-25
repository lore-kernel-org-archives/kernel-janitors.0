From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Apr 2007 15:45:51 +0000
Subject: [KJ] Re: [PATCH]:Replacing current->state with set_current_state in
Message-Id: <alpine.LFD.0.98.0704250843300.9964@woody.linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1177483138.27118.25.camel@shani-win>
 <20070425091724.6f2c212b.dada1@cosmosbay.com>
In-Reply-To: <20070425091724.6f2c212b.dada1@cosmosbay.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <dada1@cosmosbay.com>
Cc: Shani Moideen <shani.moideen@wipro.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org



On Wed, 25 Apr 2007, Eric Dumazet wrote:
> 
> Either you think you corrected a BUG, so please state it clearly in 
> Changelog so that Linus immediatly apply your patch for 2.6.21 :)

It's not a bug.

Setting current state manually is fine _iff_ you don't actually test a 
condition value. It's only if you do

	/* This has a race, and is bad! */
	current->state = TASK_INTERRUPTIBLE;
	if (some_condition)
		schedule();

that you have a race: the CPU (or the compiler, for that matter) can move 
the "some_condition" check up to before setting TASK_INTERRUPTIBLE, and if 
another CPU comes in and wakes you up, you might lose the wakeup.

But doing

	/* This is fine */
	current->state = TASK_INTERRUPTIBLE;
	schedule();

is fine.

		Linus
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
