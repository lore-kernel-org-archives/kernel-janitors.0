From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Date: Wed, 20 Apr 2016 08:31:00 +0000
Subject: Re: [patch] brcmfmac: testing the wrong variable in brcmf_rx_hdrpull()
Message-Id: <57173E44.6050306@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160419142543.GC4876@mwanda>
In-Reply-To: <20160419142543.GC4876@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Brett Rudley <brudley@broadcom.com>, Arend van Spriel <arend@broadcom.com>
Cc: "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, Kalle Valo <kvalo@codeaurora.org>, Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

On 19-4-2016 16:25, Dan Carpenter wrote:
> Smatch complains about this code:
> 
>     drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c:335 brcmf_rx_hdrpull()
>     error: we previously assumed '*ifp' could be null (see line 333)
> 
> The problem is that we recently changed these from "ifp" to "*ifp" but
> there was one that we didn't update.
> 
> -       if (ret || !ifp || !ifp->ndev) {
> +       if (ret || !(*ifp) || !(*ifp)->ndev) {
>                 if (ret != -ENODATA && ifp)
>                                        ^^^
> -                       ifp->stats.rx_errors++;
> +                       (*ifp)->stats.rx_errors++;
> 
> I have updated it to *ifp as well.  We always call this function is a
> non-NULL "ifp" pointer, btw.

Great. Maybe we (Broadcom) should consider running smatch on our patch
series or simply rely on your excellent work :-p. Thanks for catching this.

Acked-by: Arend van Spriel <arend@broadcom.com>
> Fixes: c462ebcdfe42 ('brcmfmac: create common function for handling brcmf_proto_hdrpull()')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
> index 1b476d1..b590499 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
> @@ -331,7 +331,7 @@ static int brcmf_rx_hdrpull(struct brcmf_pub *drvr, struct sk_buff *skb,
>  	ret = brcmf_proto_hdrpull(drvr, true, skb, ifp);
>  
>  	if (ret || !(*ifp) || !(*ifp)->ndev) {
> -		if (ret != -ENODATA && ifp)
> +		if (ret != -ENODATA && *ifp)
>  			(*ifp)->stats.rx_errors++;
>  		brcmu_pkt_buf_free_skb(skb);
>  		return -ENODATA;
> 
