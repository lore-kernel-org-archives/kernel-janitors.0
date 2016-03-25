From: Joe Perches <joe@perches.com>
Date: Fri, 25 Mar 2016 03:19:49 +0000
Subject: Re: [PATCH 1/2] staging: dgnc: fix 'line over 80 characters'
Message-Id: <1458875989.3209.11.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160325024406.GA23833@SEL-JYOUN-D1>
In-Reply-To: <20160325024406.GA23833@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Daeseok Youn <daeseok.youn@gmail.com>, lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2016-03-25 at 11:44 +0900, Daeseok Youn wrote:
> fix checkpatch.pl warning about 'line over 80 characters'
> in dgnc_neo.c
[]
> diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
[]
> @@ -77,7 +77,8 @@ struct board_ops dgnc_neo_ops = {
>  	.send_immediate_char =		neo_send_immediate_char
>  };
>  
> -static uint dgnc_offset_table[8] = { 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80 };
> +static uint dgnc_offset_table[8] = { 0x01, 0x02, 0x04, 0x08,
> +				     0x10, 0x20, 0x40, 0x80 };

It may be better to remove this array and use BIT or << where
dgnc_offset_table is used instead.

If not, this should be const.

static const uint dgnc_offset_table[] = {
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
};

> @@ -116,7 +117,8 @@ static inline void neo_set_cts_flow_control(struct channel_t *ch)
>  	writeb(efr, &ch->ch_neo_uart->efr);
>  
>  	/* Turn on table D, with 8 char hi/low watermarks */
> -	writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY), &ch->ch_neo_uart->fctr);
> +	writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY),
> +		&ch->ch_neo_uart->fctr);

You could remove parentheses here around the CONST | CONST

> @@ -150,7 +152,8 @@ static inline void neo_set_rts_flow_control(struct channel_t *ch)
>  	/* Turn on UART enhanced bits */
>  	writeb(efr, &ch->ch_neo_uart->efr);
>  
> -	writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY), &ch->ch_neo_uart->fctr);
> +	writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY),
> +		&ch->ch_neo_uart->fctr);

and here and all the other writeb uses

