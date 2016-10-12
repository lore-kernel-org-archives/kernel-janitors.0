From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:23:26 +0000
Subject: [patch 1/2] nbd: remove stray IRQ enable
Message-Id: <20161012062326.GV12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We recently changed from spin_lock_irq() to just spin_lock().  This
return path was overlooked and needs to be updated as well.

Fixes: 0eadf37afc25 ('nbd: allow block mq to deal with timeouts')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 8c2599d..ad62964 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -164,7 +164,7 @@ static void sock_shutdown(struct nbd_device *nbd)
 	spin_lock(&nbd->sock_lock);
 
 	if (!nbd->sock) {
-		spin_unlock_irq(&nbd->sock_lock);
+		spin_unlock(&nbd->sock_lock);
 		return;
 	}
 
