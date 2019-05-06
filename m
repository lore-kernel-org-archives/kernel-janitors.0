From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 06 May 2019 04:11:02 +0000
Subject: Re: [PATCH][next] brcmfmac: remove redundant u32 comparison with less than zero
Message-Id: <CACna6rzqzzST4zu-6umnezmznnfoUqQP6V-yfyePaqCX8NakQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190505211623.3153-1-colin.king@canonical.com>
In-Reply-To: <20190505211623.3153-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Wright Feng <wright.feng@cypress.com>
Cc: Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "open list:BROADCOM BRCM80211 IEEE802.11n WIRELESS DRIVER" <brcm80211-dev-list.pdl@broadcom.com>, "open list:BROADCOM BRCM80211 IEEE802.11n WIRELESS DRIVER
        <brcm80211-dev-list.pdl@broadcom.com>," <brcm80211-dev-list@cypress.com>, Network Development <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, 5 May 2019 at 23:33, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The check for the u32 variable idx being less than zero is
> always false and is redundant. Remove it.
>
> Addresses-Coverity: ("Unsigned compared against 0")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/=
drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
> index 9d1f9ff25bfa..e874dddc7b7f 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
> @@ -375,7 +375,7 @@ brcmf_msgbuf_get_pktid(struct device *dev, struct brc=
mf_msgbuf_pktids *pktids,
>         struct brcmf_msgbuf_pktid *pktid;
>         struct sk_buff *skb;
>
> -       if (idx < 0 || idx >=3D pktids->array_size) {
> +       if (idx >=3D pktids->array_size) {
>                 brcmf_err("Invalid packet id %d (max %d)\n", idx,
>                           pktids->array_size);
>                 return NULL;

It was added in the commit 2d91c8ad068a ("brcmfmac: set txflow request
id from 1 to pktids array size") and was probably meant to handle a
following brcmf_msgbuf_process_txstatus() case:
idx =3D le32_to_cpu(tx_status->msg.request_id) - 1;

So this patch is wrong/incomplete.

You should change that to a signed value OR add an extra check in
brcmf_msgbuf_process_txstatus() to make sure it doesn't pass -1 as u32
argument.

--=20
Rafa=C5=82
