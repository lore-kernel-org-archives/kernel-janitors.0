From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 22:38:39 +0000
Subject: [Kernel-janitors] [PATCH] isdn/act2000_isa: replace
Message-Id: <20040722223839.GW2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46222962041318993=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46222962041318993==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace act2000_isa_delay() with msleep() and remove
act2000_isa_delay() definition.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-vanilla/drivers/isdn/act2000/act2000_isa.c	2004-06-16 05:19:17.000000000 +0000
+++ linux-dev/drivers/isdn/act2000/act2000_isa.c	2004-07-08 23:30:56.000000000 +0000
@@ -18,13 +18,6 @@
 
 static act2000_card *irq2card_map[16];
 
-static void
-act2000_isa_delay(long t)
-{
-        set_current_state(TASK_INTERRUPTIBLE);
-        schedule_timeout(t);
-}
-
 /*
  * Reset Controller, then try to read the Card's signature.
  + Return:
@@ -419,7 +412,7 @@ act2000_isa_download(act2000_card * card
 
         if (!act2000_isa_reset(card->port))
                 return -ENXIO;
-        act2000_isa_delay(HZ / 2);
+        msleep(500);
         if(copy_from_user(&cblock, (char *) cb, sizeof(cblock)))
         	return -EFAULT;
         length = cblock.length;
@@ -449,6 +442,6 @@ act2000_isa_download(act2000_card * card
                 p += l;
         }
         kfree(buf);
-        act2000_isa_delay(HZ / 2);
+        msleep(500);
         return (act2000_isa_getid(card));
 }

--===============46222962041318993==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46222962041318993==--
