From: Gustavo Franco <stratus@acm.org>
Date: Sat, 24 Apr 2004 18:34:44 +0000
Subject: [Kernel-janitors] [PATCH] Replaces yield() with schedule_timeout()
Message-Id: <408AB344.6010000@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi list,

Following what i've said, i'm looking each yield() call to check if it 
needs to be
replaced.I'll send two more patches today and a status message, if 
everything
is ok, i'm planning to complete this task on the next week.

Thanks,
Gustavo Franco

--- drivers/scsi/megaraid.c.orig     2004-04-24 13:54:26.000000000 -0300
+++ drivers/scsi/megaraid.c  2004-04-24 13:54:36.000000000 -0300
@@ -1691,7 +1691,7 @@
        for (counter = 0; counter < 10000; counter++) {
                if (!mbox->m_in.busy)
                        return 0;
-               udelay(100); yield();
+               udelay(100); schedule_timeout(1);
        }
        return -1;              /* give up after 1 second */
 }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
