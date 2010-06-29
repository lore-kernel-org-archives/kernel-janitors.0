From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:15:43 +0000
Subject: [PATCH 13/25] crystalhd_lnx: remove casts from void*
Message-Id: <1277806544-31146-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Jarod Wilson <jarod@redhat.com>, Manu Abraham <abraham.manu@gmail.com>, Scott Davilla <davilla@4pi.com>, Ameya Palande <2ameya@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/crystalhd/crystalhd_lnx.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/crystalhd/crystalhd_lnx.c b/drivers/staging/crystalhd/crystalhd_lnx.c
index a4ec891..ce67392 100644
--- a/drivers/staging/crystalhd/crystalhd_lnx.c
+++ b/drivers/staging/crystalhd/crystalhd_lnx.c
@@ -273,7 +273,7 @@ static long chd_dec_ioctl(struct file *fd, unsigned int cmd, unsigned long ua)
 		return -EINVAL;
 	}
 
-	uc = (struct crystalhd_user *)fd->private_data;
+	uc = fd->private_data;
 	if (!uc) {
 		BCMLOG_ERR("Failed to get uc\n");
 		return -ENODATA;
@@ -334,7 +334,7 @@ static int chd_dec_close(struct inode *in, struct file *fd)
 		return -EINVAL;
 	}
 
-	uc = (struct crystalhd_user *)fd->private_data;
+	uc = fd->private_data;
 	if (!uc) {
 		BCMLOG_ERR("Failed to get uc\n");
 		return -ENODATA;
-- 
1.7.0.4

