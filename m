From: Yang Pingchao <pingchao.yang@intel.com>
Date: Wed, 16 Dec 2015 02:39:40 +0000
Subject: [PATCH] crypto: qat - fix CTX_ENABLES bits shift direction issue
Message-Id: <1450233580-58266-1-git-send-email-pingchao.yang@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au
Cc: dan.carpenter@oracle.com, tadeusz.struk@intel.com, linux-crypto@vger.kernel.org, qat-linux@intel.com, kernel-janitors@vger.kernel.org, Yang Pingchao <pingchao.yang@intel.com>

AE CTX bits should be 8-15 in CTX_ENABLES, so the mask
value 0xff should be left shifted 0x8.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Yang Pingchao <pingchao.yang@intel.com>
---
 drivers/crypto/qat/qat_common/qat_hal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qat/qat_common/qat_hal.c b/drivers/crypto/qat/qat_common/qat_hal.c
index 45c1739..81bd1fe 100644
--- a/drivers/crypto/qat/qat_common/qat_hal.c
+++ b/drivers/crypto/qat/qat_common/qat_hal.c
@@ -418,7 +418,7 @@ int qat_hal_check_ae_active(struct icp_qat_fw_loader_handle *handle,
 
 	qat_hal_rd_ae_csr(handle, ae, CTX_ENABLES, &enable);
 	qat_hal_rd_ae_csr(handle, ae, ACTIVE_CTX_STATUS, &active);
-	if ((enable & (0xff >> CE_ENABLE_BITPOS)) ||
+	if ((enable & (0xff << CE_ENABLE_BITPOS)) ||
 	    (active & (1 << ACS_ABO_BITPOS)))
 		return 1;
 	else
-- 
2.6.4

