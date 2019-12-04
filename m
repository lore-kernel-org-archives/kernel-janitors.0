From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 04 Dec 2019 19:13:45 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: imx8: fix memory allocation failure check on priv->pd_dev
Message-Id: <33fec540-e97b-25e7-83af-575f19d829d2@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204124816.1415359-1-colin.king@canonical.com>
In-Reply-To: <20191204124816.1415359-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 12/4/19 6:48 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The memory allocation failure check for priv->pd_dev is incorrectly
> pointer checking priv instead of priv->pd_dev. Fix this.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks Colin

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/imx/imx8.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index cfefcfd92798..9d926b1df0d7 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -209,7 +209,7 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>   
>   	priv->pd_dev = devm_kmalloc_array(&pdev->dev, priv->num_domains,
>   					  sizeof(*priv->pd_dev), GFP_KERNEL);
> -	if (!priv)
> +	if (!priv->pd_dev)
>   		return -ENOMEM;
>   
>   	priv->link = devm_kmalloc_array(&pdev->dev, priv->num_domains,
> 
