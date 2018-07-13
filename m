From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 09:48:07 +0000
Subject: [PATCH] usb: xhci: dbc: remove redundant pointer dbc
Message-Id: <20180713094807.20670-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer dbc is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
variable 'dbc' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/xhci-dbgcap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 387f124a8334..86cff5c28eff 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -913,11 +913,9 @@ static ssize_t dbc_store(struct device *dev,
 			 struct device_attribute *attr,
 			 const char *buf, size_t count)
 {
-	struct xhci_dbc		*dbc;
 	struct xhci_hcd		*xhci;
 
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
-	dbc = xhci->dbc;
 
 	if (!strncmp(buf, "enable", 6))
 		xhci_dbc_start(xhci);
-- 
2.17.1

