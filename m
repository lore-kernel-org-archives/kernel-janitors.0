From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 26 Dec 2014 14:35:53 +0000
Subject: [PATCH 21/27] usb: oxu210hp-hcd: Use setup_timer
Message-Id: <1419604558-29743-23-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

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
-t.function = f;
-t.data = d;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/host/oxu210hp-hcd.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index 036924e..ea0ecbc 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -2598,9 +2598,7 @@ static int oxu_hcd_init(struct usb_hcd *hcd)
 
 	spin_lock_init(&oxu->lock);
 
-	init_timer(&oxu->watchdog);
-	oxu->watchdog.function = oxu_watchdog;
-	oxu->watchdog.data = (unsigned long) oxu;
+	setup_timer(&oxu->watchdog, oxu_watchdog, (unsigned long)oxu);
 
 	/*
 	 * hw default: 1K periodic list heads, one per frame.

