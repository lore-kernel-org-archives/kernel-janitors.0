From: Gustavo Franco <stratus@acm.org>
Date: Sat, 24 Apr 2004 19:28:53 +0000
Subject: [Kernel-janitors] [PATCH] Replaces yield() with schedule_timeout()
Message-Id: <408ABFF5.6000104@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <408AB344.6010000@acm.org>
In-Reply-To: <408AB344.6010000@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi list,

I guess that it's ok, please apply.

Thanks,
Gustavo Franco

--- drivers/net/sb1000.c.orig       2004-04-24 13:46:26.000000000 -0300
+++ drivers/net/sb1000.c    2004-04-24 13:47:01.000000000 -0300
@@ -271,7 +271,7 @@
        timeout = jiffies + TimeOutJiffies;
        while (a & 0x80 || a & 0x40) {
                /* a little sleep */
-               yield();
+               schedule_timeout(1);
                                                                                                 
 
                a = inb(ioaddr[0] + 7);
                if (time_after_eq(jiffies, timeout)) {
@@ -295,7 +295,7 @@
        timeout = jiffies + TimeOutJiffies;
        while (a & 0x80 || !(a & 0x40)) {
                /* a little sleep */
-               yield();
+               schedule_timeout(1);
 
                a = inb(ioaddr[1] + 6);
                if (time_after_eq(jiffies, timeout)) {

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
