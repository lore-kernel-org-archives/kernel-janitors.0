From: Jerome Pouiller <Jerome.Pouiller@silabs.com>
Date: Fri, 24 Apr 2020 13:09:37 +0000
Subject: Re: [PATCH v2] staging: wfx: cleanup long lines in data_tx.c
Message-Id: <5205303.5Yc9DUstMz@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200424124105.GA18534@blackclown>
In-Reply-To: <20200424124105.GA18534@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Suraj Upadhyay <usuraj35@gmail.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Friday 24 April 2020 14:41:32 CEST Suraj Upadhyay wrote:
> Break lines with length over 80 characters to conform
> to the linux coding style and refactor wherever necessary.
>=20
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>=20
> Changes in v2:
> 	- Introduced a temporary variable for the memzcmp statement.
> 	- Addressed the checkpatch problem with wfx_get_hw_rate().
> 	- Restored the function definition of wfx_tx_get_tx_parms
> 	  as suggested by the reviewer.
> 	- Added suggested changes for req->packet_id statement.
>=20
>  drivers/staging/wfx/data_tx.c | 39 ++++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/staging/wfx/data_tx.c b/drivers/staging/wfx/data_tx.c
> index 9c1a91207dd8..ae472ff8a088 100644
> --- a/drivers/staging/wfx/data_tx.c
> +++ b/drivers/staging/wfx/data_tx.c
> @@ -20,6 +20,7 @@
>  static int wfx_get_hw_rate(struct wfx_dev *wdev,
>  			   const struct ieee80211_tx_rate *rate)
>  {
> +	struct ieee80211_rate tmp;

There should be an empty line between variables declarations and start of
the code.

Maybe you could find a better name for the variable? (arf... "rate" is
already used)

>  	if (rate->idx < 0)
>  		return -1;
>  	if (rate->flags & IEEE80211_TX_RC_MCS) {
> @@ -31,7 +32,8 @@ static int wfx_get_hw_rate(struct wfx_dev *wdev,
>  	}
>  	// WFx only support 2GHz, else band information should be retrieved
>  	// from ieee80211_tx_info
> -	return wdev->hw->wiphy->bands[NL80211_BAND_2GHZ]->bitrates[rate->idx].h=
w_value;
> +	tmp =3D wdev->hw->wiphy->bands[NL80211_BAND_2GHZ]->bitrates[rate->idx];

I would avoid the copy of the struct. (event if, in your case, I think it
does not change the generated code.

> +	return tmp.hw_value;
>  }
> =20
>  /* TX policy cache implementation */
> @@ -159,14 +161,16 @@ static int wfx_tx_policy_upload(struct wfx_vif *wvi=
f)
>  {
>  	struct tx_policy *policies =3D wvif->tx_policy_cache.cache;
>  	u8 tmp_rates[12];
> -	int i;
> +	int i, tmp;

Maybe you could name it 'is_used' ?

> =20
>  	do {
>  		spin_lock_bh(&wvif->tx_policy_cache.lock);
> -		for (i =3D 0; i < HIF_TX_RETRY_POLICY_MAX; ++i)
> -			if (!policies[i].uploaded &&
> -			    memzcmp(policies[i].rates, sizeof(policies[i].rates)))
> +		for (i =3D 0; i < HIF_TX_RETRY_POLICY_MAX; ++i) {
> +			tmp =3D memzcmp(policies[i].rates,
> +				      sizeof(policies[i].rates));
> +			if (!policies[i].uploaded && tmp)
>  				break;
> +		}
>  		if (i < HIF_TX_RETRY_POLICY_MAX) {
>  			policies[i].uploaded =3D true;
>  			memcpy(tmp_rates, policies[i].rates, sizeof(tmp_rates));
> @@ -290,7 +294,8 @@ static void wfx_tx_fixup_rates(struct ieee80211_tx_ra=
te *rates)
>  		if (rates[i].idx =3D=3D -1) {
>  			rates[i].idx =3D 0;
>  			rates[i].count =3D 8; // =3D=3D hw->max_rate_tries
> -			rates[i].flags =3D rates[i - 1].flags & IEEE80211_TX_RC_MCS;
> +			rates[i].flags =3D rates[i - 1].flags &
> +					 IEEE80211_TX_RC_MCS;
>  			break;
>  		}
>  	}
> @@ -318,7 +323,8 @@ static u8 wfx_tx_get_rate_id(struct wfx_vif *wvif,
>  	return rate_id;
>  }
> =20
> -static struct hif_ht_tx_parameters wfx_tx_get_tx_parms(struct wfx_dev *w=
dev, struct ieee80211_tx_info *tx_info)
> +static struct hif_ht_tx_parameters wfx_tx_get_tx_parms(struct wfx_dev *w=
dev,
> +						       struct ieee80211_tx_info *tx_info)
>  {
>  	struct ieee80211_tx_rate *rate =3D &tx_info->driver_rates[0];
>  	struct hif_ht_tx_parameters ret =3D { };
> @@ -381,7 +387,8 @@ static int wfx_tx_inner(struct wfx_vif *wvif, struct =
ieee80211_sta *sta,
>  	hif_msg->id =3D HIF_REQ_ID_TX;
>  	hif_msg->interface =3D wvif->id;
>  	if (skb->len > wvif->wdev->hw_caps.size_inp_ch_buf) {
> -		dev_warn(wvif->wdev->dev, "requested frame size (%d) is larger than ma=
ximum supported (%d)\n",
> +		dev_warn(wvif->wdev->dev,
> +			 "requested frame size (%d) is larger than maximum supported (%d)\n",
>  			 skb->len, wvif->wdev->hw_caps.size_inp_ch_buf);
>  		skb_pull(skb, wmsg_len);
>  		return -EIO;
> @@ -392,9 +399,10 @@ static int wfx_tx_inner(struct wfx_vif *wvif, struct=
 ieee80211_sta *sta,
>  	// packet_id just need to be unique on device. 32bits are more than
>  	// necessary for that task, so we tae advantage of it to add some extra
>  	// data for debug.
> -	req->packet_id =3D queue_id << 28 |
> -			 IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl)) << 16 |
> -			 (atomic_add_return(1, &wvif->wdev->packet_id) & 0xFFFF);
> +	req->packet_id =3D atomic_add_return(1, &wvif->wdev->packet_id) & 0xFFF=
F;
> +	req->packet_id |=3D IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl)) << =
16;
> +	req->packet_id |=3D queue_id << 28;
> +
>  	req->data_flags.fc_offset =3D offset;
>  	if (tx_info->flags & IEEE80211_TX_CTL_SEND_AFTER_DTIM)
>  		req->data_flags.after_dtim =3D 1;
> @@ -517,7 +525,8 @@ void wfx_tx_confirm_cb(struct wfx_vif *wvif, const st=
ruct hif_cnf_tx *arg)
>  		if (tx_count < rate->count &&
>  		    arg->status =3D=3D HIF_STATUS_RETRY_EXCEEDED &&
>  		    arg->ack_failures)
> -			dev_dbg(wvif->wdev->dev, "all retries were not consumed: %d !=3D %d\n=
",
> +			dev_dbg(wvif->wdev->dev,
> +				"all retries were not consumed: %d !=3D %d\n",
>  				rate->count, tx_count);
>  		if (tx_count <=3D rate->count && tx_count &&
>  		    arg->txed_rate !=3D wfx_get_hw_rate(wvif->wdev, rate))
> @@ -554,7 +563,8 @@ void wfx_tx_confirm_cb(struct wfx_vif *wvif, const st=
ruct hif_cnf_tx *arg)
>  		else
>  			tx_info->flags |=3D IEEE80211_TX_STAT_ACK;
>  	} else if (arg->status =3D=3D HIF_REQUEUE) {
> -		WARN(!arg->tx_result_flags.requeue, "incoherent status and result_flag=
s");
> +		WARN(!arg->tx_result_flags.requeue,
> +		     "incoherent status and result_flags");
>  		if (tx_info->flags & IEEE80211_TX_CTL_SEND_AFTER_DTIM) {
>  			wvif->after_dtim_tx_allowed =3D false; // DTIM period elapsed
>  			schedule_work(&wvif->update_tim_work);
> @@ -588,7 +598,8 @@ void wfx_flush(struct ieee80211_hw *hw, struct ieee80=
211_vif *vif,
>  		if (wait_event_timeout(wdev->tx_dequeue,
>  				       wfx_tx_queue_empty(wdev, queue, vif_id),
>  				       msecs_to_jiffies(1000)) <=3D 0)
> -			dev_warn(wdev->dev, "frames queued while flushing tx queues?");
> +			dev_warn(wdev->dev,
> +				 "frames queued while flushing tx queues?");
>  	}
>  	wfx_tx_flush(wdev);
>  	if (wdev->chip_frozen)
>=20

Ok, for the last changes.

--=20
J=E9r=F4me Pouiller
