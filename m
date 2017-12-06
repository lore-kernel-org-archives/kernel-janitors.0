From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 06 Dec 2017 12:14:37 +0000
Subject: Re: [PATCH] Scheduler: Removed first parameter from prepare_lock_switch
Message-Id: <20171206121437.g7wsnqhx6oyycyqf@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205140200.4guikhmagltvoehm@smtp.gmail.com>
In-Reply-To: <20171205140200.4guikhmagltvoehm@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rodrigosiqueira <rodrigosiqueiramelo@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 05, 2017 at 12:02:00PM -0200, rodrigosiqueira wrote:
> The first parameter of prepare_lock_switch (kernel/sched/sched.h) is not
> used anymore. Commit c55f5158f removed the code that use the first
> parameter and function prepare_lock_switch is only used in
> prepare_task_switch (kernel/sched/core.c)

Yes, this is correct. However it had me looking at that code and pretty
much everything else is completely wrong :-)

That is, its functionally correct (probably), but the function name is
not descriptive of what the function does and the comment is just plain
wrong.

Also, since both functions are only used in core.c we should probably
move them there.

Do you think you can fix all that as well?
