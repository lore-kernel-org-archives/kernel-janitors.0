From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Wed, 06 Dec 2017 23:50:19 +0000
Subject: Re: [PATCH] Scheduler: Removed first parameter from prepare_lock_switch
Message-Id: <20171206235019.vvpx467magnuk25d@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205140200.4guikhmagltvoehm@smtp.gmail.com>
 <20171206121437.g7wsnqhx6oyycyqf@hirez.programming.kicks-ass.net>
In-Reply-To: <20171206121437.g7wsnqhx6oyycyqf@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Yes, this is correct. However it had me looking at that code and pretty
> much everything else is completely wrong :-)
> 
> That is, its functionally correct (probably), but the function name is
> not descriptive of what the function does and the comment is just plain
> wrong.
> 
> Also, since both functions are only used in core.c we should probably
> move them there.

I'm not sure I understood it completely. What do you mean for wrong? Will 
CONFIG_SMP a meaningless check here?

How about moving 'prepare_lock_switch' code from sched.h to prepare_task_switch
in core.c?

And about the comment in 'prepare_lock_switch', I can replace it to
"Set on_cpu to 1 during the context switch will lock the processes on the cpu"
 
> Do you think you can fix all that as well?

Yeah absolutely, I just might need a few more comprehension on it.
