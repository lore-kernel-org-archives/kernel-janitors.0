From: Andrei Emeltchenko <andrei.emeltchenko.news@gmail.com>
Date: Mon, 17 Jan 2011 10:28:29 +0000
Subject: Re: [PATCH] net: bluetooth: fix locking problem
Message-Id: <AANLkTi=5GpSEsGNMcfTVDyo_cHoELPaD8EmJGUhPxPw2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1295258917-31092-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1295258917-31092-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: kernel-janitors@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, "Gustavo F. Padovan" <padovan@profusion.mobi>, "David S. Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 17, 2011 at 12:08 PM, Vasiliy Kulikov <segoon@openwall.com> wro=
te:
> If alloc_skb() failed we still hold hci_dev_list_lock. =A0The code should
> unlock it before exit.
>
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> ---
> =A0Compile tested only.
>
> =A0net/bluetooth/mgmt.c | =A0 =A04 +++-
> =A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index f827fd9..ace8726 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -111,8 +111,10 @@ static int read_index_list(struct sock *sk)
>
> =A0 =A0 =A0 =A0body_len =3D sizeof(*ev) + sizeof(*rp) + (2 * count);
> =A0 =A0 =A0 =A0skb =3D alloc_skb(sizeof(*hdr) + body_len, GFP_ATOMIC);
> - =A0 =A0 =A0 if (!skb)
> + =A0 =A0 =A0 if (!skb) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 read_unlock(&hci_dev_list_lock);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> + =A0 =A0 =A0 }

patch was send already on weekend

>
> =A0 =A0 =A0 =A0hdr =3D (void *) skb_put(skb, sizeof(*hdr));
> =A0 =A0 =A0 =A0hdr->opcode =3D cpu_to_le16(MGMT_EV_CMD_COMPLETE);
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
