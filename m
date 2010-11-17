From: Dan Carpenter <error27@gmail.com>
Date: Wed, 17 Nov 2010 05:12:23 +0000
Subject: [patch 1/3] [media] lirc_dev: stray unlock in lirc_dev_fop_poll()
Message-Id: <20101117051223.GD31724@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Jarod Wilson <jarod@redhat.com>, Zimny Lech <napohybelskurwysynom2010@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We shouldn't unlock here.  I think this was a cut and paste error.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/IR/lirc_dev.c b/drivers/media/IR/lirc_dev.c
index 8418b14..8ab9d87 100644
--- a/drivers/media/IR/lirc_dev.c
+++ b/drivers/media/IR/lirc_dev.c
@@ -522,10 +522,8 @@ unsigned int lirc_dev_fop_poll(struct file *file, poll_table *wait)
 
 	dev_dbg(ir->d.dev, LOGHEAD "poll called\n", ir->d.name, ir->d.minor);
 
-	if (!ir->attached) {
-		mutex_unlock(&ir->irctl_lock);
+	if (!ir->attached)
 		return POLLERR;
-	}
 
 	poll_wait(file, &ir->buf->wait_poll, wait);
 
