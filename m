From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Sep 2012 07:05:33 +0000
Subject: [patch 3/3] remoteproc: return -EFAULT on copy_from_user failure
Message-Id: <20120925070533.GD23009@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_from_user() returns the number of bytes remaining to be copied, but
we want to return an error code here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index ea90a56..157a573 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -161,7 +161,7 @@ rproc_recovery_write(struct file *filp, const char __user *user_buf,
 
 	ret = copy_from_user(buf, user_buf, count);
 	if (ret)
-		return ret;
+		return -EFAULT;
 
 	/* remove end of line */
 	if (buf[count - 1] = '\n')
