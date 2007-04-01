From: Brendan Burns <bburns@cs.umass.edu>
Date: Sun, 01 Apr 2007 02:18:55 +0000
Subject: [KJ] PATCH: drivers/keyboard/hilkbd.c request_region
Message-Id: <1175393935.3215.4.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

from: Brendan Burns <bburns@cs.umass.edu>

check error code from request_region

Signed-off-by: Brendan Burns
---

--- linux-2.6.20.4/drivers/input/keyboard/hilkbd.c.orig 2007-03-31
22:09:04.0000
00000 -0400
+++ linux-2.6.20.4/drivers/input/keyboard/hilkbd.c      2007-03-31
22:10:07.0000
00000 -0400
@@ -224,7 +224,8 @@ hil_keyb_init(void)
        if (!hwreg_present((void *)(HILBASE + HIL_DATA)))
                return -ENODEV;
 
-       request_region(HILBASE+HIL_DATA, 2, "hil");
+       if (!request_region(HILBASE+HIL_DATA, 2, "hil"))
+         return -EBUSY;
 #endif
 
        request_irq(HIL_IRQ, hil_interrupt, 0, "hil", hil_dev.dev_id);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
