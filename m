From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:49:18 +0000
Subject: [KJ] [PATCH 33/33] usb/io_edgeport: replace
Message-Id: <20050126004918.GY12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33622233254385081=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33622233254385081==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_timeout() instead of deprecated
interruptible_sleep_on_timeout(). Signals are not checked in the current code,
so interruptible should not be necessary. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/usb/serial/io_edgeport.c	2005-01-24 09:34:15.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/usb/serial/io_edgeport.c	2005-01-24 17:16:45.000000000 -0800
@@ -261,6 +261,7 @@
 #include <linux/spinlock.h>
 #include <linux/serial.h>
 #include <linux/ioctl.h>
+#include <linux/wait.h>
 #include <asm/uaccess.h>
 #include <linux/usb.h>
 #include "usb-serial.h"
@@ -991,7 +992,6 @@ static int edge_open (struct usb_serial_
 	struct usb_serial *serial;
 	struct edgeport_serial *edge_serial;
 	int response;
-	int timeout;
 
 	dbg("%s - port %d", __FUNCTION__, port->number);
 
@@ -1073,10 +1073,7 @@ static int edge_open (struct usb_serial_
 	}
 
 	/* now wait for the port to be completely opened */
-	timeout = OPEN_TIMEOUT;
-	while (timeout && edge_port->openPending == TRUE) {
-		timeout = interruptible_sleep_on_timeout (&edge_port->wait_open, timeout);
-	}
+	wait_event_timeout(edge_port->wait_open, (edge_port->openPending != TRUE), OPEN_TIMEOUT);
 
 	if (edge_port->open == FALSE) {
 		/* open timed out */

--===============33622233254385081==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33622233254385081==--
