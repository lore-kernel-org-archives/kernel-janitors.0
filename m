From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 18 Sep 2006 22:29:36 +0000
Subject: [KJ] [Patch] BUG_ON conversion for drivers/s390/
Message-Id: <1158618576.13677.0.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158615536.21907.1.camel@alice>
In-Reply-To: <1158615536.21907.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

this patch converts several if () BUG(); construct to BUG_ON();
which occupies less space, uses unlikely and is safer when
BUG() is disabled.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.18-rc7/drivers/s390/char/tape_3590.c.orig	2006-09-18 23:41:14.000000000 +0200
+++ linux-2.6.18-rc7/drivers/s390/char/tape_3590.c	2006-09-18 23:41:23.000000000 +0200
@@ -323,8 +323,7 @@ tape_3590_bread(struct tape_device *devi
 				ccw++;
 				dst += TAPEBLOCK_HSEC_SIZE;
 			}
-			if (off > bv->bv_len)
-				BUG();
+			BUG_ON(off > bv->bv_len);
 		}
 	}
 	ccw = tape_ccw_end(ccw, NOP, 0, NULL);
--- linux-2.6.18-rc7/drivers/s390/char/tape_core.c.orig	2006-09-18 23:41:34.000000000 +0200
+++ linux-2.6.18-rc7/drivers/s390/char/tape_core.c	2006-09-18 23:41:54.000000000 +0200
@@ -651,8 +651,7 @@ tape_alloc_request(int cplength, int dat
 {
 	struct tape_request *request;
 
-	if (datasize > PAGE_SIZE || (cplength*sizeof(struct ccw1)) > PAGE_SIZE)
-		BUG();
+	BUG_ON(datasize > PAGE_SIZE || (cplength*sizeof(struct ccw1)) > PAGE_SIZE);
 
 	DBF_LH(6, "tape_alloc_request(%d, %d)\n", cplength, datasize);
 
--- linux-2.6.18-rc7/drivers/s390/char/tape_std.c.orig	2006-09-18 23:42:05.000000000 +0200
+++ linux-2.6.18-rc7/drivers/s390/char/tape_std.c	2006-09-18 23:42:31.000000000 +0200
@@ -39,8 +39,7 @@ tape_std_assign_timeout(unsigned long da
 	int rc;
 
 	request = (struct tape_request *) data;
-	if ((device = request->device) = NULL)
-		BUG();
+	BUG_ON((device = request->device) = NULL);
 
 	DBF_EVENT(3, "%08x: Assignment timeout. Device busy.\n",
 			device->cdev_id);
--- linux-2.6.18-rc7/drivers/s390/net/lcs.c.orig	2006-09-18 23:42:43.000000000 +0200
+++ linux-2.6.18-rc7/drivers/s390/net/lcs.c	2006-09-18 23:42:53.000000000 +0200
@@ -696,8 +696,7 @@ __lcs_processed_buffer(struct lcs_channe
 	int index, prev, next;
 
 	LCS_DBF_TEXT(5, trace, "prcsbuff");
-	if (buffer->state != BUF_STATE_READY)
-		BUG();
+	BUG_ON(buffer->state != BUF_STATE_READY);
 	buffer->state = BUF_STATE_PROCESSED;
 	index = buffer - channel->iob;
 	prev = (index - 1) & (LCS_NUM_BUFFS - 1);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
