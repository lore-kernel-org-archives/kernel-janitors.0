From: Grant Likely <grant.likely@secretlab.ca>
Date: Wed, 08 Sep 2010 19:54:17 +0000
Subject: Re: [PATCH 4/7] arch/powerpc/platforms/powermac/pfunc_core.c: Add
Message-Id: <20100908195417.GC7065@angua.secretlab.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
	<1283075566-27441-5-git-send-email-julia@diku.dk>
In-Reply-To: <1283075566-27441-5-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org

[cc'ing linuxppc-dev]

On Sun, Aug 29, 2010 at 11:52:43AM +0200, Julia Lawall wrote:
> Add a call to of_node_put in the error handling code following a call to
> of_find_node_by_phandle.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r exists@
> local idexpression x;
> expression E,E1;
> statement S;
> @@
> 
> *x = 
> (of_find_node_by_path
> |of_find_node_by_name
> |of_find_node_by_phandle
> |of_get_parent
> |of_get_next_parent
> |of_get_next_child
> |of_find_compatible_node
> |of_match_node
> )(...);
> ...
> if (x = NULL) S
> <... when != x = E
> *if (...) {
>   ... when != of_node_put(x)
>       when != if (...) { ... of_node_put(x); ... }
> (
>   return <+...x...+>;
> |
> *  return ...;
> )
> }
> ...>
> of_node_put(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> 
> ---
>  arch/powerpc/platforms/powermac/pfunc_core.c |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powermac/pfunc_core.c b/arch/powerpc/platforms/powermac/pfunc_core.c
> index cec6359..b0c3777 100644
> --- a/arch/powerpc/platforms/powermac/pfunc_core.c
> +++ b/arch/powerpc/platforms/powermac/pfunc_core.c
> @@ -837,8 +837,10 @@ struct pmf_function *__pmf_find_function(struct device_node *target,
>  		return NULL;
>   find_it:
>  	dev = pmf_find_device(actor);
> -	if (dev = NULL)
> -		return NULL;
> +	if (dev = NULL) {
> +		result = NULL;
> +		goto out;
> +	}
>  
>  	list_for_each_entry(func, &dev->functions, link) {
>  		if (name && strcmp(name, func->name))
> @@ -850,8 +852,9 @@ struct pmf_function *__pmf_find_function(struct device_node *target,
>  		result = func;
>  		break;
>  	}
> -	of_node_put(actor);
>  	pmf_put_device(dev);
> +out:
> +	of_node_put(actor);
>  	return result;
>  }
>  
> 
