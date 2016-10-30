From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 30 Oct 2016 21:34:51 +0000
Subject: [PATCH] cxl: Fix error handling
Message-Id: <20161030213451.24624-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: imunsie@au1.ibm.com, fbarrat@linux.vnet.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'cxl_dev_context_init()' returns an error pointer in case of error, not
NULL. So test it with IS_ERR.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
un-compiled because I don't have the required  cross build environment.
---
 drivers/misc/cxl/api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
index 2b88ad8a2a89..e2efc6489c6e 100644
--- a/drivers/misc/cxl/api.c
+++ b/drivers/misc/cxl/api.c
@@ -538,7 +538,7 @@ int _cxl_cx4_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 
 		if (remaining > 0) {
 			new_ctx = cxl_dev_context_init(pdev);
-			if (!new_ctx) {
+			if (IS_ERR(new_ctx)) {
 				pr_warn("%s: Failed to allocate enough contexts for MSIs\n", pci_name(pdev));
 				return -ENOSPC;
 			}
-- 
2.9.3

