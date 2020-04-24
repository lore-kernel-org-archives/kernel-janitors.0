From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Fri, 24 Apr 2020 13:48:56 +0000
Subject: [PATCH v3] staging: wfx: cleanup long lines in data_tx.c
Message-Id: <20200424134834.GA19700@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="YZ5djTAD1cGYuMQK"
List-Id: <kernel-janitors.vger.kernel.org>
To: jerome.pouiller@silabs.com, gregkh@linuxfoundation.org, dan.carpenter@oracle.com
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Break lines with length over 80 characters to conform
to the linux coding style and refactor wherever necessary.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---

Changes in v3:
	- Changed the temporary variable name for the memzcmp statement
	  to is_used. (as suggested).
	- Added a temporary ieee80211_supported_band variable to address
	  the problem in wfx_get_hw_rate() more efficiently. (not
	  suggested, but still).

Changes in v2:
        - Introduced a temporary variable for the memzcmp statement.
        - Addressed the checkpatch problem with wfx_get_hw_rate().
        - Restored the function definition of wfx_tx_get_tx_parms
          as suggested by the reviewer.
        - Added suggested changes for req->packet_id statement.

 drivers/staging/wfx/data_tx.c | 40 +++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/wfx/data_tx.c b/drivers/staging/wfx/data_tx.c
index 9c1a91207dd8..717155975345 100644
--- a/drivers/staging/wfx/data_tx.c
+++ b/drivers/staging/wfx/data_tx.c
@@ -20,6 +20,8 @@
 static int wfx_get_hw_rate(struct wfx_dev *wdev,
 			   const struct ieee80211_tx_rate *rate)
 {
+
+	struct ieee80211_supported_band *band;
 	if (rate->idx < 0)
 		return -1;
 	if (rate->flags & IEEE80211_TX_RC_MCS) {
@@ -31,7 +33,8 @@ static int wfx_get_hw_rate(struct wfx_dev *wdev,
 	}
 	// WFx only support 2GHz, else band information should be retrieved
 	// from ieee80211_tx_info
-	return wdev->hw->wiphy->bands[NL80211_BAND_2GHZ]->bitrates[rate->idx].hw_=
value;
+	band =3D wdev->hw->wiphy->bands[NL80211_BAND_2GHZ];
+	return band->bitrates[rate->idx].hw_value;
 }
=20
 /* TX policy cache implementation */
@@ -159,14 +162,16 @@ static int wfx_tx_policy_upload(struct wfx_vif *wvif)
 {
 	struct tx_policy *policies =3D wvif->tx_policy_cache.cache;
 	u8 tmp_rates[12];
-	int i;
+	int i, is_used;
=20
 	do {
 		spin_lock_bh(&wvif->tx_policy_cache.lock);
-		for (i =3D 0; i < HIF_TX_RETRY_POLICY_MAX; ++i)
-			if (!policies[i].uploaded &&
-			    memzcmp(policies[i].rates, sizeof(policies[i].rates)))
+		for (i =3D 0; i < HIF_TX_RETRY_POLICY_MAX; ++i) {
+			is_used =3D memzcmp(policies[i].rates,
+					  sizeof(policies[i].rates));
+			if (!policies[i].uploaded && is_used)
 				break;
+		}
 		if (i < HIF_TX_RETRY_POLICY_MAX) {
 			policies[i].uploaded =3D true;
 			memcpy(tmp_rates, policies[i].rates, sizeof(tmp_rates));
@@ -290,7 +295,8 @@ static void wfx_tx_fixup_rates(struct ieee80211_tx_rate=
 *rates)
 		if (rates[i].idx =3D=3D -1) {
 			rates[i].idx =3D 0;
 			rates[i].count =3D 8; // =3D=3D hw->max_rate_tries
-			rates[i].flags =3D rates[i - 1].flags & IEEE80211_TX_RC_MCS;
+			rates[i].flags =3D rates[i - 1].flags &
+					 IEEE80211_TX_RC_MCS;
 			break;
 		}
 	}
@@ -318,7 +324,8 @@ static u8 wfx_tx_get_rate_id(struct wfx_vif *wvif,
 	return rate_id;
 }
=20
-static struct hif_ht_tx_parameters wfx_tx_get_tx_parms(struct wfx_dev *wde=
v, struct ieee80211_tx_info *tx_info)
+static struct hif_ht_tx_parameters wfx_tx_get_tx_parms(struct wfx_dev *wde=
v,
+						       struct ieee80211_tx_info *tx_info)
 {
 	struct ieee80211_tx_rate *rate =3D &tx_info->driver_rates[0];
 	struct hif_ht_tx_parameters ret =3D { };
@@ -381,7 +388,8 @@ static int wfx_tx_inner(struct wfx_vif *wvif, struct ie=
ee80211_sta *sta,
 	hif_msg->id =3D HIF_REQ_ID_TX;
 	hif_msg->interface =3D wvif->id;
 	if (skb->len > wvif->wdev->hw_caps.size_inp_ch_buf) {
-		dev_warn(wvif->wdev->dev, "requested frame size (%d) is larger than maxi=
mum supported (%d)\n",
+		dev_warn(wvif->wdev->dev,
+			 "requested frame size (%d) is larger than maximum supported (%d)\n",
 			 skb->len, wvif->wdev->hw_caps.size_inp_ch_buf);
 		skb_pull(skb, wmsg_len);
 		return -EIO;
@@ -392,9 +400,10 @@ static int wfx_tx_inner(struct wfx_vif *wvif, struct i=
eee80211_sta *sta,
 	// packet_id just need to be unique on device. 32bits are more than
 	// necessary for that task, so we tae advantage of it to add some extra
 	// data for debug.
-	req->packet_id =3D queue_id << 28 |
-			 IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl)) << 16 |
-			 (atomic_add_return(1, &wvif->wdev->packet_id) & 0xFFFF);
+	req->packet_id =3D atomic_add_return(1, &wvif->wdev->packet_id) & 0xFFFF;
+	req->packet_id |=3D IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl)) << 16;
+	req->packet_id |=3D queue_id << 28;
+
 	req->data_flags.fc_offset =3D offset;
 	if (tx_info->flags & IEEE80211_TX_CTL_SEND_AFTER_DTIM)
 		req->data_flags.after_dtim =3D 1;
@@ -517,7 +526,8 @@ void wfx_tx_confirm_cb(struct wfx_vif *wvif, const stru=
ct hif_cnf_tx *arg)
 		if (tx_count < rate->count &&
 		    arg->status =3D=3D HIF_STATUS_RETRY_EXCEEDED &&
 		    arg->ack_failures)
-			dev_dbg(wvif->wdev->dev, "all retries were not consumed: %d !=3D %d\n",
+			dev_dbg(wvif->wdev->dev,
+				"all retries were not consumed: %d !=3D %d\n",
 				rate->count, tx_count);
 		if (tx_count <=3D rate->count && tx_count &&
 		    arg->txed_rate !=3D wfx_get_hw_rate(wvif->wdev, rate))
@@ -554,7 +564,8 @@ void wfx_tx_confirm_cb(struct wfx_vif *wvif, const stru=
ct hif_cnf_tx *arg)
 		else
 			tx_info->flags |=3D IEEE80211_TX_STAT_ACK;
 	} else if (arg->status =3D=3D HIF_REQUEUE) {
-		WARN(!arg->tx_result_flags.requeue, "incoherent status and result_flags"=
);
+		WARN(!arg->tx_result_flags.requeue,
+		     "incoherent status and result_flags");
 		if (tx_info->flags & IEEE80211_TX_CTL_SEND_AFTER_DTIM) {
 			wvif->after_dtim_tx_allowed =3D false; // DTIM period elapsed
 			schedule_work(&wvif->update_tim_work);
@@ -588,7 +599,8 @@ void wfx_flush(struct ieee80211_hw *hw, struct ieee8021=
1_vif *vif,
 		if (wait_event_timeout(wdev->tx_dequeue,
 				       wfx_tx_queue_empty(wdev, queue, vif_id),
 				       msecs_to_jiffies(1000)) <=3D 0)
-			dev_warn(wdev->dev, "frames queued while flushing tx queues?");
+			dev_warn(wdev->dev,
+				 "frames queued while flushing tx queues?");
 	}
 	wfx_tx_flush(wdev);
 	if (wdev->chip_frozen)
--=20
2.17.1


--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl6i7jIACgkQ+gRsbIfe
746OyhAAj8dRMqUGnuvUI7iudTUDf1u/BEYvb1Y+9zUEiJNtNsulRslqAWQNugMy
QjUe1z7VcdTiPgn7ppp8i5gNE2ef19kNCfECbOTlEzdY93+agN5R/YgbdKaGow9c
vN1rhiWXbkDc4ZjmnOXqEiuExOgcW8PKSR+/CX72TGYsdmvjdLA5naQDOXCWJ1ED
h+HNr4/qPLtNLW2mcx5Dh/I7zarf2QEJDsg/PssjmYYRQhm1H7L5Hm3ZaEHyrExM
+TLKW3+RHZBp4xK7ZiBwJ11zBOyEXw1G4Z0pzLPVsG5wuAACQA0ofcDk9ZGVYIhH
HVRRdjK9HypcIaT7S8Cj2hilsgl61HlCD1BuBrz8DEiA6CegXdbAMxsnW56HA6wt
xCpqEruZhBgiwOi15hNbMYr9sqS4V5H2jJ9AihsQSbPILIvfLDwzInJoNu9UF4m0
mq4mKzBDU/Y20PtcMH3ZlPLZPH3YYbi8h61QjYHDFRVBOBlaesEw4zOHr/y3q+2S
DPMge+FlK8M28vUA1U3NEa7QJwq66F19TkCt7uHLc2Slg8rgRmfotsTOSXKqo6GL
t+kwtTHD2UYCFsV4DegCn5504t6MkJIuQ/roCuBOhQAaDyDqTmnkjYbVQsFpfR27
EbJZT5lq8PzONtTiavdshqHA5aIpOV+UCIhVK7tdajnXMUE1mz8=
=Hhh5
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
