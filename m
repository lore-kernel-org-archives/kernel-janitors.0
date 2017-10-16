From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 15:05:24 +0000
Subject: [PATCH 2/4] char/snsc: Delete three error messages for a failed memory allocation
Message-Id: <c65e3957-dd85-4a33-8e05-5d498aa7b6b2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbedda27-97e7-7b11-b888-39e09f7deaa1@users.sourceforge.net>
In-Reply-To: <cbedda27-97e7-7b11-b888-39e09f7deaa1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 16:24:09 +0200

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/snsc.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/char/snsc.c b/drivers/char/snsc.c
index f551a625686a..eefc306033ab 100644
--- a/drivers/char/snsc.c
+++ b/drivers/char/snsc.c
@@ -80,11 +80,8 @@ scdrv_open(struct inode *inode, struct file *file)
 
 	/* allocate memory for subchannel data */
 	sd = kzalloc(sizeof (struct subch_data_s), GFP_KERNEL);
-	if (sd = NULL) {
-		printk("%s: couldn't allocate subchannel data\n",
-		       __func__);
+	if (!sd)
 		return -ENOMEM;
-	}
 
 	/* initialize subch_data_s fields */
 	sd->sd_nasid = scd->scd_nasid;
@@ -410,20 +407,13 @@ scdrv_init(void)
 			/* allocate sysctl device data */
 			scd = kzalloc(sizeof (struct sysctl_data_s),
 				      GFP_KERNEL);
-			if (!scd) {
-				printk("%s: failed to allocate device info"
-				       "for %s/%s\n", __func__,
-				       SYSCTL_BASENAME, devname);
+			if (!scd)
 				continue;
-			}
 
 			/* initialize sysctl device data fields */
 			scd->scd_nasid = cnodeid_to_nasid(cnode);
 			salbuf = kmalloc(SCDRV_BUFSZ, GFP_KERNEL);
 			if (!salbuf) {
-				printk("%s: failed to allocate driver buffer"
-				       "(%s%s)\n", __func__,
-				       SYSCTL_BASENAME, devname);
 				kfree(scd);
 				continue;
 			}
-- 
2.14.2

