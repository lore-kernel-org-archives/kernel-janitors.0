From: Pavel Pisa <ppisa4lists@pikron.com>
Date: Thu, 05 Aug 2010 20:57:53 +0000
Subject: Re: [PATCH 10/42] drivers/mmc/host: Adjust confusing if indentation
Message-Id: <201008052257.54039.ppisa4lists@pikron.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008052219360.31692@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008052219360.31692@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Thursday 05 August 2010 22:19:52 Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
...
> Signed-off-by: Julia Lawall <julia@diku.dk>
Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>

Good catch.

> ---
>  drivers/mmc/host/imxmmc.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/imxmmc.c b/drivers/mmc/host/imxmmc.c
> index 9a68ff4..5a950b1 100644
> --- a/drivers/mmc/host/imxmmc.c
> +++ b/drivers/mmc/host/imxmmc.c
> @@ -148,11 +148,12 @@ static int imxmci_start_clock(struct imxmci_host
> *host)
>
>  		while (delay--) {
>  			reg = readw(host->base + MMC_REG_STATUS);
> -			if (reg & STATUS_CARD_BUS_CLK_RUN)
> +			if (reg & STATUS_CARD_BUS_CLK_RUN) {
>  				/* Check twice before cut */
>  				reg = readw(host->base + MMC_REG_STATUS);
>  				if (reg & STATUS_CARD_BUS_CLK_RUN)
>  					return 0;
> +			}
>
>  			if (test_bit(IMXMCI_PEND_STARTED_b, &host->pending_events))
>  				return 0;
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--
                Pavel Pisa
    e-mail:     pisa@cmp.felk.cvut.cz
    www:        http://cmp.felk.cvut.cz/~pisa
    university: http://dce.fel.cvut.cz/
    company:    http://www.pikron.com/
