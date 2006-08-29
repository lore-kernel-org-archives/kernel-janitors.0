From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Tue, 29 Aug 2006 07:58:22 +0000
Subject: [KJ] [Patch] convert schedule_timeout to msleep in cciss.c
Message-Id: <1156838302.31519.28.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day list

I was doing some more grepping for schedule_timeout without HZ and found
one in cciss.c.

Now I found a patch from Nish
http://lists.osdl.org/mailman/htdig/kernel-janitors/2005-February/003637.html
that was ack'd
http://lists.osdl.org/mailman/htdig/kernel-janitors/2005-February/003638.html

That contained a fix, but does not seem to have been applied.

Now Nish posted another patch 
http://lists.osdl.org/mailman/htdig/kernel-janitors/2004-September/001849.html
that does seem to be in the KJ patch set, but doesn't fix the second
schedule_timeout().

So I figure it should either be converted to HZ relative or to msleep().
Here is a patch to do the later.

compile tested on allyesconfig.


Convert schedule_timeout to msleep in cciss.c

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
--- drivers/block/cciss.c.orig	2006-08-29 15:31:01.000000000 +1000
+++ drivers/block/cciss.c	2006-08-29 15:41:03.000000000 +1000
@@ -2912,8 +2912,7 @@ static int cciss_pci_init(ctlr_info_t *c
 		if (!(readl(c->vaddr + SA5_DOORBELL) & CFGTBL_ChangeReq))
 			break;
 		/* delay and try again */
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(10);
+		msleep(100);
 	}
 
 #ifdef CCISS_DEBUG


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
