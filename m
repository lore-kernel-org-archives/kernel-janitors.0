From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 21:44:42 +0000
Subject: [Kernel-janitors] Re: [PATCH] hotplug/ibmphp: remove long_delay
Message-Id: <20040727214442.GS3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32392628948110413=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32392628948110413==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry, I forgot the dependencies...


Applys-to: 2.6.7

Depends-on: Patches replacing long_delay() with msleep() in ibmphp_hpc.c
and ibmphp_core.c.

Description: Remove long_delay().

Signed-off-by: Nishanth Aravmudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/pci/hotplug/ibmphp.h	2004-06-16 05:18:58.000000000 +0000
+++ linux-dev/drivers/pci/hotplug/ibmphp.h	2004-07-09 00:05:07.000000000 +0000
@@ -759,11 +759,5 @@ extern int ibmphp_configure_card (struct
 extern int ibmphp_unconfigure_card (struct slot **, int);
 extern struct hotplug_slot_ops ibmphp_hotplug_slot_ops;
 
-static inline void long_delay (int delay)
-{
-	set_current_state (TASK_INTERRUPTIBLE);
-	schedule_timeout (delay);
-}
-
 #endif				//__IBMPHP_H
 

--===============32392628948110413==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32392628948110413==--
