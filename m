From: Juuso Oikarinen <juuso.oikarinen@nokia.com>
Date: Mon, 02 Aug 2010 05:04:11 +0000
Subject: Re: [PATCH] net: wl12xx: do not use kfree'd memory
Message-Id: <1280725451.6475.111.camel@wimaxnb.nmp.nokia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280594039-3246-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280594039-3246-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ext Kulikov Vasiliy <segooon@gmail.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Coelho Luciano (Nokia-MS/Helsinki)" <Luciano.Coelho@nokia.com>, "John W. Linville" <linville@tuxdriver.com>, "Paasikivi Teemu.3 (EXT-Ixonos/Tampere)" <ext-teemu.3.paasikivi@nokia.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Sat, 2010-07-31 at 18:33 +0200, ext Kulikov Vasiliy wrote:
> wl1271_dump() uses cmd after kfree(cmd). Move kfree() just after
> wl1271_dump().
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/net/wireless/wl12xx/wl1271_spi.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/wl12xx/wl1271_spi.c b/drivers/net/wireless/wl12xx/wl1271_spi.c
> index 96d25fb..4cb99c5 100644
> --- a/drivers/net/wireless/wl12xx/wl1271_spi.c
> +++ b/drivers/net/wireless/wl12xx/wl1271_spi.c
> @@ -160,9 +160,8 @@ static void wl1271_spi_init(struct wl1271 *wl)
>  	spi_message_add_tail(&t, &m);
>  
>  	spi_sync(wl_to_spi(wl), &m);
> -	kfree(cmd);
> -
>  	wl1271_dump(DEBUG_SPI, "spi init -> ", cmd, WSPI_INIT_CMD_LEN);
> +	kfree(cmd);
>  }
>  
>  #define WL1271_BUSY_WORD_TIMEOUT 1000

Whoops ;) Good catch, thanks.

Acked-by: Juuso Oikarinen <juuso.oikarinen@nokia.com>

-Juuso

