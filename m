From: Gustavo Franco <stratus@legolas.alternex.com.br>
Date: Wed, 14 Apr 2004 01:59:10 +0000
Subject: [Kernel-janitors] [PATCH] - Replaces yield() with
Message-Id: <407C9AEE.5020808@legolas.alternex.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I'm new here, and this is my first patch, following the issue described by
Matthew Wilcox: "Calling yield() Considered Harmful" on TODO list.

There is no doubt that isn't necessary replace all yield() calls, but i'm
planning to check each case on the tree.Comments?

Hope that helps,
Gustavo Franco
p.s: This e-mail on the "from" is only for ML traffic, my main e-mail is
stratus at acm.dot org.


--- drivers/cdrom/cdu31a.c.orig 2004-04-13 22:43:55.000000000 -0300
+++ drivers/cdrom/cdu31a.c      2004-04-13 22:44:17.000000000 -0300
@@ -386,7 +386,7 @@ static inline void sony_sleep(void)
        unsigned long flags;
                                                                                         

        if (cdu31a_irq <= 0) {
-               yield();
+               schedule_timeout(1);
        } else {                /* Interrupt driven */
                                                                                         

                save_flags(flags);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
