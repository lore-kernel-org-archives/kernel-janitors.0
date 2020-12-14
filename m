From: Colin King <colin.king@canonical.com>
Date: Mon, 14 Dec 2020 23:24:17 +0000
Subject: [PATCH][next] ath11k: add missing null check on allocated skb
Message-Id: <20201214232417.84556-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the null check on a newly allocated skb is missing and
this can lead to a null pointer dereference is the allocation fails.
Fix this by adding a null check and returning -ENOMEM.

Addresses-Coverity: ("Dereference null return")
Fixes: 43ed15e1ee01 ("ath11k: put hw to DBS using WMI_PDEV_SET_HW_MODE_CMDID")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index da4b546b62cb..c869ff479212 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3460,6 +3460,8 @@ int ath11k_wmi_set_hw_mode(struct ath11k_base *ab,
 	len = sizeof(*cmd);
 
 	skb = ath11k_wmi_alloc_skb(wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
 	cmd = (struct wmi_pdev_set_hw_mode_cmd_param *)skb->data;
 
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_SET_HW_MODE_CMD) |
-- 
2.29.2
