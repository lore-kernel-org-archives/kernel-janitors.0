From: "Jaco Kroon" <jaco@kroon.co.za>
Date: Fri, 02 Dec 2005 09:39:01 +0000
Subject: [KJ] [patch] potential data-corruption fix in md.c
Message-Id: <8378.192.96.150.57.1133516341.squirrel@mail.interexcel.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix a check whereby a negative personality number passed to either
register_md_personality or unregister_md_personality could potentially
cause data corruption.

Signed off:  Jaco Kroon <jaco@kroon.co.za>

--- linux-2.6.14/drivers/md/md.c.orig	2005-12-02 11:31:59.000000000 +0200
+++ linux-2.6.14/drivers/md/md.c	2005-12-02 11:32:37.000000000 +0200
@@ -3425,7 +3425,7 @@

 int register_md_personality(int pnum, mdk_personality_t *p)
 {
-	if (pnum >= MAX_PERSONALITY) {
+	if (pnum < 0 || pnum >= MAX_PERSONALITY) {
 		printk(KERN_ERR
 		       "md: tried to install personality %s as nr %d, but max is %lu\n",
 		       p->name, pnum, MAX_PERSONALITY-1);
@@ -3446,7 +3446,7 @@

 int unregister_md_personality(int pnum)
 {
-	if (pnum >= MAX_PERSONALITY)
+	if (pnum < 0 || pnum >= MAX_PERSONALITY)
 		return -EINVAL;

 	printk(KERN_INFO "md: %s personality unregistered\n", pers[pnum]->name);

-- 
There are 10 kinds of people in the world, those who understand binary,
and those who don't.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
