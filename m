From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 22 Nov 2010 06:56:41 +0000
Subject: Re: [PATCH] ALSA: snd-atmel-abdac: test wrong variable
Message-Id: <s5htyj9rgly.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290361209-15121-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290361209-15121-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Sun, 21 Nov 2010 20:40:07 +0300,
Vasiliy Kulikov wrote:
> 
> After clk_get() pclk is checked second time instead of sample_clk check.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Applied now.  Thanks.


Takashi


> ---
>  Compile tested only.
> 
>  sound/atmel/abdac.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/sound/atmel/abdac.c b/sound/atmel/abdac.c
> index f2f41c8..4e47baa 100644
> --- a/sound/atmel/abdac.c
> +++ b/sound/atmel/abdac.c
> @@ -420,7 +420,7 @@ static int __devinit atmel_abdac_probe(struct platform_device *pdev)
>  		return PTR_ERR(pclk);
>  	}
>  	sample_clk = clk_get(&pdev->dev, "sample_clk");
> -	if (IS_ERR(pclk)) {
> +	if (IS_ERR(sample_clk)) {
>  		dev_dbg(&pdev->dev, "no sample clock\n");
>  		retval = PTR_ERR(pclk);
>  		goto out_put_pclk;
> -- 
> 1.7.0.4
> 
