From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Aug 2020 11:14:52 +0000
Subject: [PATCH][next] ath11k: fix missing error check on call to ath11k_pci_get_user_msi_assignment
Message-Id: <20200819111452.52419-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The return error check on the call to ath11k_pci_get_user_msi_assignment is
missing.  If an error does occur, num_vectors is still set to zero and
later on a division by zero can occur when variable vector is being
calculated.  Fix this by adding an error check after the call.

Addresses-Coverity: ("Division or modulo by zero")
Fixes: d4ecb90b3857 ("ath11k: enable DP interrupt setup for QCA6390")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index ca7012d46c3f..058885776a3a 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -648,9 +648,12 @@ static int ath11k_pci_ext_irq_config(struct ath11k_base *ab)
 	int i, j, ret, num_vectors = 0;
 	u32 user_base_data = 0, base_vector = 0;
 
-	ath11k_pci_get_user_msi_assignment(ath11k_pci_priv(ab), "DP",
-					   &num_vectors, &user_base_data,
-					   &base_vector);
+	ret = ath11k_pci_get_user_msi_assignment(ath11k_pci_priv(ab), "DP",
+						 &num_vectors,
+						 &user_base_data,
+						 &base_vector);
+	if (ret < 0)
+		return ret;
 
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
-- 
2.27.0
