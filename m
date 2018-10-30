From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Tue, 30 Oct 2018 14:44:44 +0000
Subject: Re: [PATCH] perf/core: clean up inconsisent indentation
Message-Id: <20181030144444.GB23310@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181029233211.21475-1-colin.king@canonical.com>
In-Reply-To: <20181029233211.21475-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Em Mon, Oct 29, 2018 at 11:32:11PM +0000, Colin King escreveu:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Replace a bunch of spaces with tab, cleans up indentation

I think we can live with the spaces as the 'git blame' information is
more valuable, i.e. who was that touched that line last?

Thanks,

- Arnaldo
 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  kernel/events/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 8c490130c4fb..84530ab358c3 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -750,7 +750,7 @@ static inline void update_cgrp_time_from_event(struct perf_event *event)
>  	/*
>  	 * Do not update time when cgroup is not active
>  	 */
> -       if (cgroup_is_descendant(cgrp->css.cgroup, event->cgrp->css.cgroup))
> +	if (cgroup_is_descendant(cgrp->css.cgroup, event->cgrp->css.cgroup))
>  		__update_cgrp_time(event->cgrp);
>  }
>  
> -- 
> 2.19.1
