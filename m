From: Domen Puncer <domen@coderock.org>
Date: Sat, 24 Jul 2004 21:27:10 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] replace PRINTK with pr_debug in
Message-Id: <20040724212709.GB3633@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93906867038682562=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040724211801.GA3633@masina.coderock.org>
In-Reply-To: <20040724211801.GA3633@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============93906867038682562==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Removed unused dprintk, replaced PRINTK with pr_debug.
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/block/umem.c	Wed Jun 16 07:20:26 2004
+++ a/drivers/block/umem.c	Sat Jul 24 23:23:09 2004
@@ -34,6 +34,7 @@
  *			 - set initialised bit then.
  */
 
+//#define DEBUG /* uncomment if you want debugging info (pr_debug) */
 #include <linux/config.h>
 #include <linux/sched.h>
 #include <linux/fs.h>
@@ -58,10 +59,6 @@
 #include <asm/uaccess.h>
 #include <asm/io.h>
 
-#define PRINTK(x...) do {} while (0)
-#define dprintk(x...) do {} while (0)
-/*#define dprintk(x...) printk(x) */
-
 #define MM_MAXCARDS 4
 #define MM_RAHEAD 2      /* two sectors */
 #define MM_BLKSIZE 1024  /* 1k blocks */
@@ -299,7 +296,7 @@
 
 	/* make the last descriptor end the chain */
 	page = &card->mm_pages[card->Active];
-	PRINTK("start_io: %d %d->%d\n", card->Active, page->headcnt, page->cnt-1);
+	pr_debug("start_io: %d %d->%d\n", card->Active, page->headcnt, page->cnt-1);
 	desc = &page->desc[page->cnt-1];
 
 	desc->control_bits |= cpu_to_le32(DMASCR_CHAIN_COMP_EN);
@@ -532,7 +529,7 @@
 		activate(card);
 	} else {
 		/* haven't finished with this one yet */
-		PRINTK("do some more\n");
+		pr_debug("do some more\n");
 		mm_start_io(card);
 	}
  out_unlock:
@@ -555,7 +552,7 @@
 static int mm_make_request(request_queue_t *q, struct bio *bio)
 {
 	struct cardinfo *card = q->queuedata;
-	PRINTK("mm_make_request %ld %d\n", bh->b_rsector, bh->b_size);
+	pr_debug("mm_make_request %ld %d\n", bh->b_rsector, bh->b_size);
 
 	bio->bi_phys_segments = bio->bi_idx; /* count of completed segments*/
 	spin_lock_irq(&card->lock);

--===============93906867038682562==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93906867038682562==--
