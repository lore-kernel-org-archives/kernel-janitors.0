From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Sep 2014 11:10:05 +0000
Subject: [patch] [media] staging: lirc: freeing ERR_PTRs
Message-Id: <20140904111005.GC21504@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarod Wilson <jarod@wilsonet.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Peter P Waskiewicz Jr <peter.p.waskiewicz.jr@intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We call kfree(data_buf) in the error handling and that will oops if this
is an error pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/lirc/lirc_imon.c b/drivers/staging/media/lirc/lirc_imon.c
index 96c76b3..5441f40 100644
--- a/drivers/staging/media/lirc/lirc_imon.c
+++ b/drivers/staging/media/lirc/lirc_imon.c
@@ -414,6 +414,7 @@ static ssize_t vfd_write(struct file *file, const char __user *buf,
 	data_buf = memdup_user(buf, n_bytes);
 	if (IS_ERR(data_buf)) {
 		retval = PTR_ERR(data_buf);
+		data_buf = NULL;
 		goto exit;
 	}
 
diff --git a/drivers/staging/media/lirc/lirc_sasem.c b/drivers/staging/media/lirc/lirc_sasem.c
index 81f90e1..c32e296 100644
--- a/drivers/staging/media/lirc/lirc_sasem.c
+++ b/drivers/staging/media/lirc/lirc_sasem.c
@@ -392,6 +392,7 @@ static ssize_t vfd_write(struct file *file, const char __user *buf,
 	data_buf = memdup_user((void const __user *)buf, n_bytes);
 	if (IS_ERR(data_buf)) {
 		retval = PTR_ERR(data_buf);
+		data_buf = NULL;
 		goto exit;
 	}
 
