From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 12:10:44 +0000
Subject: [patch 1/2] gru: unlocking should be conditional in gru_dump_context()
Message-Id: <20140130121044.GB13267@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dimitri Sivanich <sivanich@sgi.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I was reviewing this and noticed that unlocking should be conditional on
the error path.  I've changed it to unlock and return directly since we
only do it once and it seems unlikely to change in the near future.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/sgi-gru/grukdump.c b/drivers/misc/sgi-gru/grukdump.c
index 9b2062d17327..2bef3f76032a 100644
--- a/drivers/misc/sgi-gru/grukdump.c
+++ b/drivers/misc/sgi-gru/grukdump.c
@@ -139,8 +139,11 @@ static int gru_dump_context(struct gru_state *gru, int ctxnum,
 
 	ubuf += sizeof(hdr);
 	ubufcch = ubuf;
-	if (gru_user_copy_handle(&ubuf, cch))
-		goto fail;
+	if (gru_user_copy_handle(&ubuf, cch)) {
+		if (cch_locked)
+			unlock_cch_handle(cch);
+		return -EFAULT;
+	}
 	if (cch_locked)
 		ubufcch->delresp = 0;
 	bytes = sizeof(hdr) + GRU_CACHE_LINE_BYTES;
@@ -179,10 +182,6 @@ static int gru_dump_context(struct gru_state *gru, int ctxnum,
 		ret = -EFAULT;
 
 	return ret ? ret : bytes;
-
-fail:
-	unlock_cch_handle(cch);
-	return -EFAULT;
 }
 
 int gru_dump_chiplet_request(unsigned long arg)
