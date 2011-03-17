From: Dan Carpenter <error27@gmail.com>
Date: Thu, 17 Mar 2011 19:39:49 +0000
Subject: [patch] USB: xhci: unsigned char never equals -1
Message-Id: <20110317193949.GN2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There were some places that compared port_speed = -1 where port_speed
is a u8.  This doesn't work unless we cast the -1 to u8.  Some places
did it correctly.

Instead of using -1 directly, I've created a DUPLICATE_ENTRY define
which does the cast and is more descriptive as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I'm not super familiar with this code...  Compile tested only.

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index a003e79..ab7fc2b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -846,7 +846,7 @@ static u32 xhci_find_real_port_number(struct xhci_hcd *xhci,
 		 * Skip ports that don't have known speeds, or have duplicate
 		 * Extended Capabilities port speed entries.
 		 */
-		if (port_speed = 0 || port_speed = -1)
+		if (port_speed = 0 || port_speed = DUPLICATE_ENTRY)
 			continue;
 
 		/*
@@ -1727,12 +1727,12 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 			 * found a similar duplicate.
 			 */
 			if (xhci->port_array[i] != major_revision &&
-				xhci->port_array[i] != (u8) -1) {
+				xhci->port_array[i] != DUPLICATE_ENTRY) {
 				if (xhci->port_array[i] = 0x03)
 					xhci->num_usb3_ports--;
 				else
 					xhci->num_usb2_ports--;
-				xhci->port_array[i] = (u8) -1;
+				xhci->port_array[i] = DUPLICATE_ENTRY;
 			}
 			/* FIXME: Should we disable the port? */
 			continue;
@@ -1831,7 +1831,7 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		for (i = 0; i < num_ports; i++) {
 			if (xhci->port_array[i] = 0x03 ||
 					xhci->port_array[i] = 0 ||
-					xhci->port_array[i] = -1)
+					xhci->port_array[i] = DUPLICATE_ENTRY)
 				continue;
 
 			xhci->usb2_ports[port_index] diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index cfc1ad9..c6d1462 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1209,7 +1209,7 @@ static unsigned int find_faked_portnum_from_hw_portnum(struct usb_hcd *hcd,
 		 * Skip ports that don't have known speeds, or have duplicate
 		 * Extended Capabilities port speed entries.
 		 */
-		if (port_speed = 0 || port_speed = -1)
+		if (port_speed = 0 || port_speed = DUPLICATE_ENTRY)
 			continue;
 
 		/*
@@ -1260,7 +1260,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 				port_id);
 		goto cleanup;
 	}
-	if (major_revision = (u8) -1) {
+	if (major_revision = DUPLICATE_ENTRY) {
 		xhci_warn(xhci, "Event for port %u duplicated in"
 				"Extended Capabilities, ignoring.\n",
 				port_id);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 711de25..45bd5a2 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -348,6 +348,9 @@ struct xhci_op_regs {
 /* Initiate a warm port reset - complete when PORT_WRC is '1' */
 #define PORT_WR		(1 << 31)
 
+/* We mark duplicate entries with -1 */
+#define DUPLICATE_ENTRY ((u8)(-1))
+
 /* Port Power Management Status and Control - port_power_base bitmasks */
 /* Inactivity timer value for transitions into U1, in microseconds.
  * Timeout can be up to 127us.  0xFF means an infinite timeout.
