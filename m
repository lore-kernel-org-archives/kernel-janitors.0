From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Date: Mon, 06 Sep 2010 00:48:51 +0000
Subject: Re: [PATCH 14/14] mm: oom_kill: use IS_ERR() instead of strict checking
Message-Id: <20100906094555.C8BB.A69D9226@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711592-7669-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1283711592-7669-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kosaki.motohiro@jp.fujitsu.com, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, Minchan Kim <minchan.kim@gmail.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org

> From: Vasiliy Kulikov <segooon@gmail.com>
> 
> Use IS_ERR() instead of strict checking.

Umm...

I don't like this. IS_ERR() imply an argument is error code. but in
this case, we don't use error code. -1 mean oom special purpose meaning
value.

So, if we take this direction, It would be better to use EAGAIN or something
instead -1.



> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  Compile tested.
> 
>  mm/oom_kill.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/oom_kill.c b/mm/oom_kill.c
> index fc81cb2..2ee3350 100644
> --- a/mm/oom_kill.c
> +++ b/mm/oom_kill.c
> @@ -514,7 +514,7 @@ void mem_cgroup_out_of_memory(struct mem_cgroup *mem, gfp_t gfp_mask)
>  	read_lock(&tasklist_lock);
>  retry:
>  	p = select_bad_process(&points, limit, mem, NULL);
> -	if (!p || PTR_ERR(p) = -1UL)
> +	if (IS_ERR_OR_NULL(p))
>  		goto out;
>  
>  	if (oom_kill_process(p, gfp_mask, 0, points, limit, mem, NULL,
> @@ -691,7 +691,7 @@ retry:
>  	p = select_bad_process(&points, totalpages, NULL,
>  			constraint = CONSTRAINT_MEMORY_POLICY ? nodemask :
>  								 NULL);
> -	if (PTR_ERR(p) = -1UL)
> +	if (IS_ERR(p))
>  		goto out;
>  
>  	/* Found nothing?!?! Either we hang forever, or we panic. */
> -- 
> 1.7.0.4
> 



