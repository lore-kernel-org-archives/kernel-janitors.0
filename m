From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 15 Jul 2010 06:42:39 +0000
Subject: [PATCH 2/2] i2o: check return code from put_user()
Message-Id: <1279176159-5565-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Julia Lawall <julia@diku.dk>, Tejun Heo <tj@kernel.org>, Jiri Kosina <jkosina@suse.cz>, Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org

Check return value of put_user() and return -EFAULT if it failed.
Original comment "We did a get user...so assuming mem is ok...is this
bad?" is incorrect because memory can be read only.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/message/i2o/i2o_config.c |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/message/i2o/i2o_config.c b/drivers/message/i2o/i2o_config.c
index 4dd39a0..068ba07 100644
--- a/drivers/message/i2o/i2o_config.c
+++ b/drivers/message/i2o/i2o_config.c
@@ -111,9 +111,9 @@ static int i2o_cfg_gethrt(unsigned long arg)
 
 	len = 8 + ((hrt->entry_len * hrt->num_entries) << 2);
 
-	/* We did a get user...so assuming mem is ok...is this bad? */
-	put_user(len, kcmd.reslen);
-	if (len > reslen)
+	if (put_user(len, kcmd.reslen))
+		ret = -EFAULT;
+	else if (len > reslen)
 		ret = -ENOBUFS;
 	else if (copy_to_user(kcmd.resbuf, (void *)hrt, len))
 		ret = -EFAULT;
@@ -147,8 +147,9 @@ static int i2o_cfg_getlct(unsigned long arg)
 	lct = (i2o_lct *) c->lct;
 
 	len = (unsigned int)lct->table_size << 2;
-	put_user(len, kcmd.reslen);
-	if (len > reslen)
+	if (put_user(len, kcmd.reslen))
+		ret = -EFAULT;
+	else if (len > reslen)
 		ret = -ENOBUFS;
 	else if (copy_to_user(kcmd.resbuf, lct, len))
 		ret = -EFAULT;
@@ -208,8 +209,9 @@ static int i2o_cfg_parms(unsigned long arg, unsigned int type)
 		return -EAGAIN;
 	}
 
-	put_user(len, kcmd.reslen);
-	if (len > reslen)
+	if (put_user(len, kcmd.reslen))
+		ret = -EFAULT;
+	else if (len > reslen)
 		ret = -ENOBUFS;
 	else if (copy_to_user(kcmd.resbuf, res, len))
 		ret = -EFAULT;
-- 
1.7.0.4

