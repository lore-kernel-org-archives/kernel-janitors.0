From: Dan Carpenter <error27@gmail.com>
Date: Sat, 22 May 2010 20:31:40 +0000
Subject: [patch] V4L/DVB: uninitialized variable in
Message-Id: <20100522203140.GQ22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch ffb4877ba0: "V4L/DVB: v4l2-common: simplify prio utility
functions" accidentally removed the "dev = fh->dev;" assignment.
Even before that change, we still could have passed a bogus "dev" pointer
to cx25821_set_freq() if "fh" was null.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/cx25821/cx25821-video.c b/drivers/staging/cx25821/cx25821-video.c
index 791212c..56a7521 100644
--- a/drivers/staging/cx25821/cx25821-video.c
+++ b/drivers/staging/cx25821/cx25821-video.c
@@ -966,11 +966,13 @@ int cx25821_vidioc_s_frequency(struct file *file, void *priv, struct v4l2_freque
 	struct cx25821_dev *dev;
 	int err;
 
-	if (fh) {
-		err = v4l2_prio_check(&dev->prio, fh->prio);
-		if (0 != err)
-			return err;
-	}
+	if (!fh)
+		return -ENODEV;
+
+	dev = fh->dev;
+	err = v4l2_prio_check(&dev->prio, fh->prio);
+	if (0 != err)
+		return err;
 
 	return cx25821_set_freq(dev, f);
 }
