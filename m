From: Julia Lawall <julia@diku.dk>
Date: Sat, 19 Sep 2009 07:13:43 +0000
Subject: [PATCH] drivers/usb: Correct use of.and &
Message-Id: <Pine.LNX.4.64.0909190913050.21312@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Correct priority problem in the use of ! and &.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression E; constant C; @@
- !E & C
+ !(E & C)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/usb-skeleton.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/usb/usb-skeleton.c b/drivers/usb/usb-skeleton.c
--- a/drivers/usb/usb-skeleton.c
+++ b/drivers/usb/usb-skeleton.c
@@ -358,7 +358,7 @@ retry:
 		rv = skel_do_read_io(dev, count);
 		if (rv < 0)
 			goto exit;
-		else if (!file->f_flags & O_NONBLOCK)
+		else if (!(file->f_flags & O_NONBLOCK))
 			goto retry;
 		rv = -EAGAIN;
 	}
@@ -411,7 +411,7 @@ static ssize_t skel_write(struct file *f
 	 * limit the number of URBs in flight to stop a user from using up all
 	 * RAM
 	 */
-	if (!file->f_flags & O_NONBLOCK) {
+	if (!(file->f_flags & O_NONBLOCK)) {
 		if (down_interruptible(&dev->limit_sem)) {
 			retval = -ERESTARTSYS;
 			goto exit;
