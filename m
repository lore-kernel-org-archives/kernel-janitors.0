From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 01 Sep 2004 22:36:23 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc1-bk7] isdn/act2000_isa: remove
Message-Id: <20040901223623.GF2516@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56434765444338209=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040901222224.GD2516@us.ibm.com>
In-Reply-To: <20040901222224.GD2516@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============56434765444338209==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is one of 10 patches which have either not been pushed to mainline
(2.6.9-rc1-bk7) or have not been included in any of the recent kjt's.

Applys-to: 2.6.9-rc1-bk7

Description: Removes isa_delay() and replaces invocations thereof with
appropriate calls to msleep() to guarantee the task delays as requested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc1-bk7-vanilla/drivers/isdn/act2000/act2000_isa.c	2004-08-31 21:26:46.000000000 +0000
+++ 2.6.9-rc1-bk7-dev/drivers/isdn/act2000/act2000_isa.c	2004-09-01 22:11:37.000000000 +0000
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
         if(copy_from_user(&cblock, cb, sizeof(cblock)))
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

--===============56434765444338209==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56434765444338209==--
