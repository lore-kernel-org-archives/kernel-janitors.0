From: "Milind A Choudhary\(Patni\)" <milind.choudhary@patni.com>
Date: Fri, 07 Oct 2005 05:46:12 +0000
Subject: [KJ] [PATCH] printk : kernel/softirq.c
Message-Id: <03ca01c5cb00$c020f0f0$5f051aac@pcp42831>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_NextPart_000_03CB_01C5CB2E.D9D92CF0"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

------=_NextPart_000_03CB_01C5CB2E.D9D92CF0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Milind A Choudhary <milind.choudhary@patni.com>

The patch
Index: linux-2.6.14-rc3/kernel/softirq.c
===================================================================
--- linux-2.6.14-rc3.orig/kernel/softirq.c	2005-10-06 15:30:37.000000000 +0530
+++ linux-2.6.14-rc3/kernel/softirq.c	2005-10-06 18:59:24.000000000 +0530
@@ -328,7 +328,7 @@ EXPORT_SYMBOL(tasklet_init);
 void tasklet_kill(struct tasklet_struct *t)
 {
 	if (in_interrupt())
-		printk("Attempt to kill tasklet from interrupt\n");
+		printk(KERN_ERR "Attempt to kill tasklet from interrupt\n");
 
 	while (test_and_set_bit(TASKLET_STATE_SCHED, &t->state)) {
 		do
@@ -458,7 +458,7 @@ static int __devinit cpu_callback(struct
 		BUG_ON(per_cpu(tasklet_hi_vec, hotcpu).list);
 		p = kthread_create(ksoftirqd, hcpu, "ksoftirqd/%d", hotcpu);
 		if (IS_ERR(p)) {
-			printk("ksoftirqd for %i failed\n", hotcpu);
+			printk(KERN_ERR "ksoftirqd for %i failed\n", hotcpu);
 			return NOTIFY_BAD;
 		}
 		kthread_bind(p, hotcpu);

===================================================================
apologies for the disclaimer...I'll fix it soon..
how do I come to know whether my patches are being accepted?
kindly let me know..

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

------=_NextPart_000_03CB_01C5CB2E.D9D92CF0
Content-Type: application/octet-stream;
	name="kernel_softirq_printk.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="kernel_softirq_printk.patch"

--- linux-2.6.14-rc3.orig/kernel/softirq.c	2005-10-06 15:30:37.000000000 +0=
530
+++ linux-2.6.14-rc3/kernel/softirq.c	2005-10-06 18:59:24.000000000 +0530
@@ -328,7 +328,7 @@ EXPORT_SYMBOL(tasklet_init);
 void tasklet_kill(struct tasklet_struct *t)
 {
 	if (in_interrupt())
-		printk("Attempt to kill tasklet from interrupt\n");
+		printk(KERN_ERR "Attempt to kill tasklet from interrupt\n");
=20
 	while (test_and_set_bit(TASKLET_STATE_SCHED, &t->state)) {
 		do
@@ -458,7 +458,7 @@ static int __devinit cpu_callback(struct
 		BUG_ON(per_cpu(tasklet_hi_vec, hotcpu).list);
 		p =3D kthread_create(ksoftirqd, hcpu, "ksoftirqd/%d", hotcpu);
 		if (IS_ERR(p)) {
-			printk("ksoftirqd for %i failed\n", hotcpu);
+			printk(KERN_ERR "ksoftirqd for %i failed\n", hotcpu);
 			return NOTIFY_BAD;
 		}
 		kthread_bind(p, hotcpu);

------=_NextPart_000_03CB_01C5CB2E.D9D92CF0
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

------=_NextPart_000_03CB_01C5CB2E.D9D92CF0--
