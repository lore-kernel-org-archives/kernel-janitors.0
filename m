From: "Arend van Spriel" <arend@broadcom.com>
Date: Thu, 06 Jun 2013 11:46:11 +0000
Subject: Re: [patch] brcmfmac: move dereference under check for NULL
Message-Id: <51B07683.2030408@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130606105556.GD12953@debian>
In-Reply-To: <20130606105556.GD12953@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, Piotr Haber <phaber@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

On 06/06/2013 12:55 PM, Dan Carpenter wrote:
> skb_pull() dereferences the skb parameter.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hi Dan,

Just missed that. This code fragment was resubmitted just minutes ago. I 
will rework the patch to incorporate this change.

Regards,
Arend

> diff --git a/drivers/net/wireless/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/brcm80211/brcmfmac/fwsignal.c
> index ea37bd4..c35296f 100644
> --- a/drivers/net/wireless/brcm80211/brcmfmac/fwsignal.c
> +++ b/drivers/net/wireless/brcm80211/brcmfmac/fwsignal.c
> @@ -861,9 +861,9 @@ static bool brcmf_fws_tim_update(struct brcmf_fws_info *fws,
>   		      BRCMF_FWS_TYPE_PENDING_TRAFFIC_BMP_LEN + 2 +
>   		      4 + fws->drvr->hdrlen;
>   		skb = brcmu_pkt_buf_get_skb(len);
> -		skb_pull(skb, len);
>   		if (skb = NULL)
>   			return false;
> +		skb_pull(skb, len);
>   		skcb = brcmf_skbcb(skb);
>   		skcb->mac = entry;
>   		skcb->state = BRCMF_FWS_SKBSTATE_TIM;
>


