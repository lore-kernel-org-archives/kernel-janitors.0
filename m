From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 26 Oct 2012 07:00:43 +0000
Subject: [patch] mei: copy_from_user() doesn't return an error code
Message-Id: <20121026070043.GC9284@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_from_user() returns the number of bytes remaining but we should be
returning -EFAULT here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index ed4943f..ce1014e 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -607,8 +607,8 @@ static ssize_t mei_write(struct file *file, const char __user *ubuf,
 
 	dev_dbg(&dev->pdev->dev, "cb request size = %zd\n", length);
 
-	rets = copy_from_user(write_cb->request_buffer.data, ubuf, length);
-	if (rets)
+	rets = -EFAULT;
+	if (copy_from_user(write_cb->request_buffer.data, ubuf, length))
 		goto unlock_dev;
 
 	cl->sm_state = 0;
