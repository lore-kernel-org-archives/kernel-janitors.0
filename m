From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 18 Dec 2019 18:58:30 +0000
Subject: Re: [PATCH] brcmfmac: Fix use after free in brcmf_sdio_readframes()
Message-Id: <20191218185830.613F4C447A0@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191203095855.c4fradmsixgbq7mc@kili.mountain>
In-Reply-To: <20191203095855.c4fradmsixgbq7mc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <frankyl@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Douglas Anderson <dianders@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>, =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Naveen Gupta <naveen.gupta@cypress.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The brcmu_pkt_buf_free_skb() function frees "pkt" so it leads to a
> static checker warning:
> 
>     drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:1974 brcmf_sdio_readframes()
>     error: dereferencing freed memory 'pkt'
> 
> It looks like there was supposed to be a continue after we free "pkt".
> 
> Fixes: 4754fceeb9a6 ("brcmfmac: streamline SDIO read frame routine")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Franky Lin <franky.lin@broadcom.com>

Patch applied to wireless-drivers-next.git, thanks.

216b44000ada brcmfmac: Fix use after free in brcmf_sdio_readframes()

-- 
https://patchwork.kernel.org/patch/11270885/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
