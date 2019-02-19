From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Date: Tue, 19 Feb 2019 09:23:46 +0000
Subject: Re: [PATCH] brcmfmac: remove set but not used variable 'old_state'
Message-Id: <eda4bb84-0f38-5d70-0f40-0f80bd748ad2@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218080846.187942-1-yuehaibing@huawei.com>
In-Reply-To: <20190218080846.187942-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, kernel-janitors@vger.kernel.org

On 2/18/2019 9:08 AM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c: In function 'brcmf_usb_state_change':
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c:578:6: warning:
>   variable 'old_state' set but not used [-Wunused-but-set-variable]
> 
> It's never used and can be removed.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 2 --
>   1 file changed, 2 deletions(-)
