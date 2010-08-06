From: Dan Carpenter <error27@gmail.com>
Date: Fri, 06 Aug 2010 08:21:26 +0000
Subject: [patch] isdn: gigaset: use after free
Message-Id: <20100806082126.GT9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hansjoerg Lipp <hjlipp@web.de>
Cc: Tilman Schmidt <tilman@imap.cc>, Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Tejun Heo <tj@kernel.org>, Joe Perches <joe@perches.com>, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

I moved the kfree(cb) below the dereferences.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/isdn/gigaset/bas-gigaset.c b/drivers/isdn/gigaset/bas-gigaset.c
index 0ded364..707d9c9 100644
--- a/drivers/isdn/gigaset/bas-gigaset.c
+++ b/drivers/isdn/gigaset/bas-gigaset.c
@@ -1914,11 +1914,13 @@ static int gigaset_write_cmd(struct cardstate *cs, struct cmdbuf_t *cb)
 	 * The next command will reopen the AT channel automatically.
 	 */
 	if (cb->len = 3 && !memcmp(cb->buf, "+++", 3)) {
-		kfree(cb);
 		rc = req_submit(cs->bcs, HD_CLOSE_ATCHANNEL, 0, BAS_TIMEOUT);
 		if (cb->wake_tasklet)
 			tasklet_schedule(cb->wake_tasklet);
-		return rc < 0 ? rc : cb->len;
+		if (!rc)
+			rc = cb->len;
+		kfree(cb);
+		return rc;
 	}
 
 	spin_lock_irqsave(&cs->cmdlock, flags);
