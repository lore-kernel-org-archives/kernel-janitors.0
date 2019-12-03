From: Franky Lin <franky.lin@broadcom.com>
Date: Tue, 03 Dec 2019 18:42:20 +0000
Subject: Re: [PATCH] brcmfmac: Fix use after free in brcmf_sdio_readframes()
Message-Id: <CA+8PC_ehSW=-eVC0qAbh-m+8WHwKrmbYWrhmX8w4ovGS8TVE0w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191203095855.c4fradmsixgbq7mc@kili.mountain>
In-Reply-To: <20191203095855.c4fradmsixgbq7mc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <frankyl@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Naveen Gupta <naveen.gupta@cypress.com>, "open list:BROADCOM BRCM80211 IEEE802.11n WIRELESS DRIVER" <linux-wireless@vger.kernel.org>, "open list:BROADCOM BRCM80211 IEEE802.11n WIRELESS DRIVER" <brcm80211-dev-list.pdl@broadcom.com>, brcm80211-dev-list <brcm80211-dev-list@cypress.com>, kernel-janitors@vger.kernel.org

On Tue, Dec 3, 2019 at 1:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The brcmu_pkt_buf_free_skb() function frees "pkt" so it leads to a
> static checker warning:
>
>     drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:1974 brcmf_sdio_readframes()
>     error: dereferencing freed memory 'pkt'
>
> It looks like there was supposed to be a continue after we free "pkt".

Good catch!

Acked-by: Franky Lin <franky.lin@broadcom.com>

>
> Fixes: 4754fceeb9a6 ("brcmfmac: streamline SDIO read frame routine")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  Not tested.
>
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> index 264ad63232f8..1dea0178832e 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> @@ -1935,6 +1935,7 @@ static uint brcmf_sdio_readframes(struct brcmf_sdio *bus, uint maxframes)
>                                                BRCMF_SDIO_FT_NORMAL)) {
>                                 rd->len = 0;
>                                 brcmu_pkt_buf_free_skb(pkt);
> +                               continue;
>                         }
>                         bus->sdcnt.rx_readahead_cnt++;
>                         if (rd->len != roundup(rd_new.len, 16)) {
> --
> 2.11.0
>
