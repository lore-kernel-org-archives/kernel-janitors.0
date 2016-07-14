From: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
Date: Thu, 14 Jul 2016 11:08:41 +0000
Subject: Re: [patch] avr32: off by one in at32_init_pio()
Message-Id: <20160714110841.GA13155@samfundet.no>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713100855.GE29468@mwanda>
In-Reply-To: <20160713100855.GE29468@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Around Wed 13 Jul 2016 13:08:55 +0300 or thereabout, Dan Carpenter wrote:
> The pio_dev[] array has MAX_NR_PIO_DEVICES elements so the > should be
>>=.

So it should, no off by one error in the kernel anyway, since at32ap700x only
probes 5 PIO instances.

> Fixes: 5f97f7f9400d ('[PATCH] avr32 architecture')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>

I will add this to my linux-next branch for the next merge window.

> diff --git a/arch/avr32/mach-at32ap/pio.c b/arch/avr32/mach-at32ap/pio.c
> index 83c2a00..13d3fc4 100644
> --- a/arch/avr32/mach-at32ap/pio.c
> +++ b/arch/avr32/mach-at32ap/pio.c
> @@ -435,7 +435,7 @@ void __init at32_init_pio(struct platform_device *pdev)
>  	struct resource *regs;
>  	struct pio_device *pio;
>  
> -	if (pdev->id > MAX_NR_PIO_DEVICES) {
> +	if (pdev->id >= MAX_NR_PIO_DEVICES) {
>  		dev_err(&pdev->dev, "only %d PIO devices supported\n",
>  			MAX_NR_PIO_DEVICES);
>  		return;
> 
-- 
mvh
Hans-Christian Noren Egtvedt
