From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 Jan 2021 18:05:41 +0000
Subject: Re: [PATCH] mmc: usdhi6rol0: Fix a resource leak in the error handling path of the probe
Message-Id: <CAPDyKFo_dxAkUVZ0kj60OQeKoV8OeqWWQejh_NL0OcNjDLfA9Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201217210922.165340-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201217210922.165340-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Chris Ball <chris@printf.net>, linux-arm-kernel@axis.com, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, 17 Dec 2020 at 22:09, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> A call to 'ausdhi6_dma_release()' to undo a previous call to
> 'usdhi6_dma_request()' is missing in the error handling path of the probe
> function.
>
> It is already present in the remove function.
>
> Fixes: 75fa9ea6e3c0 ("mmc: add a driver for the Renesas usdhi6rol0 SD/SDIO host controller")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/usdhi6rol0.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/usdhi6rol0.c b/drivers/mmc/host/usdhi6rol0.c
> index e2d5112d809d..615f3d008af1 100644
> --- a/drivers/mmc/host/usdhi6rol0.c
> +++ b/drivers/mmc/host/usdhi6rol0.c
> @@ -1858,10 +1858,12 @@ static int usdhi6_probe(struct platform_device *pdev)
>
>         ret = mmc_add_host(mmc);
>         if (ret < 0)
> -               goto e_clk_off;
> +               goto e_release_dma;
>
>         return 0;
>
> +e_release_dma:
> +       usdhi6_dma_release(host);
>  e_clk_off:
>         clk_disable_unprepare(host->clk);
>  e_free_mmc:
> --
> 2.27.0
>
