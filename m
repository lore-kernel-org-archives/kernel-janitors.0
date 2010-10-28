From: Balbir Singh <balbir@linux.vnet.ibm.com>
Date: Thu, 28 Oct 2010 15:52:29 +0000
Subject: Re: [patch] memcg: null dereference on allocation failure
Message-Id: <20101028155207.GB3769@balbir.in.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101028111241.GC6062@bicker>
In-Reply-To: <20101028111241.GC6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Daisuke Nishimura <nishimura@mxp.nes.nec.co.jp>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

* Dan Carpenter <error27@gmail.com> [2010-10-28 13:12:41]:

> The original code had a null dereference if alloc_percpu() failed.
> This was introduced in 711d3d2c9bc3 "memcg: cpu hotplug aware percpu
> count updates"
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 9a99cfa..2efa8ea 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -4208,15 +4208,17 @@ static struct mem_cgroup *mem_cgroup_alloc(void)
> 
>  	memset(mem, 0, size);
>  	mem->stat = alloc_percpu(struct mem_cgroup_stat_cpu);
> -	if (!mem->stat) {
> -		if (size < PAGE_SIZE)
> -			kfree(mem);
> -		else
> -			vfree(mem);
> -		mem = NULL;
> -	}
> +	if (!mem->stat)
> +		goto out_free;
>  	spin_lock_init(&mem->pcp_counter_lock);
>  	return mem;
> +
> +out_free:
> +	if (size < PAGE_SIZE)
> +		kfree(mem);
> +	else
> +		vfree(mem);
> +	return NULL;
>  }

Good catch!
Reviewed-by: Balbir Singh <balbir@linux.vnet.ibm.com>
 

-- 
	Three Cheers,
	Balbir
