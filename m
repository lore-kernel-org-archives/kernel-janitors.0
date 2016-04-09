From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Sat, 09 Apr 2016 00:52:24 +0000
Subject: Re: [patch] staging: lowmemorykiller: remove bogus NULL check
Message-Id: <201604090952.GHB69729.OHVFLJQFOMtSOF@I-love.SAKURA.ne.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160408130235.GA9376@mwanda>
In-Reply-To: <20160408130235.GA9376@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter wrote:
> The NULL checking here doesn't make sense, so it causes a static checker
> warning.  It turns out that p->mm can't be NULL so the inconsistency is
> harmless and we should just remove the check.

Commit 77ed2c5745d9 ("android,lowmemorykiller: Don't abuse TIF_MEMDIE.")
replaced test_tsk_thread_flag(p, TIF_MEMDIE) with task_lmk_waiting(p) && p->mm
because TIF_MEMDIE is cleared after p->mm became NULL whereas
PFA_LMK_WAITING is not cleared after p->mm became NULL.
But p is a thread which is guaranteed to be p->mm != NULL.

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

> 
> diff --git a/drivers/staging/android/lowmemorykiller.c b/drivers/staging/android/lowmemorykiller.c
> index c79f224..24d2745 100644
> --- a/drivers/staging/android/lowmemorykiller.c
> +++ b/drivers/staging/android/lowmemorykiller.c
> @@ -131,7 +131,7 @@ static unsigned long lowmem_scan(struct shrinker *s, struct shrink_control *sc)
>  		if (!p)
>  			continue;
>  
> -		if (task_lmk_waiting(p) && p->mm &&
> +		if (task_lmk_waiting(p) &&
>  		    time_before_eq(jiffies, lowmem_deathpending_timeout)) {
>  			task_unlock(p);
>  			rcu_read_unlock();
> 
