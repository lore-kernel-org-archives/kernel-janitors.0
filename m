From: Colin King <colin.king@canonical.com>
Date: Thu, 08 Oct 2020 17:11:51 +0000
Subject: [PATCH] xhci: Fix sizeof() mismatch
Message-Id: <20201008171151.198996-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An incorrect sizeof() is being used, sizeof(rhub->ports) is not
correct, it should be sizeof(*rhub->ports).  This bug did not
cause any issues because it just so happens the sizes are the same.

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: bcaa9d5c5900 ("xhci: Create new structures to store xhci port information")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/xhci-mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index fe405cd38dbc..138ba4528dd3 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2252,8 +2252,8 @@ static void xhci_create_rhub_port_array(struct xhci_hcd *xhci,
 
 	if (!rhub->num_ports)
 		return;
-	rhub->ports = kcalloc_node(rhub->num_ports, sizeof(rhub->ports), flags,
-			dev_to_node(dev));
+	rhub->ports = kcalloc_node(rhub->num_ports, sizeof(*rhub->ports),
+			flags, dev_to_node(dev));
 	for (i = 0; i < HCS_MAX_PORTS(xhci->hcs_params1); i++) {
 		if (xhci->hw_ports[i].rhub != rhub ||
 		    xhci->hw_ports[i].hcd_portnum = DUPLICATE_ENTRY)
-- 
2.27.0
