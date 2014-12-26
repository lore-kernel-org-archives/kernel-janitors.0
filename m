From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 26 Dec 2014 14:35:40 +0000
Subject: [PATCH 10/27] xhci-mem: Use setup_timer
Message-Id: <1419604558-29743-10-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/usb/host/xhci-mem.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 5cb3d7a..e72265c 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -833,9 +833,8 @@ void xhci_free_stream_info(struct xhci_hcd *xhci,
 static void xhci_init_endpoint_timer(struct xhci_hcd *xhci,
 		struct xhci_virt_ep *ep)
 {
-	init_timer(&ep->stop_cmd_timer);
-	ep->stop_cmd_timer.data = (unsigned long) ep;
-	ep->stop_cmd_timer.function = xhci_stop_endpoint_command_watchdog;
+	setup_timer(&ep->stop_cmd_timer, xhci_stop_endpoint_command_watchdog,
+		    (unsigned long)ep);
 	ep->xhci = xhci;
 }
 
@@ -2509,9 +2508,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci_print_ir_set(xhci, 0);
 
 	/* init command timeout timer */
-	init_timer(&xhci->cmd_timer);
-	xhci->cmd_timer.data = (unsigned long) xhci;
-	xhci->cmd_timer.function = xhci_handle_command_timeout;
+	setup_timer(&xhci->cmd_timer, xhci_handle_command_timeout,
+		    (unsigned long)xhci);
 
 	/*
 	 * XXX: Might need to set the Interrupter Moderation Register to

