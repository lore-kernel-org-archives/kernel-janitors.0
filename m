From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Feb 2016 09:48:09 +0000
Subject: [patch] goldfish: locking bugs in goldfish_pipe_read_write()
Message-Id: <20160202094809.GA2902@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christoffer Dall <christoffer.dall@linaro.org>
Cc: Alan Cox <alan@linux.intel.com>, Jin Qian <jinqian@android.com>, Greg Hackmann <ghackmann@google.com>, Yu Ning <yu.ning@intel.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Jason Hu <jia-cheng.hu@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently messed up the error handling here.  We can return with the
pipe->lock held or sometimes we unlock twice by mistake.

Fixes: 2f3be88237a3 ('goldfish_pipe: Pin pages to memory while copying and other cleanups')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/goldfish/goldfish_pipe.c
index e3fab9a..839df4a 100644
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@ -313,7 +313,7 @@ static ssize_t goldfish_pipe_read_write(struct file *filp, char __user *buffer,
 				     !is_write, 0, &page, NULL);
 		up_read(&current->mm->mmap_sem);
 		if (ret < 0)
-			return ret;
+			break;
 
 		if (dev->version) {
 			/* Device version 1 or newer (qemu-android) expects the
@@ -400,22 +400,16 @@ static ssize_t goldfish_pipe_read_write(struct file *filp, char __user *buffer,
 		while (test_bit(wakeBit, &pipe->flags)) {
 			if (wait_event_interruptible(
 					pipe->wake_queue,
-					!test_bit(wakeBit, &pipe->flags))) {
-				ret = -ERESTARTSYS;
-				break;
-			}
-
-			if (test_bit(BIT_CLOSED_ON_HOST, &pipe->flags)) {
-				ret = -EIO;
-				break;
-			}
+					!test_bit(wakeBit, &pipe->flags)))
+				return -ERESTARTSYS;
+
+			if (test_bit(BIT_CLOSED_ON_HOST, &pipe->flags))
+				return -EIO;
 		}
 
 		/* Try to re-acquire the lock */
-		if (mutex_lock_interruptible(&pipe->lock)) {
-			ret = -ERESTARTSYS;
-			break;
-		}
+		if (mutex_lock_interruptible(&pipe->lock))
+			return -ERESTARTSYS;
 	}
 	mutex_unlock(&pipe->lock);
 
