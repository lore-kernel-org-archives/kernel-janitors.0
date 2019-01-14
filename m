From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Date: Mon, 14 Jan 2019 14:34:06 +0000
Subject: Re: [PATCH 1/3] drm: rcar-du: add missing of_node_put
Message-Id: <78d7667d-f701-b908-9f24-0ee13be90947@ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547372691-28324-1-git-send-email-Julia.Lawall@lip6.fr>
 <1547372691-28324-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1547372691-28324-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org

Hi Julia,

Thank you for the patch,

On 13/01/2019 09:44, Julia Lawall wrote:
> Add an of_node_put when the result of of_graph_get_remote_port_parent is
> not available.
> 
> The semantic match that finds this problem is as follows
> (http://coccinelle.lip6.fr):
> 
> // <smpl>
> @r exists@
> local idexpression e;
> expression x;
> @@
> e = of_graph_get_remote_port_parent(...);
> ... when != x = e
>     when != true e = NULL
>     when != of_node_put(e)
>     when != of_fwnode_handle(e)
> (
> return e;
> |
> *return ...;
> )
> // </smpl>
> 

For this part at least:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

But a little discussion below:


> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

This does indeed look like a missing of_node_put() but I don't think it
will be the only one in that code. It gets a bit tangled - and I think
there's possibly another missing put on the error path of

        if (!encoder) {
                dev_warn(rcdu->dev,
                         "no encoder found for endpoint %pOF, skipping\n",
                         ep->local_node);
                return -ENODEV;
        }

because that implies that no encoder was found, and thus -
                encoder = entity;

was not executed, and the tail of that function calls:

         of_node_put(encoder);

which would have been the final of_node_put(entity)


I think that part could be considered separate to this patch, but it's
also quite closely related. Either way - I think it needs a second pair
of eyes to see if I'm not crazy :)

Regards

Kieran

> 
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 9c7007d..bc3fcb3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -331,6 +331,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
>  		dev_dbg(rcdu->dev,
>  			"connected entity %pOF is disabled, skipping\n",
>  			entity);
> +		of_node_put(entity);
>  		return -ENODEV;
>  	}
>  
> 
