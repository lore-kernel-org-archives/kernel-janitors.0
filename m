From: Dan Carpenter <error27@gmail.com>
Date: Tue, 02 Nov 2010 03:22:23 +0000
Subject: [patch] [media] saa7164: make buffer smaller
Message-Id: <20101102032223.GD14069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Steven Toth <stoth@kernellabs.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This isn't a runtime bug, it's just to make static checkers happy.

In vidioc_querycap() we copy a saa7164_dev ->name driver array into a
v4l2_capability -> driver array.  The ->driver array is only 16 chars
long so ->name also can't be more than 16 characters.

The ->name gets set in v4l2_capability() and it always is less than 16
characters so we can easily make the buffer smaller.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/saa7164/saa7164.h b/drivers/media/video/saa7164/saa7164.h
index 1d9c5cb..8b3e844 100644
--- a/drivers/media/video/saa7164/saa7164.h
+++ b/drivers/media/video/saa7164/saa7164.h
@@ -448,7 +448,7 @@ struct saa7164_dev {
 	int	nr;
 	int	hwrevision;
 	u32	board;
-	char	name[32];
+	char	name[16];
 
 	/* firmware status */
 	struct saa7164_fw_status	fw_status;
diff --git a/drivers/media/video/saa7164/saa7164-core.c b/drivers/media/video/saa7164/saa7164-core.c
index e1bac50..b66f78f 100644
--- a/drivers/media/video/saa7164/saa7164-core.c
+++ b/drivers/media/video/saa7164/saa7164-core.c
@@ -1001,7 +1001,7 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
 	atomic_inc(&dev->refcount);
 	dev->nr = saa7164_devcount++;
 
-	sprintf(dev->name, "saa7164[%d]", dev->nr);
+	snprintf(dev->name, sizeof(dev->name), "saa7164[%d]", dev->nr);
 
 	mutex_lock(&devlist);
 	list_add_tail(&dev->devlist, &saa7164_devlist);
