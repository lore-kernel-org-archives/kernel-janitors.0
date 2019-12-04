From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 04 Dec 2019 05:52:35 +0000
Subject: [PATCH] ath10k: Fix some typo in some warning messages
Message-Id: <20191204055235.11989-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvalo@codeaurora.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, davem@davemloft.net
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

Fix some typo:
  s/to to/to/
  s/even/event/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ath/ath10k/mac.c      | 2 +-
 drivers/net/wireless/ath/ath10k/testmode.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e8bdb2ba9b18..5faa43cd7fef 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1098,7 +1098,7 @@ static int ath10k_monitor_vdev_stop(struct ath10k *ar)
 
 	ret = ath10k_wmi_vdev_stop(ar, ar->monitor_vdev_id);
 	if (ret)
-		ath10k_warn(ar, "failed to to request monitor vdev %i stop: %d\n",
+		ath10k_warn(ar, "failed to request monitor vdev %i stop: %d\n",
 			    ar->monitor_vdev_id, ret);
 
 	ret = ath10k_vdev_setup_sync(ar);
diff --git a/drivers/net/wireless/ath/ath10k/testmode.c b/drivers/net/wireless/ath/ath10k/testmode.c
index 1bffe3fbea3f..7a9b9bbcdbfc 100644
--- a/drivers/net/wireless/ath/ath10k/testmode.c
+++ b/drivers/net/wireless/ath/ath10k/testmode.c
@@ -65,7 +65,7 @@ bool ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
 	ret = nla_put_u32(nl_skb, ATH10K_TM_ATTR_CMD, ATH10K_TM_CMD_WMI);
 	if (ret) {
 		ath10k_warn(ar,
-			    "failed to to put testmode wmi event cmd attribute: %d\n",
+			    "failed to put testmode wmi event cmd attribute: %d\n",
 			    ret);
 		kfree_skb(nl_skb);
 		goto out;
@@ -74,7 +74,7 @@ bool ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
 	ret = nla_put_u32(nl_skb, ATH10K_TM_ATTR_WMI_CMDID, cmd_id);
 	if (ret) {
 		ath10k_warn(ar,
-			    "failed to to put testmode wmi even cmd_id: %d\n",
+			    "failed to put testmode wmi event cmd_id: %d\n",
 			    ret);
 		kfree_skb(nl_skb);
 		goto out;
-- 
2.20.1
