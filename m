From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Nov 2015 10:06:54 +0000
Subject: [PATCH 2/9] GenWQE: constify pci_error_handlers structures
Message-Id: <1447495621-9161-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447495621-9161-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447495621-9161-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

This pci_error_handlers structure is never modified, like all the other
pci_error_handlers structures, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
There are no dependencies between these patches.

 drivers/misc/genwqe/card_base.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/genwqe/card_base.c b/drivers/misc/genwqe/card_base.c
index 4cf8f82..40cefef 100644
--- a/drivers/misc/genwqe/card_base.c
+++ b/drivers/misc/genwqe/card_base.c
@@ -1337,7 +1337,7 @@ static int genwqe_sriov_configure(struct pci_dev *dev, int numvfs)
 	return 0;
 }
 
-static struct pci_error_handlers genwqe_err_handler = {
+static const struct pci_error_handlers genwqe_err_handler = {
 	.error_detected = genwqe_err_error_detected,
 	.mmio_enabled	= genwqe_err_result_none,
 	.link_reset	= genwqe_err_result_none,

