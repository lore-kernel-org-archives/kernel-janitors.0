From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 16:47:27 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/15] isdn/act2000_isa: replace
Message-Id: <20040917164727.GB1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77652393513576579=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============77652393513576579==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5.

Description: Uses msleep_interruptible() in place of
act2000_isa_delay() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/act2000/act2000_isa.c	2004-09-13 17:16:04.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/act2000/act2000_isa.c	2004-09-14 11:27:07.000000000 -0700
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
+        msleep_interruptible(500);
         if(copy_from_user(&cblock, cb, sizeof(cblock)))
         	return -EFAULT;
         length = cblock.length;
@@ -449,6 +442,6 @@ act2000_isa_download(act2000_card * card
                 p += l;
         }
         kfree(buf);
-        act2000_isa_delay(HZ / 2);
+        msleep_interruptible(500);
         return (act2000_isa_getid(card));
 }

--===============77652393513576579==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77652393513576579==--
