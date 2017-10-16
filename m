From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 15:04:16 +0000
Subject: [PATCH 1/4] char/snsc: Adjust one function call together with a variable assignment
Message-Id: <1fa3d6ea-bd7d-5036-399a-8b9187dccffa@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbedda27-97e7-7b11-b888-39e09f7deaa1@users.sourceforge.net>
In-Reply-To: <cbedda27-97e7-7b11-b888-39e09f7deaa1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 16:15:21 +0200

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/snsc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/snsc.c b/drivers/char/snsc.c
index 6aa32679fd58..f551a625686a 100644
--- a/drivers/char/snsc.c
+++ b/drivers/char/snsc.c
@@ -419,7 +419,8 @@ scdrv_init(void)
 
 			/* initialize sysctl device data fields */
 			scd->scd_nasid = cnodeid_to_nasid(cnode);
-			if (!(salbuf = kmalloc(SCDRV_BUFSZ, GFP_KERNEL))) {
+			salbuf = kmalloc(SCDRV_BUFSZ, GFP_KERNEL);
+			if (!salbuf) {
 				printk("%s: failed to allocate driver buffer"
 				       "(%s%s)\n", __func__,
 				       SYSCTL_BASENAME, devname);
-- 
2.14.2

