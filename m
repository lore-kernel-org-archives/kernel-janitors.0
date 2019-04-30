From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2019 10:35:05 +0000
Subject: [PATCH] staging: kpc2000: Fix a stack information leak in kp2000_cdev_ioctl()
Message-Id: <20190430103505.GB7064@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The kp2000_regs struct has a 4 byte hole between ->hw_rev and ->ssid so
this could leak stack information to the user.  This patch just memsets
the whole struct to zero.

Fixes: 7dc7967fc39a ("staging: kpc2000: add initial set of Daktronics drivers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/kpc2000/kpc2000/fileops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/kpc2000/kpc2000/fileops.c b/drivers/staging/kpc2000/kpc2000/fileops.c
index 4bfba59570e6..a6beca8dbac5 100644
--- a/drivers/staging/kpc2000/kpc2000/fileops.c
+++ b/drivers/staging/kpc2000/kpc2000/fileops.c
@@ -91,6 +91,8 @@ long  kp2000_cdev_ioctl(struct file *filp, unsigned int ioctl_num, unsigned long
 	case KP2000_IOCTL_GET_EVERYTHING: {
 		struct kp2000_regs temp;
 		int ret;
+
+		memset(&temp, 0, sizeof(temp));
 		temp.card_id = pcard->card_id;
 		temp.build_version = pcard->build_version;
 		temp.build_datestamp = pcard->build_datestamp;
-- 
2.18.0
