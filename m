From: Gustavo Franco <stratus@acm.org>
Date: Thu, 29 Apr 2004 00:07:21 +0000
Subject: [Kernel-janitors] [REDIFF] Replaces yield() with schedule_timeout()
Message-Id: <40904739.9060501@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I'm sending only this rediff now, if it's ok i'll send the three on my 
queue.

I want to say thank you for all the suggestions.

Hope that helps,
Gustavo Franco

--- drivers/cdrom/sonycd535.c.orig      2004-04-28 20:50:46.000000000 -0300
+++ drivers/cdrom/sonycd535.c   2004-04-28 20:50:55.000000000 -0300
@@ -342,7 +342,8 @@
 sony_sleep(void)
 {
        if (sony535_irq_used <= 0) {    /* poll */
-               yield();
+               set_current_state(TASK_INTERRUPTIBLE);
+               schedule_timeout(1);
        } else {        /* Interrupt driven */
                DEFINE_WAIT(wait);
                                                                                                   


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
