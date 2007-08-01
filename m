From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 01 Aug 2007 11:45:57 +0000
Subject: Re: [PATCH 3/3] sound/soc ioremap/iounmap balancing
Message-Id: <s5hk5sftr4a.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070801060606.BB9C3DA82E@mailserver8.hushmail.com>
In-Reply-To: <20070801060606.BB9C3DA82E@mailserver8.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: postfail@hushmail.com

At Wed, 01 Aug 2007 02:06:06 -0400,
Scott Thompson wrote:
> 
> ioremap / iounmap balancing in sound/soc tree
> 
> Signed-off-by: Scott Thompson <postfail <at> hushmail.com>

Applied to ALSA tree.  Thanks.


Takashi

> ---
> diff --git a/sound/soc/s3c24xx/s3c24xx-i2s.c 
> b/sound/soc/s3c24xx/s3c24xx-i2s.c
> index 39f0246..cd89c41 100644
> --- a/sound/soc/s3c24xx/s3c24xx-i2s.c
> +++ b/sound/soc/s3c24xx/s3c24xx-i2s.c
> @@ -385,6 +385,7 @@ static int s3c24xx_i2s_probe(struct 
> platform_device *pdev)
>  	s3c24xx_i2s.iis_clk=clk_get(&pdev->dev, "iis");
>  	if (s3c24xx_i2s.iis_clk = NULL) {
>  		DBG("failed to get iis_clock\n");
> +		iounmap(s3c24xx_i2s.regs);
>  		return -ENODEV;
>  	}
>  	clk_enable(s3c24xx_i2s.iis_clk);
> 
> --
> Start providing for your family by becoming a paralegal. Click Now.
> http://tagline.hushmail.com/fc/Ioyw6h4ek5ocrsblBGe95tDruAMchCwVmpqjJUiDSVabB25GwhAcU8/
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
