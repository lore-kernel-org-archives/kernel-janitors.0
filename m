From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 26 Dec 2014 14:35:50 +0000
Subject: [PATCH 19/27] [media] pvrusb2: Use setup_timer
Message-Id: <1419604558-29743-20-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Isely <isely@pobox.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c |   26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 2fd9b5e..08f2f5a 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -2425,22 +2425,18 @@ struct pvr2_hdw *pvr2_hdw_create(struct usb_interface *intf,
 	}
 	if (!hdw) goto fail;
 
-	init_timer(&hdw->quiescent_timer);
-	hdw->quiescent_timer.data = (unsigned long)hdw;
-	hdw->quiescent_timer.function = pvr2_hdw_quiescent_timeout;
+	setup_timer(&hdw->quiescent_timer, pvr2_hdw_quiescent_timeout,
+		    (unsigned long)hdw);
 
-	init_timer(&hdw->decoder_stabilization_timer);
-	hdw->decoder_stabilization_timer.data = (unsigned long)hdw;
-	hdw->decoder_stabilization_timer.function -		pvr2_hdw_decoder_stabilization_timeout;
+	setup_timer(&hdw->decoder_stabilization_timer,
+		    pvr2_hdw_decoder_stabilization_timeout,
+		    (unsigned long)hdw);
 
-	init_timer(&hdw->encoder_wait_timer);
-	hdw->encoder_wait_timer.data = (unsigned long)hdw;
-	hdw->encoder_wait_timer.function = pvr2_hdw_encoder_wait_timeout;
+	setup_timer(&hdw->encoder_wait_timer, pvr2_hdw_encoder_wait_timeout,
+		    (unsigned long)hdw);
 
-	init_timer(&hdw->encoder_run_timer);
-	hdw->encoder_run_timer.data = (unsigned long)hdw;
-	hdw->encoder_run_timer.function = pvr2_hdw_encoder_run_timeout;
+	setup_timer(&hdw->encoder_run_timer, pvr2_hdw_encoder_run_timeout,
+		    (unsigned long)hdw);
 
 	hdw->master_state = PVR2_STATE_DEAD;
 
@@ -3680,10 +3676,8 @@ static int pvr2_send_request_ex(struct pvr2_hdw *hdw,
 	hdw->ctl_timeout_flag = 0;
 	hdw->ctl_write_pend_flag = 0;
 	hdw->ctl_read_pend_flag = 0;
-	init_timer(&timer);
+	setup_timer(&timer, pvr2_ctl_timeout, (unsigned long)hdw);
 	timer.expires = jiffies + timeout;
-	timer.data = (unsigned long)hdw;
-	timer.function = pvr2_ctl_timeout;
 
 	if (write_len) {
 		hdw->cmd_debug_state = 2;

