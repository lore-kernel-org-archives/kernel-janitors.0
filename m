From: Luis de Bethencourt <luisbg@osg.samsung.com>
Date: Fri, 27 May 2016 11:54:42 +0000
Subject: Re: [PATCH 2/7] staging: dgnc: remove unused variable 'intr_modem'
Message-Id: <57483582.2080307@osg.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160527065317.GA2966@SEL-JYOUN-D1>
In-Reply-To: <20160527065317.GA2966@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>, lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 27/05/16 07:53, Daeseok Youn wrote:
> The 'intr_modem' variable was used only for increasing.
> So the 'intr_modem' variable is not useful for this driver.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
>  drivers/staging/dgnc/dgnc_cls.c    | 1 -
>  drivers/staging/dgnc/dgnc_driver.h | 1 -
>  drivers/staging/dgnc/dgnc_neo.c    | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
> index dcb808f..8cb7361 100644
> --- a/drivers/staging/dgnc/dgnc_cls.c
> +++ b/drivers/staging/dgnc/dgnc_cls.c
> @@ -406,7 +406,6 @@ static inline void cls_parse_isr(struct dgnc_board *brd, uint port)
>  
>  		/* CTS/RTS change of state */
>  		if (isr & UART_IIR_CTSRTS) {
> -			brd->intr_modem++;
>  			ch->ch_intr_modem++;
>  			/*
>  			 * Don't need to do anything, the cls_parse_modem
> diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
> index 7ac33ed..2caeff7 100644
> --- a/drivers/staging/dgnc/dgnc_driver.h
> +++ b/drivers/staging/dgnc/dgnc_driver.h
> @@ -183,7 +183,6 @@ struct dgnc_board {
>  	uint		nasync;		/* Number of ports on card */
>  
>  	uint		irq;		/* Interrupt request number */
> -	ulong		intr_modem;	/* Count of interrupts */
>  	ulong		intr_tx;	/* Count of interrupts */
>  	ulong		intr_rx;	/* Count of interrupts */
>  
> diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
> index 3f8bbb3..a3e100b 100644
> --- a/drivers/staging/dgnc/dgnc_neo.c
> +++ b/drivers/staging/dgnc/dgnc_neo.c
> @@ -452,7 +452,6 @@ static inline void neo_parse_isr(struct dgnc_board *brd, uint port)
>  			 * If we get here, this means the hardware is doing auto flow control.
>  			 * Check to see whether RTS/DTR or CTS/DSR caused this interrupt.
>  			 */
> -			brd->intr_modem++;
>  			ch->ch_intr_modem++;
>  			cause = readb(&ch->ch_neo_uart->mcr);
>  			/* Which pin is doing auto flow? RTS or DTR? */
> 

Looks good.

Luis
