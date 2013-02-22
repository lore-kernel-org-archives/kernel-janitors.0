From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Feb 2013 06:05:50 +0000
Subject: [patch] remoteproc: off by one in rproc_virtio_new_vringh()
Message-Id: <20130222060159.GA15816@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

It should be >= ARRAY_SIZE() instead of > ARRAY_SIZE() because it
is an index.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index dba33ff..b5e3af5 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -208,7 +208,7 @@ rproc_virtio_new_vringh(struct virtio_device *vdev, unsigned index,
 	struct vringh *vrh;
 	int err;
 
-	if (index > ARRAY_SIZE(rvdev->vring)) {
+	if (index >= ARRAY_SIZE(rvdev->vring)) {
 		dev_err(&rvdev->vdev.dev, "bad vring index: %d\n", index);
 		return NULL;
 	}
