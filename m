From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 27 Jan 2016 20:58:55 +0000
Subject: Re: perf: Fix perf_event_exit_task() race
Message-Id: <20160127205855.GA6357@twins.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160127202422.GA7045@mwanda>
In-Reply-To: <20160127202422.GA7045@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 27, 2016 at 11:24:22PM +0300, Dan Carpenter wrote:

>   1229                  if (ctx->task = TASK_TOMBSTONE ||
>   1230                      !atomic_inc_not_zero(&ctx->refcount)) {
>   1231                          raw_spin_unlock(&ctx->lock);
>   1232                          ctx = NULL;
>                                 ^^^^^^^^^^
> ctx is NULL.
> 
>   1233                  }
>   1234  
>   1235                  WARN_ON_ONCE(ctx->task != task);
>                                      ^^^^^^^^^^^^^^^^^
> The patch adds a NULL dereference.

Clearly I didn't manage to trigger that in testing :/

Thanks!
