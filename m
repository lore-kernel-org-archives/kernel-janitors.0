From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 00:11:36 +0000
Subject: [KJ] [PATCH 24/39] scsi/atari_scsi: use wait_event()
Message-Id: <20050121001136.GM2600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16952218459467483=="
List-Id: <kernel-janitors.vger.kernel.org>
To: Roman.Hodek@informatik.uni-erlangen.de, James.Bottomley@SteelEye.com
Cc: linux-scsi@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============16952218459467483==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event() instead of the deprecated sleep_on() function. The
second replacement is more difficult, as there are various conditions which may
cause the while-loop to break, each resulting in a different effect.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/scsi/atari_scsi.c	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/scsi/atari_scsi.c	2005-01-20 16:08:25.000000000 -0800
@@ -67,6 +67,7 @@
 
 #include <linux/config.h>
 #include <linux/module.h>
+#include <linux/wait.h>
 
 #define NDEBUG (0)
 
@@ -559,24 +560,20 @@ static void falcon_get_lock( void )
 
 	local_irq_save(flags);
 
-	while( !in_interrupt() && falcon_got_lock && stdma_others_waiting() )
-		sleep_on( &falcon_fairness_wait );
-
-	while (!falcon_got_lock) {
-		if (in_interrupt())
-			panic( "Falcon SCSI hasn't ST-DMA lock in interrupt" );
-		if (!falcon_trying_lock) {
-			falcon_trying_lock = 1;
-			stdma_lock(scsi_falcon_intr, NULL);
-			falcon_got_lock = 1;
-			falcon_trying_lock = 0;
-			wake_up( &falcon_try_wait );
-		}
-		else {
-			sleep_on( &falcon_try_wait );
-		}
-	}	
+	wait_event(falcon_fairness_wait, (in_interrupt() ||
+			falcon_got_lock || stdma_others_waiting()));
 
+	wait_event(falcon_try_wait, (in_interrupt() ||
+				falcon_got_lock || !falcon_trying_lock));
+	if (in_interrupt())
+		panic( "Falcon SCSI hasn't ST-DMA lock in interrupt" );
+	if (!falcon_trying_lock) {
+		falcon_trying_lock = 1;
+		stdma_lock(scsi_falcon_intr, NULL);
+		falcon_got_lock = 1;
+		falcon_trying_lock = 0;
+		wake_up(&falcon_try_wait);
+	}
 	local_irq_restore(flags);
 	if (!falcon_got_lock)
 		panic("Falcon SCSI: someone stole the lock :-(\n");

--===============16952218459467483==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16952218459467483==--
