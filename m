From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 15:06:27 +0000
Subject: [PATCH 3/4] char/snsc: Improve a size determination in two functions
Message-Id: <cc495147-1ae5-3479-ece0-45398a8a6d4b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbedda27-97e7-7b11-b888-39e09f7deaa1@users.sourceforge.net>
In-Reply-To: <cbedda27-97e7-7b11-b888-39e09f7deaa1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 16:26:09 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/snsc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/char/snsc.c b/drivers/char/snsc.c
index eefc306033ab..bec3bd966b1f 100644
--- a/drivers/char/snsc.c
+++ b/drivers/char/snsc.c
@@ -79,7 +79,7 @@ scdrv_open(struct inode *inode, struct file *file)
 	scd = container_of(inode->i_cdev, struct sysctl_data_s, scd_cdev);
 
 	/* allocate memory for subchannel data */
-	sd = kzalloc(sizeof (struct subch_data_s), GFP_KERNEL);
+	sd = kzalloc(sizeof(*sd), GFP_KERNEL);
 	if (!sd)
 		return -ENOMEM;
 
@@ -405,8 +405,7 @@ scdrv_init(void)
 				geo_slab(geoid));
 
 			/* allocate sysctl device data */
-			scd = kzalloc(sizeof (struct sysctl_data_s),
-				      GFP_KERNEL);
+			scd = kzalloc(sizeof(*scd), GFP_KERNEL);
 			if (!scd)
 				continue;
 
-- 
2.14.2

