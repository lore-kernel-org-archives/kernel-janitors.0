From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 23 Mar 2005 13:46:27 +0000
Subject: [KJ] [PATCH] printk : drivers/block/DAC960.c
Message-Id: <20050323134627.GE9206@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="maH1Gajj2nflutpK"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_DAC960.c.diff"

diff -urpN -X dontdiff a/drivers/block/DAC960.c b/drivers/block/DAC960.c
--- a/drivers/block/DAC960.c	2005-03-18 02:34:26.000000000 +0100
+++ b/drivers/block/DAC960.c	2005-03-23 14:35:11.000000000 +0100
@@ -2495,7 +2495,7 @@ static boolean DAC960_RegisterBlockDevic
 	/* for now, let all request queues share controller's lock */
   	RequestQueue = blk_init_queue(DAC960_RequestFunction,&Controller->queue_lock);
   	if (!RequestQueue) {
-		printk("DAC960: failure to allocate request queue\n");
+		printk(KERN_WARNING "DAC960: failure to allocate request queue\n");
 		continue;
   	}
   	Controller->RequestQueue[n] = RequestQueue;
@@ -3535,7 +3535,7 @@ static void DAC960_V1_ProcessCompletedCo
 
 #ifdef FORCE_RETRY_FAILURE_DEBUG
       if (!(++retry_count % 10000)) {
-	      printk("V1 error retry failure test\n");
+	      printk(KERN_DEBUG "V1 error retry failure test\n");
 	      normal_completion = false;
               DAC960_V1_ReadWriteError(Command);
       }
@@ -4623,7 +4623,7 @@ static void DAC960_V2_ProcessCompletedCo
 
 #ifdef FORCE_RETRY_FAILURE_DEBUG
       if (!(++retry_count % 10000)) {
-	      printk("V2 error retry failure test\n");
+	      printk(KERN_DEBUG "V2 error retry failure test\n");
 	      normal_completion = false;
 	      DAC960_V2_ReadWriteError(Command);
       }

--maH1Gajj2nflutpK
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--maH1Gajj2nflutpK--
