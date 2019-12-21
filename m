From: Colin King <colin.king@canonical.com>
Date: Sat, 21 Dec 2019 00:15:43 +0000
Subject: [PATCH][next] staging: wfx: check for memory allocation failures from wfx_alloc_hif
Message-Id: <20191221001543.15255-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently calls to wfx_alloc_hif are not checking for a null return
when a memory allocation fails and this leads to null pointer
dereferencing issues.  Fix this by adding null pointer checks and
returning passing down -ENOMEM errors where necessary. The error
checking in the current driver is a bit sparse, so this may need
some extra attention later if required.

Fixes: f95a29d40782 ("staging: wfx: add HIF commands helpers")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wfx/hif_tx.c |  6 ++++++
 drivers/staging/wfx/sta.c    | 13 +++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/wfx/hif_tx.c b/drivers/staging/wfx/hif_tx.c
index 8a34a52dd5b9..d8e159670eae 100644
--- a/drivers/staging/wfx/hif_tx.c
+++ b/drivers/staging/wfx/hif_tx.c
@@ -366,6 +366,9 @@ int hif_set_edca_queue_params(struct wfx_vif *wvif, u16 queue,
 	struct hif_req_edca_queue_params *body = wfx_alloc_hif(sizeof(*body),
 							       &hif);
 
+	if (!body)
+		return -ENOMEM;
+
 	WARN_ON(arg->aifs > 255);
 	body->aifsn = arg->aifs;
 	body->cw_min = cpu_to_le16(arg->cw_min);
@@ -390,6 +393,9 @@ int hif_set_pm(struct wfx_vif *wvif, bool ps, int dynamic_ps_timeout)
 	struct hif_msg *hif;
 	struct hif_req_set_pm_mode *body = wfx_alloc_hif(sizeof(*body), &hif);
 
+	if (!body)
+		return -ENOMEM;
+
 	if (ps) {
 		body->pm_mode.enter_psm = 1;
 		// Firmware does not support more than 128ms
diff --git a/drivers/staging/wfx/sta.c b/drivers/staging/wfx/sta.c
index 9a61478d98f8..c08d691fe870 100644
--- a/drivers/staging/wfx/sta.c
+++ b/drivers/staging/wfx/sta.c
@@ -316,6 +316,7 @@ int wfx_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 {
 	struct wfx_dev *wdev = hw->priv;
 	struct wfx_vif *wvif = (struct wfx_vif *) vif->drv_priv;
+	int ret = 0;
 
 	WARN_ON(queue >= hw->queues);
 
@@ -326,10 +327,10 @@ int wfx_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (wvif->vif->type = NL80211_IFTYPE_STATION) {
 		hif_set_uapsd_info(wvif, wvif->uapsd_mask);
 		if (wvif->setbssparams_done && wvif->state = WFX_STATE_STA)
-			wfx_update_pm(wvif);
+			ret = wfx_update_pm(wvif);
 	}
 	mutex_unlock(&wdev->conf_mutex);
-	return 0;
+	return ret;
 }
 
 int wfx_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
@@ -1322,7 +1323,7 @@ int wfx_config(struct ieee80211_hw *hw, u32 changed)
 	if (changed & IEEE80211_CONF_CHANGE_PS) {
 		wvif = NULL;
 		while ((wvif = wvif_iterate(wdev, wvif)) != NULL)
-			wfx_update_pm(wvif);
+			ret = wfx_update_pm(wvif);
 		wvif = wdev_to_wvif(wdev, 0);
 	}
 
@@ -1333,7 +1334,7 @@ int wfx_config(struct ieee80211_hw *hw, u32 changed)
 
 int wfx_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 {
-	int i;
+	int i, ret = 0;
 	struct wfx_dev *wdev = hw->priv;
 	struct wfx_vif *wvif = (struct wfx_vif *) vif->drv_priv;
 
@@ -1417,9 +1418,9 @@ int wfx_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 		else
 			hif_set_block_ack_policy(wvif, 0x00, 0x00);
 		// Combo force powersave mode. We can re-enable it now
-		wfx_update_pm(wvif);
+		ret = wfx_update_pm(wvif);
 	}
-	return 0;
+	return ret;
 }
 
 void wfx_remove_interface(struct ieee80211_hw *hw,
-- 
2.24.0
