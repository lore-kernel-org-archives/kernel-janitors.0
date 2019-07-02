From: Colin King <colin.king@canonical.com>
Date: Tue, 02 Jul 2019 12:39:04 +0000
Subject: [PATCH][next] ath: fix various spelling mistakes
Message-Id: <20190702123904.8786-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Maya Erez <merez@codeaurora.org>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, wil6210@qti.qualcomm.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a bunch of spelling mistakes in two ath drivers, fix
these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 2 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 2 +-
 drivers/net/wireless/ath/ath10k/qmi.c  | 4 ++--
 drivers/net/wireless/ath/wil6210/wmi.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index dc45d16e8d21..a7c25d49683b 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2784,7 +2784,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 
 	status = ath10k_hif_set_target_log_mode(ar, fw_diag_log);
 	if (status && status != -EOPNOTSUPP) {
-		ath10k_warn(ar, "set traget log mode faileds: %d\n", status);
+		ath10k_warn(ar, "set target log mode failed: %d\n", status);
 		goto err_hif_stop;
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e43a566eef77..20f72ec95b28 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7417,7 +7417,7 @@ static bool ath10k_mac_set_vht_bitrate_mask_fixup(struct ath10k *ar,
 	err = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
 					WMI_PEER_PARAM_FIXED_RATE, rate);
 	if (err)
-		ath10k_warn(ar, "failed to eanble STA %pM peer fixed rate: %d\n",
+		ath10k_warn(ar, "failed to enable STA %pM peer fixed rate: %d\n",
 			    sta->addr, err);
 
 	return true;
diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 3b63b6257c43..d28daa2d9449 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -643,7 +643,7 @@ int ath10k_qmi_set_fw_log_mode(struct ath10k *ar, u8 fw_log_mode)
 			       wlfw_ini_req_msg_v01_ei, &req);
 	if (ret < 0) {
 		qmi_txn_cancel(&txn);
-		ath10k_err(ar, "fail to send fw log reqest: %d\n", ret);
+		ath10k_err(ar, "failed to send fw log request: %d\n", ret);
 		goto out;
 	}
 
@@ -652,7 +652,7 @@ int ath10k_qmi_set_fw_log_mode(struct ath10k *ar, u8 fw_log_mode)
 		goto out;
 
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
-		ath10k_err(ar, "fw log request rejectedr: %d\n",
+		ath10k_err(ar, "fw log request rejected: %d\n",
 			   resp.resp.error);
 		ret = -EINVAL;
 		goto out;
diff --git a/drivers/net/wireless/ath/wil6210/wmi.c b/drivers/net/wireless/ath/wil6210/wmi.c
index 475b1a233cc9..e1704cdfc03e 100644
--- a/drivers/net/wireless/ath/wil6210/wmi.c
+++ b/drivers/net/wireless/ath/wil6210/wmi.c
@@ -2688,7 +2688,7 @@ int wmi_get_all_temperatures(struct wil6210_priv *wil,
 		return rc;
 
 	if (reply.evt.status = WMI_FW_STATUS_FAILURE) {
-		wil_err(wil, "Failed geting TEMP_SENSE_ALL\n");
+		wil_err(wil, "Failed getting TEMP_SENSE_ALL\n");
 		return -EINVAL;
 	}
 
-- 
2.20.1
