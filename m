From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 17 Dec 2020 03:56:59 +0000
Subject: Re: [PATCH] media: vsp1: Fix an error handling path in the probe function
Message-Id: <X9rXC3rKWfEJNP6z@pendragon.ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kieran.bingham+renesas@ideasonboard.com, mchehab@kernel.org, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

Thank you for the patch.

On Sat, Dec 12, 2020 at 06:41:19PM +0100, Christophe JAILLET wrote:
> A previous 'rcar_fcp_get()' call must be undone in the error handling path,
> as already done in the remove function.
> 
> Fixes: 94fcdf829793 ("[media] v4l: vsp1: Add FCP support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and queued in my tree for v5.12.

> ---
>  drivers/media/platform/vsp1/vsp1_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index dc62533cf32c..aa66e4f5f3f3 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -882,8 +882,10 @@ static int vsp1_probe(struct platform_device *pdev)
>  	}
>  
>  done:
> -	if (ret)
> +	if (ret) {
>  		pm_runtime_disable(&pdev->dev);
> +		rcar_fcp_put(vsp1->fcp);
> +	}
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
