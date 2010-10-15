From: Dan Carpenter <error27@gmail.com>
Date: Fri, 15 Oct 2010 03:42:35 +0000
Subject: [patch] Staging: lirc: fix PTR_ERR() check
Message-Id: <20101015034235.GH6614@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is a typo.  It's supposed to be IS_ERR() here instead of PTR_ERR().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/lirc/lirc_sasem.c b/drivers/staging/lirc/lirc_sasem.c
index d1ac099..2e681cf 100644
--- a/drivers/staging/lirc/lirc_sasem.c
+++ b/drivers/staging/lirc/lirc_sasem.c
@@ -386,7 +386,7 @@ static ssize_t vfd_write(struct file *file, const char *buf,
 	}
 
 	data_buf = memdup_user(buf, n_bytes);
-	if (PTR_ERR(data_buf)) {
+	if (IS_ERR(data_buf)) {
 		retval = PTR_ERR(data_buf);
 		goto exit;
 	}
