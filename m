From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 20:50:12 +0000
Subject: [Kernel-janitors] [PATCH] wan/cycx_drv: replace schedule_timeout()
Message-Id: <20040727205012.GE3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89057771815526521=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89057771815526521==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace delay_cycx() with msleep() to guarantee the
task delays for the desired time. Remove definition of delay_cycx().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/wan/cycx_drv.c	2004-06-16 05:19:36.000000000 +0000
+++ linux-dev/drivers/net/wan/cycx_drv.c	2004-07-08 23:56:46.000000000 +0000
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
+		msleep(1000);
 	}
 
 	return 0;
@@ -317,7 +316,7 @@ static void cycx_reset_boot(void *addr, 
 
 	/* 80186 was in hold, go */
 	writeb(0, addr + START_CPU);
-	delay_cycx(1);
+	msleep(1000);
 }
 
 /* Load data.bin file through boot (reset) interface. */
@@ -463,13 +462,13 @@ static int load_cyc2x(struct cycx_hw *hw
 		cycx_reset_boot(hw->dpmbase, reset_image, img_hdr->reset_size);
 		/* reset is waiting for boot */
 		writew(GEN_POWER_ON, pt_cycld);
-		delay_cycx(1);
+		msleep(1000);
 
 		for (j = 0 ; j < 3 ; j++)
 			if (!readw(pt_cycld))
 				goto reset_loaded;
 			else
-				delay_cycx(1);
+				msleep(1000);
 	}
 
 	printk(KERN_ERR "%s: reset not started.\n", modname);
@@ -496,7 +495,7 @@ reset_loaded:
 
 	/* Arthur Ganzert's tip: wait a while after the firmware loading...
 	   seg abr 26 17:17:12 EST 1999 - acme */
-	delay_cycx(7);
+	msleep(7000);
 	printk(KERN_INFO "%s: firmware loaded!\n", modname);
 
 	/* enable interrupts */
@@ -548,20 +547,13 @@ static int get_option_index(long *optlis
 static int reset_cyc2x(void *addr)
 {
 	writeb(0, addr + RST_ENABLE);
-	delay_cycx(2);
+	msleep(2000);
 	writeb(0, addr + RST_DISABLE);
-	delay_cycx(2);
+	msleep(2000);
 
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

--===============89057771815526521==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89057771815526521==--
