From: Dong Aisheng <b29396@freescale.com>
Date: Fri, 27 Feb 2015 07:14:13 +0000
Subject: Re: [patch] mmc: sdhci-esdhc-imx: silence a false curly braces warning
Message-Id: <20150227071410.GA18208@shlinux1.ap.freescale.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150226203755.GD6820@mwanda>
In-Reply-To: <20150226203755.GD6820@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Ball <chris@printf.net>, Ulf Hansson <ulf.hansson@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Shawn Guo <shawn.guo@linaro.org>, Dirk Behme <dirk.behme@de.bosch.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 26, 2015 at 11:37:55PM +0300, Dan Carpenter wrote:
> Static checkers suggest that probably we intended to put curly braces
> around the writel() to make it part of the else path.  But, I think
> actually the indenting is off and the code works fine as is.
> 
> The stray tab was introduced in 0322191e6298 ('mmc: sdhci-esdhc-imx: add
> sd3.0 SDR clock tuning support')
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Yes, that's a mistake.
Thanks for the finding.
Acked-by: Dong Aisheng <b29396@freescale.com>

Regards
Dong Aisheng

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 10ef824..9cce5cf 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -416,7 +416,7 @@ static void esdhc_writew_le(struct sdhci_host *host, u16 val, int reg)
>  			new_val |= ESDHC_VENDOR_SPEC_FRC_SDCLK_ON;
>  		else
>  			new_val &= ~ESDHC_VENDOR_SPEC_FRC_SDCLK_ON;
> -			writel(new_val, host->ioaddr + ESDHC_VENDOR_SPEC);
> +		writel(new_val, host->ioaddr + ESDHC_VENDOR_SPEC);
>  		return;
>  	case SDHCI_HOST_CONTROL2:
>  		new_val = readl(host->ioaddr + ESDHC_VENDOR_SPEC);
