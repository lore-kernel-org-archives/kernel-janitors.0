From: Gustavo Franco <stratus@acm.org>
Date: Sat, 24 Apr 2004 19:35:45 +0000
Subject: [Kernel-janitors] [PATCH] Replaces yield() with schedule_timeout()
Message-Id: <408AC191.4050906@acm.org>
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


--- drivers/cdrom/sonycd535.c.orig    2004-04-24 13:46:28.000000000 -0300
+++ drivers/cdrom/sonycd535.c 2004-04-24 13:47:38.000000000 -0300
@@ -342,7 +342,7 @@
 sony_sleep(void)
 {
        if (sony535_irq_used <= 0) {    /* poll */
-               yield();
+               schedule_timeout(1);
        } else {        /* Interrupt driven */
                DEFINE_WAIT(wait);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
