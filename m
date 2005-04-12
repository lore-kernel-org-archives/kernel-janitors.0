From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Tue, 12 Apr 2005 15:29:09 +0000
Subject: [KJ] [PATCH] drivers/media/dvb/dvb-core/dvb_frontend.c : Use of
Message-Id: <425BE945.2000904@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use of time_after() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

-- 

Marcelo Feitoza Parisi            
marcelo at feitoza.com.br
http://marcelo.feitoza.com.br/



Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/media/dvb/dvb-core/dvb_frontend.c	2005-04-07 22:25:34.000000000 -0300
+++ development/drivers/media/dvb/dvb-core/dvb_frontend.c	2005-04-09 17:43:49.000000000 -0300
@@ -35,6 +35,7 @@
 #include <linux/moduleparam.h>
 #include <linux/list.h>
 #include <linux/suspend.h>
+#include <linux/jiffies.h>
 #include <asm/processor.h>
 #include <asm/semaphore.h>
 
@@ -327,7 +328,8 @@ static int dvb_frontend_is_exiting(struc
 		return 1;
 
 	if (fepriv->dvbdev->writers = 1)
-		if (jiffies - fepriv->release_jiffies > dvb_shutdown_timeout * HZ)
+		if (time_after(jiffies, fepriv->release_jiffies + 
+					dvb_shutdown_timeout * HZ))
 			return 1;
 
 	return 0;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
