From: Denis Cheng <crquan@gmail.com>
Date: Thu, 19 Jul 2007 05:36:51 +0000
Subject: [PATCH] [trivial]: remove unused return within void return function
Message-Id: <11848234112179-git-send-email-crquan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Denis Cheng <crquan@gmail.com>
---
 drivers/block/nbd.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c129510..95dd97c 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -478,7 +478,6 @@ error_out:
 		nbd_end_request(req);
 		spin_lock(q->queue_lock);
 	}
-	return;
 }
 
 static int nbd_ioctl(struct inode *inode, struct file *file,
-- 
1.5.2.2

