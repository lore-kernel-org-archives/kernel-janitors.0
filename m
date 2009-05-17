From: Takashi Iwai <tiwai@suse.de>
Date: Sun, 17 May 2009 17:32:36 +0000
Subject: Re: [PATCH 3/3] sound: use dev_set_drvdata
Message-Id: <s5h63fz7hzf.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0905171129020.20440@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0905171129020.20440@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linuxppc-dev@ozlabs.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, timur@freescale.com, linux-kernel@vger.kernel.org

At Sun, 17 May 2009 11:29:21 +0200 (CEST),
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> Eliminate direct accesses to the driver_data field.
> cf 82ab13b26f15f49be45f15ccc96bfa0b81dfd015
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> struct device *dev;
> expression E;
> type T;
> @@
> 
> - dev->driver_data = (T)E
> + dev_set_drvdata(dev, E)
> 
> @@
> struct device *dev;
> type T;
> @@
> 
> - (T)dev->driver_data
> + dev_get_drvdata(dev)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied now.  Thanks.


Takashi

> 
> ---
>  sound/soc/fsl/fsl_ssi.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -u -p a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> --- a/sound/soc/fsl/fsl_ssi.c
> +++ b/sound/soc/fsl/fsl_ssi.c
> @@ -674,7 +674,7 @@ struct snd_soc_dai *fsl_ssi_create_dai(s
>  	ssi_private->dev = ssi_info->dev;
>  	ssi_private->asynchronous = ssi_info->asynchronous;
>  
> -	ssi_private->dev->driver_data = fsl_ssi_dai;
> +	dev_set_drvdata(ssi_private->dev, fsl_ssi_dai);
>  
>  	/* Initialize the the device_attribute structure */
>  	dev_attr->attr.name = "ssi-stats";
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
