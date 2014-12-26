From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 26 Dec 2014 14:35:41 +0000
Subject: [PATCH 9/27] xhci: Use setup_timer
Message-Id: <1419604558-29743-11-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Convert a call to init_timer and accompanying intializations of
the timer's data and function fields to a call to setup_timer.

A simplified version of the semantic match that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression t,f,d;
@@

-init_timer(&t);
+setup_timer(&t,f,d);
-t.data = d;
-t.function = f;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/host/xhci.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 01fcbb5..ae6d650 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -473,10 +473,8 @@ static void compliance_mode_recovery(unsigned long arg)
 static void compliance_mode_recovery_timer_init(struct xhci_hcd *xhci)
 {
 	xhci->port_status_u0 = 0;
-	init_timer(&xhci->comp_mode_recovery_timer);
-
-	xhci->comp_mode_recovery_timer.data = (unsigned long) xhci;
-	xhci->comp_mode_recovery_timer.function = compliance_mode_recovery;
+	setup_timer(&xhci->comp_mode_recovery_timer,
+		    compliance_mode_recovery, (unsigned long)xhci);
 	xhci->comp_mode_recovery_timer.expires = jiffies +
 			msecs_to_jiffies(COMP_MODE_RCVRY_MSECS);
 

