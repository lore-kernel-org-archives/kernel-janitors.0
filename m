From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 21 Jul 2004 22:39:03 +0000
Subject: [Kernel-janitors] [PATCH] dsp56k: replace schedule_timeout() with
Message-Id: <20040721223903.GO1906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============069509452293494256=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============069509452293494256==
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

Note: I looked for the appropriate maintainer of this driver, but I did
not find anyone. If someone could tell me who that would be, I would
appreciate it.

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/char/dsp56k.c	2004-06-16 05:19:23.000000000 +0000
+++ linux-dev/drivers/char/dsp56k.c	2004-07-08 23:13:18.000000000 +0000
@@ -58,12 +58,6 @@
 #define DSP56K_TRANSMIT		(dsp56k_host_interface.isr & DSP56K_ISR_TXDE)
 #define DSP56K_RECEIVE		(dsp56k_host_interface.isr & DSP56K_ISR_RXDF)
 
-#define wait_some(n) \
-{ \
-	set_current_state(TASK_INTERRUPTIBLE); \
-	schedule_timeout(n); \
-}
-
 #define handshake(count, maxio, timeout, ENABLE, f) \
 { \
 	long i, t, m; \
@@ -71,13 +65,13 @@
 		m = min_t(unsigned long, count, maxio); \
 		for (i = 0; i < m; i++) { \
 			for (t = 0; t < timeout && !ENABLE; t++) \
-				wait_some(HZ/50); \
+				msleep(20); \
 			if(!ENABLE) \
 				return -EIO; \
 			f; \
 		} \
 		count -= m; \
-		if (m == maxio) wait_some(HZ/50); \
+		if (m == maxio) msleep(20); \
 	} \
 }
 
@@ -85,7 +79,7 @@
 { \
 	int t; \
 	for(t = 0; t < n && !DSP56K_TRANSMIT; t++) \
-		wait_some(HZ/100); \
+		msleep(10); \
 	if(!DSP56K_TRANSMIT) { \
 		return -EIO; \
 	} \
@@ -95,7 +89,7 @@
 { \
 	int t; \
 	for(t = 0; t < n && !DSP56K_RECEIVE; t++) \
-		wait_some(HZ/100); \
+		msleep(10); \
 	if(!DSP56K_RECEIVE) { \
 		return -EIO; \
 	} \

--===============069509452293494256==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============069509452293494256==--
