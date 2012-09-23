From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 23 Sep 2012 16:31:30 +0000
Subject: [patch] staging: rts5139: use kzalloc() to close an info leak
Message-Id: <20120923163129.GA21396@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If we don't fill the whole buffer then there is information leaked to
the user.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Hopefully this is only reachable by root so it's probably not such a big
deal.

diff --git a/drivers/staging/rts5139/rts51x_fop.c b/drivers/staging/rts5139/rts51x_fop.c
index e1200fe..bf1a9e6 100644
--- a/drivers/staging/rts5139/rts51x_fop.c
+++ b/drivers/staging/rts5139/rts51x_fop.c
@@ -79,7 +79,7 @@ static int rts51x_sd_direct_cmnd(struct rts51x_chip *chip,
 
 	case 1:
 		/* Read from card */
-		buf = kmalloc(cmnd->buf_len, GFP_KERNEL);
+		buf = kzalloc(cmnd->buf_len, GFP_KERNEL);
 		if (!buf)
 			TRACE_RET(chip, STATUS_NOMEM);
 
