From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Mon, 14 Jan 2019 18:13:57 +0000
Subject: Re: [PATCH 1/3 v2] drm: rcar-du: add missing of_node_put
Message-Id: <10676089.h4Wfvzvksh@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.20.1901141743510.3522@hadrien>
In-Reply-To: <alpine.DEB.2.20.1901141743510.3522@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

Thank you for the patch.

On Monday, 14 January 2019 18:44:56 EET Julia Lawall wrote:
> Add an of_node_put when the result of of_graph_get_remote_port_parent is
> not available.
> 
> Add a second of_node_put if no encoder is selected (encoder remains NULL).
> 
> The semantic match that finds the first problem is as follows
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
> 
> *return ...;
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
> v2: Add the second of_node_put(entity);, as suggested by Kieran Bingham.
> 
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index 9c7007d..f9a90ff 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -331,6 +331,7 @@ static int rcar_du_encoders_init_one(struct
> rcar_du_device *rcdu, dev_dbg(rcdu->dev,
>  			"connected entity %pOF is disabled, skipping\n",
>  			entity);
> +		of_node_put(entity);
>  		return -ENODEV;
>  	}
> 
> @@ -366,6 +367,7 @@ static int rcar_du_encoders_init_one(struct
> rcar_du_device *rcdu, dev_warn(rcdu->dev,
>  			 "no encoder found for endpoint %pOF, skipping\n",
>  			 ep->local_node);
> +		of_node_put(entity);
>  		return -ENODEV;
>  	}

-- 
Regards,

Laurent Pinchart
