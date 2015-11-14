From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Nov 2015 10:06:57 +0000
Subject: [PATCH 5/9] sfc: constify pci_error_handlers structures
Message-Id: <1447495621-9161-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447495621-9161-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447495621-9161-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>
Cc: kernel-janitors@vger.kernel.org, Shradha Shah <sshah@solarflare.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

This pci_error_handlers structure is never modified, like all the other
pci_error_handlers structures, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
There are no dependencies between these patches.

 drivers/net/ethernet/sfc/efx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/efx.c b/drivers/net/ethernet/sfc/efx.c
index d288f1c..a3c42a3 100644
--- a/drivers/net/ethernet/sfc/efx.c
+++ b/drivers/net/ethernet/sfc/efx.c
@@ -3422,7 +3422,7 @@ out:
  * with our request for slot reset the mmio_enabled callback will never be
  * called, and the link_reset callback is not used by AER or EEH mechanisms.
  */
-static struct pci_error_handlers efx_err_handlers = {
+static const struct pci_error_handlers efx_err_handlers = {
 	.error_detected = efx_io_error_detected,
 	.slot_reset	= efx_io_slot_reset,
 	.resume		= efx_io_resume,

