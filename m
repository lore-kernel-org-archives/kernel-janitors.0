From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 05 Sep 2016 08:01:56 +0000
Subject: Re: [PATCH] drm/imx: Fix of_node ref counting
Message-Id: <1473062516.2456.25.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472971523-4143-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1472971523-4143-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Christophe,

Am Sonntag, den 04.09.2016, 08:45 +0200 schrieb Christophe JAILLET:
> This code is spurious.
> It takes a ref on a node, then call 'of_node_put' on it and then store
> this node somewhere.

The node pointer is not stored. Note that np is not dereferenced at all,
we just compare the pointer value against dev->of_node.
It doesn't matter whether we drop the reference before or after that.

> It is likely that taking the ref on the parent node and releasing the child
> node was expected instead.

Initially, np is assigned to the void *data parameter. The caller holds
the reference to that, and we are not allowed to decrement its refcount
(as of_get_next_parent does). Otherwise the iterator calling this match
function would drop references of all the device_nodes it compares
against.

> So, use 'of_get_next_parent' instead. It does all this in just one
> function call.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Un-tested
> ---
>  drivers/gpu/drm/imx/imx-drm-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> index 438bac8fbc2b..60fb388c80f8 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -449,10 +449,8 @@ static int compare_of(struct device *dev, void *data)
>  	}
>  
>  	/* Special case for LDB, one device for two channels */
> -	if (of_node_cmp(np->name, "lvds-channel") = 0) {
> -		np = of_get_parent(np);
> -		of_node_put(np);
> -	}

This could have been written as:

	bool match;

	/* Special case for LDB, one device for two channels */
	if (of_node_cmp(np->name, "lvds-channel") = 0) {
		struct device_node *parent = of_get_parent(np);

		match = dev->of_node = parent;
		of_node_put(parent);
	} else {
		match = dev->of_node = np;
	}

	return match;

which does exactly the same. Maybe the reuse of np and the pointer
comparison after of_node_put warrants a comment.

> +	if (of_node_cmp(np->name, "lvds-channel") = 0)
> +		np = of_get_next_parent(np);
>  
>  	return dev->of_node = np;
>  }

thanks
Philipp

