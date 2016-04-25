From: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Mon, 25 Apr 2016 18:59:32 +0000
Subject: Re: [patch] tracing: checking for NULL instead of IS_ERR()
Message-Id: <571E6914.90708@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160423102347.GA11136@mwanda>
In-Reply-To: <20160423102347.GA11136@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 04/23/2016 05:23 AM, Dan Carpenter wrote:
> tracing_map_elt_alloc() returns ERR_PTRs on error, never NULL.
>
> Fixes: 08d43a5fa063 ('tracing: Add lock-free tracing_map')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/kernel/trace/tracing_map.c b/kernel/trace/tracing_map.c
> index e0f1729..e7dfc5e 100644
> --- a/kernel/trace/tracing_map.c
> +++ b/kernel/trace/tracing_map.c
> @@ -814,7 +814,7 @@ static struct tracing_map_elt *copy_elt(struct tracing_map_elt *elt)
>   	unsigned int i;
>
>   	dup_elt = tracing_map_elt_alloc(elt->map);
> -	if (!dup_elt)
> +	if (IS_ERR(dup_elt))
>   		return NULL;
>
>   	if (elt->map->ops && elt->map->ops->elt_copy)
>

Thanks for fixing this.  I found another one along the same lines which 
I'll send a patch for shortly.

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>
