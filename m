From: Garlic Tseng <garlic.tseng@mediatek.com>
Date: Thu, 07 Jul 2016 08:26:54 +0000
Subject: Re: [patch] ASoC: mediatek: mt2701: fix some error handling in probe
Message-Id: <1467880014.11610.1.camel@mtksdaap41>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160707081404.GB16645@mwanda>
In-Reply-To: <20160707081404.GB16645@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

On Thu, 2016-07-07 at 11:14 +0300, Dan Carpenter wrote:
> The check for if the "afe" allocation failed was too late and there
> wasn't a check for "afe->platform_priv".
> 
> Fixes: 43a6a7e71063 ('ASoC: mediatek: add mt2701 platform driver implementation.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
> index c865ba1..fc5a87d 100644
> --- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
> +++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
> @@ -1350,11 +1350,13 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
>  
>  	ret = 0;
>  	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> +	if (!afe)
> +		return -ENOMEM;
>  	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
>  					  GFP_KERNEL);
> -	afe_priv = afe->platform_priv;
> -	if (!afe)
> +	if (!afe->platform_priv)
>  		return -ENOMEM;
> +	afe_priv = afe->platform_priv;
>  
>  	afe->dev = &pdev->dev;
>  	dev = afe->dev;

Acked-by: Garlic Tseng <garlic.tseng@mediatek.com>

