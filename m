From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 05 Mar 2009 22:42:10 +0000
Subject: Re: [PATCH v2 15/15] NULL noise: mm/memcontrol.c
Message-Id: <20090305144210.e40ef501.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
	<20090305191839.30062.91081.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305191839.30062.91081.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, kamezawa.hiroyu@jp.fujitsu.com

On Thu, 05 Mar 2009 20:18:44 +0100
Hannes Eder <hannes@hanneseder.net> wrote:

> Fix this sparse warning:
>   mm/memcontrol.c:1637:32: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
> ---
> v2: other subject, as suggested by Al Viro
> 
>  mm/memcontrol.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 8e4be9c..09d6650 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -1634,7 +1634,7 @@ static int mem_cgroup_force_empty_list(struct mem_cgroup *mem,
>  		pc = list_entry(list->prev, struct page_cgroup, lru);
>  		if (busy = pc) {
>  			list_move(&pc->lru, list);
> -			busy = 0;
> +			busy = NULL;
>  			spin_unlock_irqrestore(&zone->lru_lock, flags);
>  			continue;
>  		}

I have to say that I wish sparse didn't do this.  Initialising a
pointer with literal zero is perfectly clear and is idiomatic C.

