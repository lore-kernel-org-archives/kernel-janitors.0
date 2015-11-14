From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Nov 2015 10:06:59 +0000
Subject: [PATCH 7/9] crypto: constify pci_error_handlers structures
Message-Id: <1447495621-9161-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447495621-9161-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447495621-9161-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tadeusz Struk <tadeusz.struk@intel.com>
Cc: kernel-janitors@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

This pci_error_handlers structure is never modified, like all the other
pci_error_handlers structures, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
There are no dependencies between these patches.

 drivers/crypto/qat/qat_common/adf_aer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qat/qat_common/adf_aer.c b/drivers/crypto/qat/qat_common/adf_aer.c
index 0a5ca0b..d24cfd4 100644
--- a/drivers/crypto/qat/qat_common/adf_aer.c
+++ b/drivers/crypto/qat/qat_common/adf_aer.c
@@ -197,7 +197,7 @@ static void adf_resume(struct pci_dev *pdev)
 	dev_info(&pdev->dev, "Device is up and runnig\n");
 }
 
-static struct pci_error_handlers adf_err_handler = {
+static const struct pci_error_handlers adf_err_handler = {
 	.error_detected = adf_error_detected,
 	.slot_reset = adf_slot_reset,
 	.resume = adf_resume,

