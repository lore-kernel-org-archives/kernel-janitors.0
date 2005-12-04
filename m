From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:24:46 +0000
Subject: [KJ] [PATCH 21/21] polling loops: change exit condition to
Message-Id: <4392374E.8040500@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

USB HUB DRIVER
P:	Johannes Erdfelt
M:	johannes@erdfelt.com

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/usb/core/hub.c linux-2.6.15-rc4/drivers/usb/core/hub.c
--- linux-2.6.15-rc4-orig/drivers/usb/core/hub.c	2005-12-03 15:22:34.000000000 +0100
+++ linux-2.6.15-rc4/drivers/usb/core/hub.c	2005-12-03 16:53:10.000000000 +0100
@@ -1394,9 +1394,10 @@ static int hub_port_wait_reset(struct us
 	int delay_time, ret;
 	u16 portstatus;
 	u16 portchange;
+	unsigned long end_time = jiffies + msecs_to_jiffies(HUB_RESET_TIMEOUT);
 
 	for (delay_time = 0;
-			delay_time < HUB_RESET_TIMEOUT;
+			time_before(jiffies, end_time);
 			delay_time += delay) {
 		/* wait to give the device a chance to reset */
 		msleep(delay);
@@ -2029,6 +2030,7 @@ static int hub_port_debounce(struct usb_
 	int total_time, stable_time = 0;
 	u16 portchange, portstatus;
 	unsigned connection = 0xffff;
+	unsigned long end_time = jiffies + msecs_to_jiffies(HUB_DEBOUNCE_TIMEOUT);
 
 	for (total_time = 0; ; total_time += HUB_DEBOUNCE_STEP) {
 		ret = hub_port_status(hub, port1, &portstatus, &portchange);
@@ -2050,7 +2052,7 @@ static int hub_port_debounce(struct usb_
 					USB_PORT_FEAT_C_CONNECTION);
 		}
 
-		if (total_time >= HUB_DEBOUNCE_TIMEOUT)
+		if (time_after(jiffies, end_time))
 			break;
 		msleep(HUB_DEBOUNCE_STEP);
 	}
USB EHCI DRIVER
P:	David Brownell
M:	dbrownell@users.sourceforge.net
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/usb/host/ehci-pci.c linux-2.6.15-rc4/drivers/usb/host/ehci-pci.c
--- linux-2.6.15-rc4-orig/drivers/usb/host/ehci-pci.c	2005-12-03 15:22:34.000000000 +0100
+++ linux-2.6.15-rc4/drivers/usb/host/ehci-pci.c	2005-12-03 17:13:18.000000000 +0100
@@ -36,13 +36,12 @@ static int bios_handoff(struct ehci_hcd 
 
 	/* maybe wait a while for BIOS to respond */
 	if (cap & (1 << 16)) {
-		int msec = 5000;
+		unsigned long end_time = jiffies + msecs_to_jiffies(5000);
 
 		do {
 			msleep(10);
-			msec -= 10;
 			pci_read_config_dword(pdev, where, &cap);
-		} while ((cap & (1 << 16)) && msec);
+		} while ((cap & (1 << 16)) && time_before(jiffies, end_time));
 		if (cap & (1 << 16)) {
 			ehci_err(ehci, "BIOS handoff failed (%d, %08x)\n",
 				where, cap);

USB SUBSYSTEM???
P:	Greg Kroah-Hartman
M:	gregkh@suse.de
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/usb/host/isp116x-hcd.c linux-2.6.15-rc4/drivers/usb/host/isp116x-hcd.c
--- linux-2.6.15-rc4-orig/drivers/usb/host/isp116x-hcd.c	2005-12-03 15:22:34.000000000 +0100
+++ linux-2.6.15-rc4/drivers/usb/host/isp116x-hcd.c	2005-12-03 16:53:10.000000000 +0100
@@ -889,12 +889,13 @@ static void isp116x_endpoint_disable(str
 {
 	int i;
 	struct isp116x_ep *ep = hep->hcpriv;;
+	unsigned long end_time = jiffies + msecs_to_jiffies(300);
 
 	if (!ep)
 		return;
 
 	/* assume we'd just wait for the irq */
-	for (i = 0; i < 100 && !list_empty(&hep->urb_list); i++)
+	while (!list_empty(&hep->urb_list) && time_before(jiffies, end_time))
 		msleep(3);
 	if (!list_empty(&hep->urb_list))
 		WARN("ep %p not empty?\n", ep);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
