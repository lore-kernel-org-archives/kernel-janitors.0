From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Sep 2004 21:47:35 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 7/38] net/cycx_drv: replace
Message-Id: <20040922214735.GF1924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52012364627677465=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52012364627677465==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of delay_cycx()
to guarantee the task delays as expected. Remove the prototype and
definition of delay_cycx().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/wan/cycx_drv.c	2004-09-13 17:15:42.000000000 -0700
+++ 2.6.9-rc2/drivers/net/wan/cycx_drv.c	2004-09-22 14:46:31.000000000 -0700
@@ -56,7 +56,7 @@
 #include <linux/sched.h>	/* for jiffies, HZ, etc. */
 #include <linux/cycx_drv.h>	/* API definitions */
 #include <linux/cycx_cfm.h>	/* CYCX firmware module definitions */
-#include <linux/delay.h>	/* udelay */
+#include <linux/delay.h>	/* udelay, msleep */
 #include <asm/io.h>		/* read[wl], write[wl], ioremap, iounmap */
 
 #define	MOD_VERSION	0
@@ -74,7 +74,6 @@ static int reset_cyc2x(void *addr);
 static int detect_cyc2x(void *addr);
 
 /* Miscellaneous functions */
-static void delay_cycx(int sec);
 static int get_option_index(long *optlist, long optval);
 static u16 checksum(u8 *buf, u32 len);
 
@@ -260,7 +259,7 @@ static int memory_exists(void *addr)
 			if (readw(addr + 0x10) == TEST_PATTERN)
 				return 1;
 
-		delay_cycx(1);
+		msleep_interruptible(1000);
 	}
 
 	return 0;
@@ -317,7 +316,7 @@ static void cycx_reset_boot(void *addr, 
 
 	/* 80186 was in hold, go */
 	writeb(0, addr + START_CPU);
-	delay_cycx(1);
+	msleep_interruptible(1000);
 }
 
 /* Load data.bin file through boot (reset) interface. */
@@ -463,13 +462,13 @@ static int load_cyc2x(struct cycx_hw *hw
 		cycx_reset_boot(hw->dpmbase, reset_image, img_hdr->reset_size);
 		/* reset is waiting for boot */
 		writew(GEN_POWER_ON, pt_cycld);
-		delay_cycx(1);
+		msleep_interruptible(1000);
 
 		for (j = 0 ; j < 3 ; j++)
 			if (!readw(pt_cycld))
 				goto reset_loaded;
 			else
-				delay_cycx(1);
+				msleep_interruptible(1000);
 	}
 
 	printk(KERN_ERR "%s: reset not started.\n", modname);
@@ -496,7 +495,7 @@ reset_loaded:
 
 	/* Arthur Ganzert's tip: wait a while after the firmware loading...
 	   seg abr 26 17:17:12 EST 1999 - acme */
-	delay_cycx(7);
+	msleep_interruptible(7000);
 	printk(KERN_INFO "%s: firmware loaded!\n", modname);
 
 	/* enable interrupts */
@@ -548,20 +547,13 @@ static int get_option_index(long *optlis
 static int reset_cyc2x(void *addr)
 {
 	writeb(0, addr + RST_ENABLE);
-	delay_cycx(2);
+	msleep_interruptible(2000);
 	writeb(0, addr + RST_DISABLE);
-	delay_cycx(2);
+	msleep_interruptible(2000);
 
 	return memory_exists(addr);
 }
 
-/* Delay */
-static void delay_cycx(int sec)
-{
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(sec * HZ);
-}
-
 /* Calculate 16-bit CRC using CCITT polynomial. */
 static u16 checksum(u8 *buf, u32 len)
 {

--===============52012364627677465==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52012364627677465==--
