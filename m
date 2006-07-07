From: Richard <h.vanberkum@chello.nl>
Date: Fri, 07 Jul 2006 10:27:04 +0000
Subject: [KJ] [PATCH] drivers/block/DAC960.c: Add KERN_* to printk statements
Message-Id: <20060707124512.GA10521@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add KERN_* to printk statements

Signed-off-by: Richard van Berkum <h.vanberkum at chello.nl>

---

It's a bit hard to track if there are any linefeeds at the end of the
printk statements. It's possible that the linefeeds are in the @Buffer
variable. I don't know.


 drivers/block/DAC960.c |   25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

--- linux-2.6/drivers/block/DAC960.c	2006-07-06 16:58:04.648478872 +0200
+++ mytree/drivers/block/DAC960.c	2006-07-07 14:39:49.039510632 +0200
@@ -2519,7 +2519,7 @@ static boolean DAC960_RegisterBlockDevic
 	/* for now, let all request queues share controller's lock */
   	RequestQueue = blk_init_queue(DAC960_RequestFunction,&Controller->queue_lock);
   	if (!RequestQueue) {
-		printk("DAC960: failure to allocate request queue\n");
+		printk(KERN_INFO "DAC960: failure to allocate request queue\n");
 		continue;
   	}
   	Controller->RequestQueue[n] = RequestQueue;
@@ -3590,7 +3590,7 @@ static void DAC960_V1_ProcessCompletedCo
 
 #ifdef FORCE_RETRY_FAILURE_DEBUG
       if (!(++retry_count % 10000)) {
-	      printk("V1 error retry failure test\n");
+	      printk(KERN_DEBUG "V1 error retry failure test\n");
 	      normal_completion = false;
               DAC960_V1_ReadWriteError(Command);
       }
@@ -4678,7 +4678,7 @@ static void DAC960_V2_ProcessCompletedCo
 
 #ifdef FORCE_RETRY_FAILURE_DEBUG
       if (!(++retry_count % 10000)) {
-	      printk("V2 error retry failure test\n");
+	      printk(KERN_DEBUG "V2 error retry failure test\n");
 	      normal_completion = false;
 	      DAC960_V2_ReadWriteError(Command);
       }
@@ -5759,7 +5759,7 @@ static void DAC960_Message(DAC960_Messag
   Length = vsprintf(Buffer, Format, Arguments);
   va_end(Arguments);
   if (Controller = NULL)
-    printk("%sDAC960#%d: %s", DAC960_MessageLevelMap[MessageLevel],
+    printk(KERN_INFO "%sDAC960#%d: %s\n", DAC960_MessageLevelMap[MessageLevel],
 	   DAC960_ControllerCount, Buffer);
   else if (MessageLevel = DAC960_AnnounceLevel ||
 	   MessageLevel = DAC960_InfoLevel)
@@ -5780,7 +5780,7 @@ static void DAC960_Message(DAC960_Messag
 	    {
 	      static int AnnouncementLines = 0;
 	      if (++AnnouncementLines <= 2)
-		printk("%sDAC960: %s", DAC960_MessageLevelMap[MessageLevel],
+		printk(KERN_INFO "%sDAC960: %s\n", DAC960_MessageLevelMap[MessageLevel],
 		       Buffer);
 	    }
 	  else
@@ -5788,11 +5788,11 @@ static void DAC960_Message(DAC960_Messag
 	      if (BeginningOfLine)
 		{
 		  if (Buffer[0] != '\n' || Length > 1)
-		    printk("%sDAC960#%d: %s",
+		    printk(KERN_INFO "%sDAC960#%d: %s\n",
 			   DAC960_MessageLevelMap[MessageLevel],
 			   Controller->ControllerNumber, Buffer);
 		}
-	      else printk("%s", Buffer);
+	      else printk(KERN_INFO "%s\n", Buffer);
 	    }
 	}
       else if (DAC960_CheckStatusBuffer(Controller, Length))
@@ -5811,12 +5811,12 @@ static void DAC960_Message(DAC960_Messag
 	  if (time_after_eq(jiffies, Controller->LastProgressReportTime
 	      + DAC960_ProgressReportingInterval))
 	    {
-	      printk("%sDAC960#%d: %s", DAC960_MessageLevelMap[MessageLevel],
+	      printk(KERN_INFO "%sDAC960#%d: %s\n", DAC960_MessageLevelMap[MessageLevel],
 		     Controller->ControllerNumber, Buffer);
 	      Controller->LastProgressReportTime = jiffies;
 	    }
 	}
-      else printk("%sDAC960#%d: %s", DAC960_MessageLevelMap[MessageLevel],
+      else printk(KERN_INFO "%sDAC960#%d: %s\n", DAC960_MessageLevelMap[MessageLevel],
 		  Controller->ControllerNumber, Buffer);
     }
   else if (MessageLevel = DAC960_UserCriticalLevel)
@@ -5825,16 +5825,17 @@ static void DAC960_Message(DAC960_Messag
 	     Buffer);
       Controller->UserStatusLength += Length;
       if (Buffer[0] != '\n' || Length > 1)
-	printk("%sDAC960#%d: %s", DAC960_MessageLevelMap[MessageLevel],
+	printk(KERN_INFO "%sDAC960#%d: %s\n", DAC960_MessageLevelMap[MessageLevel],
 	       Controller->ControllerNumber, Buffer);
     }
   else
     {
       if (BeginningOfLine)
-	printk("%sDAC960#%d: %s", DAC960_MessageLevelMap[MessageLevel],
+	printk(KERN_INFO "%sDAC960#%d: %s\n", DAC960_MessageLevelMap[MessageLevel],
 	       Controller->ControllerNumber, Buffer);
-      else printk("%s", Buffer);
+      else printk(KERN_INFO "%s\n", Buffer);
     }
+  
   BeginningOfLine = (Buffer[Length-1] = '\n');
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
