From: Yang Pingchao <pingchao.yang@intel.com>
Date: Wed, 16 Dec 2015 06:09:50 +0000
Subject: [PATCH] crypto: qat - fix some timeout tests
Message-Id: <1450246190-60770-1-git-send-email-pingchao.yang@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, dan.carpenter@oracle.com
Cc: tadeusz.struk@intel.com, linux-crypto@vger.kernel.org, qat-linux@intel.com, kernel-janitors@vger.kernel.org, Yang Pingchao <pingchao.yang@intel.com>

Change the timeout condition since the times value would be -1 after
running MAX_RETRY_TIMES.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Yang Pingchao <pingchao.yang@intel.com>
---
 drivers/crypto/qat/qat_common/qat_hal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qat/qat_common/qat_hal.c b/drivers/crypto/qat/qat_common/qat_hal.c
index 81bd1fe..0ac0ba8 100644
--- a/drivers/crypto/qat/qat_common/qat_hal.c
+++ b/drivers/crypto/qat/qat_common/qat_hal.c
@@ -186,7 +186,7 @@ static int qat_hal_wait_cycles(struct icp_qat_fw_loader_handle *handle,
 		if (elapsed_cycles >= 8 && !(csr & (1 << ACS_ABO_BITPOS)))
 			return 0;
 	}
-	if (!times) {
+	if (times < 0) {
 		pr_err("QAT: wait_num_cycles time out\n");
 		return -EFAULT;
 	}
-- 
2.6.4

