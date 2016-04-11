From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Apr 2016 08:15:20 +0000
Subject: [patch v2] ath10k: add some sanity checks
Message-Id: <20160411081520.GA17911@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <CA+BoTQmpYtGoYk4M-NaFduO8iX0KYgoLz6Mj_40i0um8MqDdww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Smatch complains that since "ev->peer_id" comes from skb->data that
means we can't trust it and have to do a bounds check on it to prevent
an array overflow.

Fixes: 6942726f7f7b ('ath10k: add fast peer_map lookup')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Add a warning message.  There is a checkpatch.pl warning that
the alignment should match the open parenthesis but I ignored it because
we're going off the end of the 80 character limit and this way is fine.

diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 9369411..0885fce 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -190,6 +190,13 @@ void ath10k_peer_map_event(struct ath10k_htt *htt,
 	struct ath10k *ar = htt->ar;
 	struct ath10k_peer *peer;
 
+	if (ev->peer_id >= ATH10K_MAX_NUM_PEER_IDS) {
+		ath10k_warn(ar,
+			"received htt peer map event with idx out of bounds: %hu\n",
+			ev->peer_id);
+		return;
+	}
+
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find(ar, ev->vdev_id, ev->addr);
 	if (!peer) {
@@ -218,6 +225,13 @@ void ath10k_peer_unmap_event(struct ath10k_htt *htt,
 	struct ath10k *ar = htt->ar;
 	struct ath10k_peer *peer;
 
+	if (ev->peer_id >= ATH10K_MAX_NUM_PEER_IDS) {
+		ath10k_warn(ar,
+			"received htt peer unmap event with idx out of bounds: %hu\n",
+			ev->peer_id);
+		return;
+	}
+
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find_by_id(ar, ev->peer_id);
 	if (!peer) {
