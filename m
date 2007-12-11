From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Tue, 11 Dec 2007 13:19:36 +0000
Subject: Re: [PATCH 1/6] pcmcia/3c574_cs: Fix dubious bitfield warning
Message-Id: <20071211131936.3379f2af@the-village.bc.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Knutsson <ricknu-0@student.ltu.se>
Cc: linux-pcmcia@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 11 Dec 2007 05:32:38 +0100 (MET)
Richard Knutsson <ricknu-0@student.ltu.se> wrote:

> Fixing:
>   CHECK   drivers/net/pcmcia/3c574_cs.c
> drivers/net/pcmcia/3c574_cs.c:194:13: warning: dubious bitfield without explicit `signed' or `unsigned'
> drivers/net/pcmcia/3c574_cs.c:196:14: warning: dubious bitfield without explicit `signed' or `unsigned'
> 
> Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
> ---
> Is there a reason for not doing it this way?

How is the endianness handled here (I suspect its always been broken)

> diff --git a/drivers/net/pcmcia/3c574_cs.c b/drivers/net/pcmcia/3c574_cs.c
> index ad134a6..97b6daa 100644
> --- a/drivers/net/pcmcia/3c574_cs.c
> +++ b/drivers/net/pcmcia/3c574_cs.c
> @@ -190,10 +190,10 @@ enum Window3 {			/* Window 3: MAC/config bits. */
>  union wn3_config {
>  	int i;
>  	struct w3_config_fields {
> -		unsigned int ram_size:3, ram_width:1, ram_speed:2, rom_size:2;
> -		int pad8:8;
> -		unsigned int ram_split:2, pad18:2, xcvr:3, pad21:1, autoselect:1;
> -		int pad24:7;
> +		u8 ram_size:3, ram_width:1, ram_speed:2, rom_size:2;
> +		u8 pad8;
> +		u8 ram_split:2, pad18:2, xcvr:3, pad21:1;
> +		u8 autoselect:1, pad24:7;

Just changing the int pad to unsigned int pad would be safer in terms of
not causing changes. Simply delcaring a 32bit field and bit masks to
and/or into it is probably a lot saner in the general case.
