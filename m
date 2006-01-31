From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 17:59:16 +0000
Subject: [KJ] [Patch 5/5] BUG_ON() Conversion in drivers/s390/net/lcs.c
Message-Id: <1138730357.13327.18.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73750334526790162=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============73750334526790162==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,   

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/s390/net/lcs.c.orig	2006-01-31 16:22:56.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/s390/net/lcs.c	2006-01-31 16:23:45.000000000 +0100
@@ -680,9 +680,8 @@ lcs_ready_buffer(struct lcs_channel *cha
 	int index, rc;
 
 	LCS_DBF_TEXT(5, trace, "rdybuff");
-	if (buffer->state != BUF_STATE_LOCKED &&
-	    buffer->state != BUF_STATE_PROCESSED)
-		BUG();
+	BUG_ON(buffer->state != BUF_STATE_LOCKED &&
+		buffer->state != BUF_STATE_PROCESSED);
 	spin_lock_irqsave(get_ccwdev_lock(channel->ccwdev), flags);
 	buffer->state = BUF_STATE_READY;
 	index = buffer - channel->iob;
@@ -706,8 +705,7 @@ __lcs_processed_buffer(struct lcs_channe
 	int index, prev, next;
 
 	LCS_DBF_TEXT(5, trace, "prcsbuff");
-	if (buffer->state != BUF_STATE_READY)
-		BUG();
+	BUG_ON(buffer->state != BUF_STATE_READY);
 	buffer->state = BUF_STATE_PROCESSED;
 	index = buffer - channel->iob;
 	prev = (index - 1) & (LCS_NUM_BUFFS - 1);
@@ -739,9 +737,8 @@ lcs_release_buffer(struct lcs_channel *c
 	unsigned long flags;
 
 	LCS_DBF_TEXT(5, trace, "relbuff");
-	if (buffer->state != BUF_STATE_LOCKED &&
-	    buffer->state != BUF_STATE_PROCESSED)
-		BUG();
+	BUG_ON(buffer->state != BUF_STATE_LOCKED &&
+		buffer->state != BUF_STATE_PROCESSED);
 	spin_lock_irqsave(get_ccwdev_lock(channel->ccwdev), flags);
 	buffer->state = BUF_STATE_EMPTY;
 	spin_unlock_irqrestore(get_ccwdev_lock(channel->ccwdev), flags);



--===============73750334526790162==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73750334526790162==--
