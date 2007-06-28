From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Thu, 28 Jun 2007 16:33:57 +0000
Subject: [KJ] [PATCH] irda: Remove unnecessary cast of return value of
Message-Id: <4684304D020000F40000A999@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unnecessary cast of return value of kmalloc() in
irda/kingsun-sir.c

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---

diff --git a/drivers/net/irda/kingsun-sir.c b/drivers/net/irda/kingsun-sir.c
index 2174291..c42d875 100644
--- a/drivers/net/irda/kingsun-sir.c
+++ b/drivers/net/irda/kingsun-sir.c
@@ -509,12 +509,12 @@ static int kingsun_probe(struct usb_interface *intf,
 	spin_lock_init(&kingsun->lock);
 
 	/* Allocate input buffer */
-	kingsun->in_buf = (__u8 *)kmalloc(kingsun->max_rx, GFP_KERNEL);
+	kingsun->in_buf = kmalloc(kingsun->max_rx, GFP_KERNEL);
 	if (!kingsun->in_buf)
 		goto free_mem;
 
 	/* Allocate output buffer */
-	kingsun->out_buf = (__u8 *)kmalloc(KINGSUN_FIFO_SIZE, GFP_KERNEL);
+	kingsun->out_buf = kmalloc(KINGSUN_FIFO_SIZE, GFP_KERNEL);
 	if (!kingsun->out_buf)
 		goto free_mem;


-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
