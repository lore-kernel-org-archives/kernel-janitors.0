From: David Ahern <dsahern@gmail.com>
Date: Fri, 07 Jun 2019 14:54:33 +0000
Subject: Re: [PATCH next] nexthop: off by one in nexthop_mpath_select()
Message-Id: <0e02a744-f28e-e206-032b-a0ffac9f7311@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190607135636.GB16718@mwanda>
In-Reply-To: <20190607135636.GB16718@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David Ahern <dsahern@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 6/7/19 7:56 AM, Dan Carpenter wrote:
> The nhg->nh_entries[] array is allocated in nexthop_grp_alloc() and it
> has nhg->num_nh elements so this check should be >= instead of >.
> 
> Fixes: f88d8ea67fbd ("ipv6: Plumb support for nexthop object in a fib6_info")

Wrong fixes. The helper was added by 430a049190de so it should be

Fixes: 430a049190de ("nexthop: Add support for nexthop groups")

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  include/net/nexthop.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/net/nexthop.h b/include/net/nexthop.h
> index aff7b2410057..e019ed9b3dc3 100644
> --- a/include/net/nexthop.h
> +++ b/include/net/nexthop.h
> @@ -160,7 +160,7 @@ struct nexthop *nexthop_mpath_select(const struct nexthop *nh, int nhsel)
>  	/* for_nexthops macros in fib_semantics.c grabs a pointer to
>  	 * the nexthop before checking nhsel
>  	 */
> -	if (nhsel > nhg->num_nh)
> +	if (nhsel >= nhg->num_nh)
>  		return NULL;
>  
>  	return nhg->nh_entries[nhsel].nh;
> 

Thanks for the patch.

Reviewed-by: David Ahern <dsahern@gmail.com>
