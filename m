From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 18:01:15 +0000
Subject: [Kernel-janitors] [PATCH] radio/miropcm20-rds: replace
Message-Id: <20040726180115.GY1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62311757469767137=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62311757469767137==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() so the task
is guaranteed to delay the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/radio/miropcm20-rds.c	2004-06-16 05:18:58.000000000 +0000
+++ linux-dev/drivers/media/radio/miropcm20-rds.c	2004-07-21 17:21:33.000000000 +0000
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/fs.h>
 #include <linux/miscdevice.h>
+#include <linux/delay.h>
 #include <asm/uaccess.h>
 #include "miropcm20-rds-core.h"
 
@@ -60,8 +61,7 @@ static ssize_t rds_f_read(struct file *f
 	char c;
 	char bits[8];
 
-	current->state=TASK_UNINTERRUPTIBLE;
-	schedule_timeout(2*HZ);
+	msleep(2000);
 	aci_rds_cmd(RDS_STATUS, &c, 1);
 	print_matrix(&c, bits);
 	if (copy_to_user(buffer, bits, 8))

--===============62311757469767137==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62311757469767137==--
