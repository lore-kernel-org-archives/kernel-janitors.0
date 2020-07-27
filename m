From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2020 11:20:50 +0000
Subject: [PATCH] mtd: unlock on error in ioctl
Message-Id: <20200727112050.GF389488@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org

We need to unlock before returning on this error path.

Fixes: 210bec567936 ("mtd: properly check all write ioctls for permissions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/mtdchar.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 52c120f9fb0d..05f9218592df 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -1064,8 +1064,10 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
 		struct mtd_oob_buf32 buf;
 		struct mtd_oob_buf32 __user *buf_user = argp;
 
-		if (!(file->f_mode & FMODE_WRITE))
-			return -EPERM;
+		if (!(file->f_mode & FMODE_WRITE)) {
+			ret = -EPERM;
+			goto unlock;
+		}
 
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
@@ -1117,6 +1119,7 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
 		ret = mtdchar_ioctl(file, cmd, (unsigned long)argp);
 	}
 
+unlock:
 	mutex_unlock(&mtd_mutex);
 
 	return ret;
-- 
2.27.0
