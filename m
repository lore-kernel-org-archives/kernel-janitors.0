From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 04 Dec 2019 12:56:57 +0000
Subject: Re: [PATCH] ASoC: SOF: imx8: fix memory allocation failure check on priv->pd_dev
Message-Id: <CAEnQRZAEExdNS+=aSFb86OCgWfezEFHYvoAJBV4=DshEprRGrA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204124816.1415359-1-colin.king@canonical.com>
In-Reply-To: <20191204124816.1415359-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Linux-ALSA <alsa-devel@alsa-project.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Wed, Dec 4, 2019 at 2:49 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The memory allocation failure check for priv->pd_dev is incorrectly
> pointer checking priv instead of priv->pd_dev. Fix this.
>
> Addresses-Coverity: ("Logically dead code")
> Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Good catch! Thanks Colin!

> ---
>  sound/soc/sof/imx/imx8.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index cfefcfd92798..9d926b1df0d7 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -209,7 +209,7 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>
>         priv->pd_dev = devm_kmalloc_array(&pdev->dev, priv->num_domains,
>                                           sizeof(*priv->pd_dev), GFP_KERNEL);
> -       if (!priv)
> +       if (!priv->pd_dev)
>                 return -ENOMEM;
>
>         priv->link = devm_kmalloc_array(&pdev->dev, priv->num_domains,
> --
> 2.24.0
>
