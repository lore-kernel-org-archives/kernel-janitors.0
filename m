From: Mark McClelland <mark@alpha.dyndns.org>
Date: Wed, 22 Sep 2004 12:38:32 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 8/17] media/ovcamchip_core:
Message-Id: <41517248.3030707@alpha.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============03397187858920625=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============03397187858920625==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Nishanth Aravamudan wrote:

>Any comments would be appreciated.
>
>Description: Use msleep() instead of schedule_timeout() to
>guarantee the task delays as expected.
>  
>

Looks good to me. Thank you for doing this.

Should I send this on to Andrew/Linus, or were you (or some automated 
janitor-patch-bot) planning to do that?

Thanks,
- Mark

>Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
>
>--- 2.6.9-rc2-vanilla/drivers/media/video/ovcamchip/ovcamchip_core.c	2004-09-13 17:15:39.000000000 -0700
>+++ 2.6.9-rc2/drivers/media/video/ovcamchip/ovcamchip_core.c	2004-09-20 14:53:01.000000000 -0700
>@@ -15,6 +15,7 @@
> #include <linux/module.h>
> #include <linux/moduleparam.h>
> #include <linux/slab.h>
>+#include <linux/delay.h>
> #include "ovcamchip_priv.h"
> 
> #define DRIVER_VERSION "v2.27 for Linux 2.6"
>@@ -128,8 +129,7 @@ static int init_camchip(struct i2c_clien
> 	ov_write(c, 0x12, 0x80);
> 
> 	/* Wait for it to initialize */
>-	set_current_state(TASK_UNINTERRUPTIBLE);
>-	schedule_timeout(1 + 150 * HZ / 1000);
>+	msleep(150);
> 
> 	for (i = 0, success = 0; i < I2C_DETECT_RETRIES && !success; i++) {
> 		if (ov_read(c, GENERIC_REG_ID_HIGH, &high) >= 0) {
>@@ -145,8 +145,7 @@ static int init_camchip(struct i2c_clien
> 		ov_write(c, 0x12, 0x80);
> 
> 		/* Wait for it to initialize */
>-		set_current_state(TASK_UNINTERRUPTIBLE);
>-		schedule_timeout(1 + 150 * HZ / 1000);
>+		msleep(150);
> 
> 		/* Dummy read to sync I2C */
> 		ov_read(c, 0x00, &low);
>  
>


-- 
Mark McClelland
mark AT alpha.dyndns.org


--===============03397187858920625==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============03397187858920625==--
