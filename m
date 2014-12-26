From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 26 Dec 2014 14:35:54 +0000
Subject: [PATCH 20/27] usb: r8a66597-hcd: Use setup_timer
Message-Id: <1419604558-29743-24-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/usb/host/r8a66597-hcd.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index c4bcfae..a048b8e 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -2483,9 +2483,8 @@ static int r8a66597_probe(struct platform_device *pdev)
 		r8a66597->max_root_hub = 2;
 
 	spin_lock_init(&r8a66597->lock);
-	init_timer(&r8a66597->rh_timer);
-	r8a66597->rh_timer.function = r8a66597_timer;
-	r8a66597->rh_timer.data = (unsigned long)r8a66597;
+	setup_timer(&r8a66597->rh_timer, r8a66597_timer,
+		    (unsigned long)r8a66597);
 	r8a66597->reg = reg;
 
 	/* make sure no interrupts are pending */
@@ -2496,9 +2495,8 @@ static int r8a66597_probe(struct platform_device *pdev)
 
 	for (i = 0; i < R8A66597_MAX_NUM_PIPE; i++) {
 		INIT_LIST_HEAD(&r8a66597->pipe_queue[i]);
-		init_timer(&r8a66597->td_timer[i]);
-		r8a66597->td_timer[i].function = r8a66597_td_timer;
-		r8a66597->td_timer[i].data = (unsigned long)r8a66597;
+		setup_timer(&r8a66597->td_timer[i], r8a66597_td_timer,
+			    (unsigned long)r8a66597);
 		setup_timer(&r8a66597->interval_timer[i],
 				r8a66597_interval_timer,
 				(unsigned long)r8a66597);

