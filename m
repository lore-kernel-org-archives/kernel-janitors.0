From: Grant Likely <grant.likely@secretlab.ca>
Date: Wed, 08 Sep 2010 19:51:30 +0000
Subject: Re: [PATCH 6/7] arch/powerpc/platforms/maple/setup.c: Add
Message-Id: <20100908195130.GB7065@angua.secretlab.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
	<1283075566-27441-7-git-send-email-julia@diku.dk>
In-Reply-To: <1283075566-27441-7-git-send-email-julia-dAYI7NvHqcQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org

On Sun, Aug 29, 2010 at 11:52:45AM +0200, Julia Lawall wrote:
> Add a call to of_node_put in the error handling code following a call to
> of_find_node_by_path.
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
> 
> ---
>  arch/powerpc/platforms/maple/setup.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
> index 3fff8d9..fe34c3d 100644
> --- a/arch/powerpc/platforms/maple/setup.c
> +++ b/arch/powerpc/platforms/maple/setup.c
> @@ -358,6 +358,7 @@ static int __init maple_cpc925_edac_setup(void)
>  	model = (const unsigned char *)of_get_property(np, "model", NULL);
>  	if (!model) {
>  		printk(KERN_ERR "%s: Unabel to get model info\n", __func__);
> +		of_node_put(np);

Acked-by: Grant Likely <grant.likely@secretlab.ca>

This patch should also fix the exact same problem after a call to
of_find_node_by_type() in the same function (line 370).

>  		return -ENODEV;
>  	}
>  
> 
