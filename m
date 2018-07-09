From: Colin King <colin.king@canonical.com>
Date: Mon, 09 Jul 2018 12:34:46 +0000
Subject: [PATCH] ath10k: remove redundant pointers 'dev' and 'noa'
Message-Id: <20180709123446.14796-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointers dev and noa are being assigned but are never used hence they
are redundant and can be removed.

Cleans up clang warnings:
warning: variable 'dev' set but not used [-Wunused-but-set-variable]
warning: variable 'noa' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/ahb.c     | 5 -----
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index fa39ffffd34d..c9bd0e2b5db7 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -133,11 +133,8 @@ static void ath10k_ahb_clock_deinit(struct ath10k *ar)
 static int ath10k_ahb_clock_enable(struct ath10k *ar)
 {
 	struct ath10k_ahb *ar_ahb = ath10k_ahb_priv(ar);
-	struct device *dev;
 	int ret;
 
-	dev = &ar_ahb->pdev->dev;
-
 	if (IS_ERR_OR_NULL(ar_ahb->cmd_clk) ||
 	    IS_ERR_OR_NULL(ar_ahb->ref_clk) ||
 	    IS_ERR_OR_NULL(ar_ahb->rtc_clk)) {
@@ -451,12 +448,10 @@ static int ath10k_ahb_resource_init(struct ath10k *ar)
 {
 	struct ath10k_ahb *ar_ahb = ath10k_ahb_priv(ar);
 	struct platform_device *pdev;
-	struct device *dev;
 	struct resource *res;
 	int ret;
 
 	pdev = ar_ahb->pdev;
-	dev = &pdev->dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 8c49a26fc571..fc0f98487d11 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1785,7 +1785,6 @@ ath10k_wmi_tlv_op_gen_vdev_start(struct ath10k *ar,
 {
 	struct wmi_tlv_vdev_start_cmd *cmd;
 	struct wmi_channel *ch;
-	struct wmi_p2p_noa_descriptor *noa;
 	struct wmi_tlv *tlv;
 	struct sk_buff *skb;
 	size_t len;
@@ -1843,7 +1842,6 @@ ath10k_wmi_tlv_op_gen_vdev_start(struct ath10k *ar,
 	tlv = ptr;
 	tlv->tag = __cpu_to_le16(WMI_TLV_TAG_ARRAY_STRUCT);
 	tlv->len = 0;
-	noa = (void *)tlv->value;
 
 	/* Note: This is a nested TLV containing:
 	 * [wmi_tlv][wmi_p2p_noa_descriptor][wmi_tlv]..
-- 
2.17.1

