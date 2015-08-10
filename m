From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Aug 2015 21:45:03 +0000
Subject: [patch] iwlwifi: mvm: fix a range check in debugfs code
Message-Id: <20150810214503.GC31724@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The &mvm->tof_data.range_req.ap[] array has IWL_MVM_TOF_MAX_APS elements
so the check should be >= instead of >.  Also the test can underflow so
I have changed "i" to unsigned.

Fixes: ce7929186a39 ('wlwifi: mvm: add basic Time of Flight (802.11mc FTM) support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/iwlwifi/mvm/debugfs-vif.c b/drivers/net/wireless/iwlwifi/mvm/debugfs-vif.c
index ddb1c84..383a316 100644
--- a/drivers/net/wireless/iwlwifi/mvm/debugfs-vif.c
+++ b/drivers/net/wireless/iwlwifi/mvm/debugfs-vif.c
@@ -911,9 +911,9 @@ static ssize_t iwl_dbgfs_tof_range_request_write(struct ieee80211_vif *vif,
 		int size = sizeof(struct iwl_tof_range_req_ap_entry);
 		u16 burst_period;
 		u8 *mac = ap.bssid;
-		int i;
+		unsigned int i;
 
-		if (sscanf(data, "%d %hhd %hhx %hhx"
+		if (sscanf(data, "%u %hhd %hhx %hhx"
 			   "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx"
 			   "%hhx %hhx %hx"
 			   "%hhx %hhx %x"
@@ -929,7 +929,7 @@ static ssize_t iwl_dbgfs_tof_range_request_write(struct ieee80211_vif *vif,
 			ret = -EINVAL;
 			goto out;
 		}
-		if (i > IWL_MVM_TOF_MAX_APS) {
+		if (i >= IWL_MVM_TOF_MAX_APS) {
 			IWL_ERR(mvm, "Invalid AP index %d\n", i);
 			ret = -EINVAL;
 			goto out;
