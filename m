From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 07 Sep 2017 21:31:43 +0000
Subject: Re: [PATCH] input: elantech: make arrays debounce_packet static, reduces object code size
Message-Id: <20170907213143.GB19320@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170906125944.16936-1-colin.king@canonical.com>
In-Reply-To: <20170906125944.16936-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ulrik De Bie <ulrik.debie-os@e2big.org>, KT Liao <kt.liao@emc.com.tw>, Matti Kurkela <Matti.Kurkela@iki.fi>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 06, 2017 at 01:59:44PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the arrays debounce_packet on the stack, instead make
> them static.  Makes the object code smaller by over 870 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   30553	   9152	      0	  39705	   9b19	drivers/input/mouse/elantech.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   29521	   9312	      0	  38833	   97b1	drivers/input/mouse/elantech.o
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.

> ---
>  drivers/input/mouse/elantech.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> index 6428d6f4d568..b84cd978fce2 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -700,7 +700,9 @@ static int elantech_debounce_check_v2(struct psmouse *psmouse)
>           * When we encounter packet that matches this exactly, it means the
>           * hardware is in debounce status. Just ignore the whole packet.
>           */
> -        const u8 debounce_packet[] = { 0x84, 0xff, 0xff, 0x02, 0xff, 0xff };
> +	static const u8 debounce_packet[] = {
> +		0x84, 0xff, 0xff, 0x02, 0xff, 0xff
> +	};
>          unsigned char *packet = psmouse->packet;
>  
>          return !memcmp(packet, debounce_packet, sizeof(debounce_packet));
> @@ -741,7 +743,9 @@ static int elantech_packet_check_v2(struct psmouse *psmouse)
>  static int elantech_packet_check_v3(struct psmouse *psmouse)
>  {
>  	struct elantech_data *etd = psmouse->private;
> -	const u8 debounce_packet[] = { 0xc4, 0xff, 0xff, 0x02, 0xff, 0xff };
> +	static const u8 debounce_packet[] = {
> +		0xc4, 0xff, 0xff, 0x02, 0xff, 0xff
> +	};
>  	unsigned char *packet = psmouse->packet;
>  
>  	/*
> -- 
> 2.14.1
> 

-- 
Dmitry
