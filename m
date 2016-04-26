From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 26 Apr 2016 09:30:10 +0000
Subject: Re: brcmfmac: testing the wrong variable in brcmf_rx_hdrpull()
Message-Id: <20160426093010.1EFA76029D@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160419142543.GC4876@mwanda>
References: <20160419142543.GC4876@mwanda>
In-Reply-To: <20160419142543.GC4876@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org


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
> 
> Fixes: c462ebcdfe42 ('brcmfmac: create common function for handling brcmf_proto_hdrpull()')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Arend van Spriel <arend@broadcom.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
