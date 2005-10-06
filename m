From: "Milind A Choudhary\(Patni\)" <milind.choudhary@patni.com>
Date: Thu, 06 Oct 2005 12:53:58 +0000
Subject: [KJ] [PATCH] printk : kernel/timer.c
Message-Id: <034501c5ca73$578941b0$5f051aac@pcp42831>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_NextPart_000_0346_01C5CAA1.71417DB0"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

------=_NextPart_000_0346_01C5CAA1.71417DB0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Milind A Choudhary <milind.choudhary@patni.com>

The patch
Index: linux-2.6.14-rc3/kernel/timer.c
===================================================================
--- linux-2.6.14-rc3.orig/kernel/timer.c	2005-10-06 15:30:37.000000000 +0530
+++ linux-2.6.14-rc3/kernel/timer.c	2005-10-06 17:22:49.000000000 +0530
@@ -96,9 +96,9 @@ static void check_timer_failed(struct ti
 	static int whine_count;
 	if (whine_count < 16) {
 		whine_count++;
-		printk("Uninitialised timer!\n");
-		printk("This is just a warning.  Your computer is OK\n");
-		printk("function=0x%p, data=0x%lx\n",
+		printk(KERN_WARNING "Uninitialised timer!\n");
+		printk(KERN_WARNING "This is just a warning.  Your computer is OK\n");
+		printk(KERN_WARNING "function=0x%p, data=0x%lx\n",
 			timer->function, timer->data);
 		dump_stack();
 	}

PS:: I've attached the patch file  if this fails...

Thanks & Regards
Milind A Choudhary

http://www.patni.com
World-Wide Partnerships. World-Class Solutions.
_____________________________________________________________________

This e-mail message may contain proprietary, confidential or legally
privileged information for the sole use of the person or entity to
whom this message was originally addressed. Any review, e-transmission
dissemination or other use of or taking of any action in reliance upon
this information by persons or entities other than the intended
recipient is prohibited. If you have received this e-mail in error
kindly delete  this e-mail from your records. If it appears that this
mail has been forwarded to you without proper authority, please notify
us immediately at netadmin@patni.com and delete this mail. 
_____________________________________________________________________

------=_NextPart_000_0346_01C5CAA1.71417DB0
Content-Type: application/octet-stream;
	name="kernel_timer_printk.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="kernel_timer_printk.patch"

--- linux-2.6.14-rc3.orig/kernel/timer.c	2005-10-06 15:30:37.000000000 +0530
+++ linux-2.6.14-rc3/kernel/timer.c	2005-10-06 17:22:49.000000000 +0530
@@ -96,9 +96,9 @@ static void check_timer_failed(struct ti
 	static int whine_count;
 	if (whine_count < 16) {
 		whine_count++;
-		printk("Uninitialised timer!\n");
-		printk("This is just a warning.  Your computer is OK\n");
-		printk("function=3D0x%p, data=3D0x%lx\n",
+		printk(KERN_WARNING "Uninitialised timer!\n");
+		printk(KERN_WARNING "This is just a warning.  Your computer is OK\n");
+		printk(KERN_WARNING "function=3D0x%p, data=3D0x%lx\n",
 			timer->function, timer->data);
 		dump_stack();
 	}

------=_NextPart_000_0346_01C5CAA1.71417DB0
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

------=_NextPart_000_0346_01C5CAA1.71417DB0--
