From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Date: Wed, 09 Jun 2010 09:11:38 +0000
Subject: RE: [patch] caif: fix a couple range checks
Message-Id: <81C3A93C17462B4BBD7E272753C10579169C4D9E64@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100607145158.GO5483@bicker>
In-Reply-To: <20100607145158.GO5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> From: Dan Carpenter [mailto:error27@gmail.com]
> 
> The extra ! character means that these conditions are always false.


Looks good, thanks. This is embarrassing, I should caught this ages ago.
Acked-by: Sjur Braendeland <sjur.brandeland@stericsson.com>

> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/net/caif/cfveil.c b/net/caif/cfveil.c
> index 0fd827f..e04f7d9 100644
> --- a/net/caif/cfveil.c
> +++ b/net/caif/cfveil.c
> @@ -84,7 +84,7 @@ static int cfvei_transmit(struct cflayer *layr,
> struct cfpkt *pkt)
>  		return ret;
>  	caif_assert(layr->dn != NULL);
>  	caif_assert(layr->dn->transmit != NULL);
> -	if (!cfpkt_getlen(pkt) > CAIF_MAX_PAYLOAD_SIZE) {
> +	if (cfpkt_getlen(pkt) > CAIF_MAX_PAYLOAD_SIZE) {
>  		pr_warning("CAIF: %s(): Packet too large - size=%d\n",
>  			   __func__, cfpkt_getlen(pkt));
>  		return -EOVERFLOW;
> diff --git a/net/caif/cfrfml.c b/net/caif/cfrfml.c
> index cd2830f..fd27b17 100644
> --- a/net/caif/cfrfml.c
> +++ b/net/caif/cfrfml.c
> @@ -83,7 +83,7 @@ static int cfrfml_transmit(struct cflayer *layr,
> struct cfpkt *pkt)
>  	if (!cfsrvl_ready(service, &ret))
>  		return ret;
> 
> -	if (!cfpkt_getlen(pkt) > CAIF_MAX_PAYLOAD_SIZE) {
> +	if (cfpkt_getlen(pkt) > CAIF_MAX_PAYLOAD_SIZE) {
>  		pr_err("CAIF: %s():Packet too large - size=%d\n",
>  			__func__, cfpkt_getlen(pkt));
>  		return -EOVERFLOW;
