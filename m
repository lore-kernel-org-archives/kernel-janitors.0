From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 19 Feb 2019 15:08:01 +0000
Subject: Re: [PATCH] brcmfmac: remove set but not used variable 'old_state'
Message-Id: <20190219150802.012256071A@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218080846.187942-1-yuehaibing@huawei.com>
In-Reply-To: <20190218080846.187942-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c: In function 'brcmf_usb_state_change':
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c:578:6: warning:
>  variable 'old_state' set but not used [-Wunused-but-set-variable]
> 
> It's never used and can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Patch applied to wireless-drivers-next.git, thanks.

e4d1b2716b88 brcmfmac: remove set but not used variable 'old_state'

-- 
https://patchwork.kernel.org/patch/10817429/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
