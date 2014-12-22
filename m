From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 22 Dec 2014 09:57:38 +0000
Subject: Re: [patch] mmc: mxs-mmc: remove unneeded NULL check
Message-Id: <CAPDyKFopZTP9pegoKUJ70UPVJYp4b-BF0QTzcWGEv68J6hDxJw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141216235749.GH31467@mwanda>
In-Reply-To: <20141216235749.GH31467@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Ball <chris@printf.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <fabio.estevam@freescale.com>, Roman Peniaev <r.peniaev@gmail.com>, Peter Griffin <peter.griffin@linaro.org>, Daniel Willmann <daniel@totalueberwachung.de>, linux-mmc <linux-mmc@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 17 December 2014 at 00:57, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Static checkers complain about the inconsistent NULL checking here:
>
>         drivers/mmc/host/mxs-mmc.c:680 mxs_mmc_probe()
>         warn: variable dereferenced before check 'ssp->dmach' (see line 660)
>
> The variable can't actually be NULL so we can remove the check.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks! Applied for next.

Kind regards
Uffe

>
> diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
> index 60c4ca9..a82411a 100644
> --- a/drivers/mmc/host/mxs-mmc.c
> +++ b/drivers/mmc/host/mxs-mmc.c
> @@ -677,8 +677,7 @@ static int mxs_mmc_probe(struct platform_device *pdev)
>         return 0;
>
>  out_free_dma:
> -       if (ssp->dmach)
> -               dma_release_channel(ssp->dmach);
> +       dma_release_channel(ssp->dmach);
>  out_clk_disable:
>         clk_disable_unprepare(ssp->clk);
>  out_mmc_free:
