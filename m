From: Colin King <colin.king@canonical.com>
Date: Mon, 19 Nov 2018 16:34:00 +0000
Subject: [PATCH] drivers: usb: early: clean up indentation, remove extraneous tabs
Message-Id: <20181119163400.16991-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a hunk of code that is indented too much by one level, fix
this by removing the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/early/ehci-dbgp.c | 38 +++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/early/ehci-dbgp.c b/drivers/usb/early/ehci-dbgp.c
index d633c2abe5a4..ea0d531c63e2 100644
--- a/drivers/usb/early/ehci-dbgp.c
+++ b/drivers/usb/early/ehci-dbgp.c
@@ -631,28 +631,28 @@ static int ehci_reset_port(int port)
 		if (!(portsc & PORT_RESET))
 			break;
 	}
-		if (portsc & PORT_RESET) {
-			/* force reset to complete */
-			loop = 100 * 1000;
-			writel(portsc & ~(PORT_RWC_BITS | PORT_RESET),
-				&ehci_regs->port_status[port - 1]);
-			do {
-				udelay(1);
-				portsc = readl(&ehci_regs->port_status[port-1]);
-			} while ((portsc & PORT_RESET) && (--loop > 0));
-		}
+	if (portsc & PORT_RESET) {
+		/* force reset to complete */
+		loop = 100 * 1000;
+		writel(portsc & ~(PORT_RWC_BITS | PORT_RESET),
+			&ehci_regs->port_status[port - 1]);
+		do {
+			udelay(1);
+			portsc = readl(&ehci_regs->port_status[port-1]);
+		} while ((portsc & PORT_RESET) && (--loop > 0));
+	}
 
-		/* Device went away? */
-		if (!(portsc & PORT_CONNECT))
-			return -ENOTCONN;
+	/* Device went away? */
+	if (!(portsc & PORT_CONNECT))
+		return -ENOTCONN;
 
-		/* bomb out completely if something weird happened */
-		if ((portsc & PORT_CSC))
-			return -EINVAL;
+	/* bomb out completely if something weird happened */
+	if ((portsc & PORT_CSC))
+		return -EINVAL;
 
-		/* If we've finished resetting, then break out of the loop */
-		if (!(portsc & PORT_RESET) && (portsc & PORT_PE))
-			return 0;
+	/* If we've finished resetting, then break out of the loop */
+	if (!(portsc & PORT_RESET) && (portsc & PORT_PE))
+		return 0;
 	return -EBUSY;
 }
 
-- 
2.19.1
