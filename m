From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Date: Mon, 14 Dec 2020 09:24:15 +0000
Subject: Re: [PATCH] media: vsp1: Fix an error handling path in the probe function
Message-Id: <592359b9-8e2a-6b5c-053f-ec16d9085b22@ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

On 12/12/2020 17:41, Christophe JAILLET wrote:
> A previous 'rcar_fcp_get()' call must be undone in the error handling path,
> as already done in the remove function.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Fixes: 94fcdf829793 ("[media] v4l: vsp1: Add FCP support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
> 
