From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 24 Feb 2005 21:53:27 +0000
Subject: [KJ] [PATCH] atm/fore200e: remove custom msecs_to_jiffies() macro
Message-Id: <20050224215327.GI2598@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53486373910113594=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============53486373910113594==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description: Replace MSECS(), a custom macro, which is incorrect because
of the variability of HZ, with msecs_to_jiffies(). Patch is
compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc4-v/drivers/atm/fore200e.c	2005-02-23 18:43:23.000000000 -0800
+++ 2.6.11-rc4/drivers/atm/fore200e.c	2005-02-24 13:51:14.000000000 -0800
@@ -96,10 +96,6 @@
 
 #define FORE200E_NEXT_ENTRY(index, modulo)         (index = ++(index) % (modulo))
 
-
-#define MSECS(ms)  (((ms)*HZ/1000)+1)
-
-
 #if 1
 #define ASSERT(expr)     if (!(expr)) { \
 			     printk(FORE200E "assertion failed! %s[%d]: %s\n", \
@@ -246,7 +242,7 @@ fore200e_chunk_free(struct fore200e* for
 static void
 fore200e_spin(int msecs)
 {
-    unsigned long timeout = jiffies + MSECS(msecs);
+    unsigned long timeout = jiffies + msecs_to_jiffies(msecs);
     while (time_before(jiffies, timeout));
 }
 
@@ -254,7 +250,7 @@ fore200e_spin(int msecs)
 static int
 fore200e_poll(struct fore200e* fore200e, volatile u32* addr, u32 val, int msecs)
 {
-    unsigned long timeout = jiffies + MSECS(msecs);
+    unsigned long timeout = jiffies + msecs_to_jiffies(msecs);
     int           ok;
 
     mb();
@@ -278,7 +274,7 @@ fore200e_poll(struct fore200e* fore200e,
 static int
 fore200e_io_poll(struct fore200e* fore200e, volatile u32 __iomem *addr, u32 val, int msecs)
 {
-    unsigned long timeout = jiffies + MSECS(msecs);
+    unsigned long timeout = jiffies + msecs_to_jiffies(msecs);
     int           ok;
 
     do {
@@ -2596,7 +2592,7 @@ static int __init
 fore200e_monitor_getc(struct fore200e* fore200e)
 {
     struct cp_monitor __iomem * monitor = fore200e->cp_monitor;
-    unsigned long      timeout = jiffies + MSECS(50);
+    unsigned long      timeout = jiffies + msecs_to_jiffies(50);
     int                c;
 
     while (time_before(jiffies, timeout)) {

--===============53486373910113594==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53486373910113594==--
