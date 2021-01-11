From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 Jan 2021 18:05:29 +0000
Subject: Re: [PATCH] mmc: mxs-mmc: Fix a resource leak in an error handling path in 'mxs_mmc_probe()'
Message-Id: <CAPDyKFpvjdbWnCD9KRnZAimc_X0CaYS9uCVceuEOX+7THifLpQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201208203527.49262-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201208203527.49262-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Chris Ball <cjb@laptop.org>, Fabio Estevam <festevam@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Tue, 8 Dec 2020 at 21:35, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If 'mmc_of_parse()' fails, we must undo the previous 'dma_request_chan()'
> call.
>
> Fixes: abd37cccd47f ("mmc: mxs: use mmc_gpio_get_ro for detecting read-only status")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next (by dropping the fixes tag as it seems non-critical
anyway), thanks!

Kind regards
Uffe



> ---
> I'm not 100% sure of the Fixes tag, but it seems to be the root cause. The
> erroneous 'out_clk_disable' has then been kept around in the following
> commits
> ---
>  drivers/mmc/host/mxs-mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
> index 56bbc6cd9c84..947581de7860 100644
> --- a/drivers/mmc/host/mxs-mmc.c
> +++ b/drivers/mmc/host/mxs-mmc.c
> @@ -628,7 +628,7 @@ static int mxs_mmc_probe(struct platform_device *pdev)
>
>         ret = mmc_of_parse(mmc);
>         if (ret)
> -               goto out_clk_disable;
> +               goto out_free_dma;
>
>         mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
>
> --
> 2.27.0
>
