From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:47:41 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114741.GL2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17376132377638021=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============17376132377638021==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use list_for_each_entry to make code more readable.
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/usb/media/dabusb.c	Wed Jul 14 19:15:08 2004
+++ list_for_each/drivers/usb/media/dabusb.c	Wed Jul 28 19:58:04 2004
@@ -109,16 +109,13 @@
 static int dabusb_cancel_queue (pdabusb_t s, struct list_head *q)
 {
 	unsigned long flags;
-	struct list_head *p;
 	pbuff_t b;
 
 	dbg("dabusb_cancel_queue");
 
 	spin_lock_irqsave (&s->lock, flags);
 
-	for (p = q->next; p != q; p = p->next) {
-		b = list_entry (p, buff_t, buff_list);
-
+	list_for_each_entry(b, q, buff_list) {
 #ifdef DEBUG
 		dump_urb(b->purb);
 #endif

--===============17376132377638021==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17376132377638021==--
