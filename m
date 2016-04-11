From: Michal Kazior <michal.kazior@tieto.com>
Date: Mon, 11 Apr 2016 07:52:34 +0000
Subject: Re: [patch] ath10k: add some sanity checks
Message-Id: <CA+BoTQmpYtGoYk4M-NaFduO8iX0KYgoLz6Mj_40i0um8MqDdww@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160411074438.GA15227@mwanda>
In-Reply-To: <20160411074438.GA15227@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 11 April 2016 at 09:44, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Smatch complains that since "ev->peer_id" comes from skb->data that
> means we can't trust it and have to do a bounds check on it to prevent
> an array overflow.
>
> Fixes: 6942726f7f7b ('ath10k: add fast peer_map lookup')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireles=
s/ath/ath10k/txrx.c
> index 9369411..fd6ba69 100644
> --- a/drivers/net/wireless/ath/ath10k/txrx.c
> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> @@ -190,6 +190,9 @@ void ath10k_peer_map_event(struct ath10k_htt *htt,
>         struct ath10k *ar =3D htt->ar;
>         struct ath10k_peer *peer;
>
> +       if (ev->peer_id >=3D ATH10K_MAX_NUM_PEER_IDS)
> +               return;
> +

This will lead to a timeout in the other part of the code so printing
a warning here will make it easier to understand the failure, e.g.

  ath10k_warn(ar, "received htt peer map event with idx out of bounds:
%hu\n", ev->peer_id);


>         spin_lock_bh(&ar->data_lock);
>         peer =3D ath10k_peer_find(ar, ev->vdev_id, ev->addr);
>         if (!peer) {
> @@ -218,6 +221,9 @@ void ath10k_peer_unmap_event(struct ath10k_htt *htt,
>         struct ath10k *ar =3D htt->ar;
>         struct ath10k_peer *peer;
>
> +       if (ev->peer_id >=3D ATH10K_MAX_NUM_PEER_IDS)
> +               return;

Ditto but s/map/unmap.

Anyway, good catch, thanks!


Micha=C5=82
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
