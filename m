From: Jerome Brunet <jbrunet@baylibre.com>
Date: Sun, 07 Jun 2020 20:39:47 +0000
Subject: Re: [PATCH] ASoC: meson: fix memory leak of links if allocation of ldata fails
Message-Id: <1j7dwik3u4.fsf@starbuckisacylon.baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200604171216.60043-1-colin.king@canonical.com>
In-Reply-To: <20200604171216.60043-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On Thu 04 Jun 2020 at 19:12, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Currently if the allocation of ldata fails the error return path
> does not kfree the allocated links object.  Fix this by adding
> an error exit return path that performs the necessary kfree'ing.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good, Thx

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/meson-card-utils.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index 2ca8c98e204f..5a4a91c88734 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -49,19 +49,26 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
>  	links = krealloc(priv->card.dai_link,
>  			 num_links * sizeof(*priv->card.dai_link),
>  			 GFP_KERNEL | __GFP_ZERO);
> +	if (!links)
> +		goto err_links;
> +
>  	ldata = krealloc(priv->link_data,
>  			 num_links * sizeof(*priv->link_data),
>  			 GFP_KERNEL | __GFP_ZERO);
> -
> -	if (!links || !ldata) {
> -		dev_err(priv->card.dev, "failed to allocate links\n");
> -		return -ENOMEM;
> -	}
> +	if (!ldata)
> +		goto err_ldata;
>  
>  	priv->card.dai_link = links;
>  	priv->link_data = ldata;
>  	priv->card.num_links = num_links;
>  	return 0;
> +
> +err_ldata:
> +	kfree(links);
> +err_links:
> +	dev_err(priv->card.dev, "failed to allocate links\n");
> +	return -ENOMEM;
> +
>  }
>  EXPORT_SYMBOL_GPL(meson_card_reallocate_links);
