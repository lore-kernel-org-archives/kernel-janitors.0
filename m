From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Aug 2020 11:34:17 +0000
Subject: [PATCH net-next] ath11k: return -ENOMEM on allocation failure
Message-Id: <20200826113417.GE393664@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jakub Kicinski <kuba@kernel.org>, kernel-janitors@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Returning PTR_ERR(NULL) means success, but we should return -ENOMEM.

Fixes: 1399fb87ea3e ("ath11k: register MHI controller device for QCA6390")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index d7e60dc5b300..aded9a719d51 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -220,7 +220,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 
 	mhi_ctrl = kzalloc(sizeof(*mhi_ctrl), GFP_KERNEL);
 	if (!mhi_ctrl)
-		return PTR_ERR(mhi_ctrl);
+		return -ENOMEM;
 
 	ath11k_core_create_firmware_path(ab, ATH11K_AMSS_FILE,
 					 ab_pci->amss_path,
-- 
2.28.0
