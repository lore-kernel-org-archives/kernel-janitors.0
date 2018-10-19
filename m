From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 19 Oct 2018 12:20:26 +0000
Subject: [PATCH] ath10k: remove set but not used variable 'tlv_len'
Message-Id: <1539951626-185764-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, ath10k@lists.infradead.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/ath/ath10k/wmi-tlv.c: In function 'ath10k_wmi_tlv_op_gen_config_pno_start':
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3455:6: warning:
 variable 'tlv_len' set but not used [-Wunused-but-set-variable]

It never used since inroduction in commit
ce834e280f2f ("ath10k: support NET_DETECT WoWLAN feature")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index bab8b25..bcd80e1 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -3452,7 +3452,6 @@ static u32 ath10k_wmi_tlv_prepare_peer_qos(u8 uapsd_queues, u8 sp)
 	struct wmi_tlv *tlv;
 	struct sk_buff *skb;
 	__le32 *channel_list;
-	u16 tlv_len;
 	size_t len;
 	void *ptr;
 	u32 i;
@@ -3510,8 +3509,6 @@ static u32 ath10k_wmi_tlv_prepare_peer_qos(u8 uapsd_queues, u8 sp)
 	/* nlo_configured_parameters(nlo_list) */
 	cmd->no_of_ssids = __cpu_to_le32(min_t(u8, pno->uc_networks_count,
 					       WMI_NLO_MAX_SSIDS));
-	tlv_len = __le32_to_cpu(cmd->no_of_ssids) *
-		sizeof(struct nlo_configured_parameters);
 
 	tlv = ptr;
 	tlv->tag = __cpu_to_le16(WMI_TLV_TAG_ARRAY_STRUCT);
