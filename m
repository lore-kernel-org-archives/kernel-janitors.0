From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Aug 2020 10:57:12 +0000
Subject: [PATCH][next] ath11k: fix error check on return from call to ath11k_core_firmware_request
Message-Id: <20200819105712.51886-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to ath11k_core_firmware_request is returning a pointer that
can be set to an error code, however, this is not being checked.
Instead ret is being incorrecly checked for the error return. Fix the
error checking.

Addresses-Coverity: ("Logically dead code")
Fixes: 7b57b2ddec21 ("ath11k: create a common function to request all firmware files")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 91134510364c..4792857678b9 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1886,7 +1886,7 @@ ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 		break;
 	case ATH11K_QMI_FILE_TYPE_CALDATA:
 		fw_entry = ath11k_core_firmware_request(ab, ATH11K_DEFAULT_CAL_FILE);
-		if (ret) {
+		if (PTR_ERR(fw_entry)) {
 			ath11k_warn(ab, "failed to load %s: %d\n",
 				    ATH11K_DEFAULT_CAL_FILE, ret);
 			goto out;
-- 
2.27.0
