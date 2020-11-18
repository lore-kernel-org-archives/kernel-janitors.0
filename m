From: Michal Hocko <mhocko@suse.com>
Date: Wed, 18 Nov 2020 12:46:17 +0000
Subject: Re: [PATCH] mm: memcg: remove obsolete memcg_has_children()
Message-Id: <20201118124617.GR12284@dhcp22.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201116055043.20886-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201116055043.20886-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Roman Gushchin <guro@fb.com>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, Vladimir Davydov <vdavydov.dev@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon 16-11-20 06:50:43, Lukas Bulwahn wrote:
> Commit 2ef1bf118c40 ("mm: memcg: deprecate the non-hierarchical mode")
> removed the only use of memcg_has_children() in
> mem_cgroup_hierarchy_write() as part of the feature deprecation.
> 
> Hence, since then, make CC=clang W=1 warns:
> 
>   mm/memcontrol.c:3421:20:
>     warning: unused function 'memcg_has_children' [-Wunused-function]
> 
> Simply remove this obsolete unused function.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

git grep agrees
Acked-by: Michal Hocko <mhocko@suse.com>

> ---
> applies cleanly on next-20201113, not on current master
> 
> Roman, please ack.
> 
> Andrew, please pick this minor non-urgent patch into your -next tree.
> 
>  mm/memcontrol.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index f95ddb3e9898..d49d7c507284 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -3415,19 +3415,6 @@ unsigned long mem_cgroup_soft_limit_reclaim(pg_data_t *pgdat, int order,
>  	return nr_reclaimed;
>  }
>  
> -/*
> - * Test whether @memcg has children, dead or alive.
> - */
> -static inline bool memcg_has_children(struct mem_cgroup *memcg)
> -{
> -	bool ret;
> -
> -	rcu_read_lock();
> -	ret = css_next_child(NULL, &memcg->css);
> -	rcu_read_unlock();
> -	return ret;
> -}
> -
>  /*
>   * Reclaims as many pages from the given memcg as possible.
>   *
> -- 
> 2.17.1

-- 
Michal Hocko
SUSE Labs
