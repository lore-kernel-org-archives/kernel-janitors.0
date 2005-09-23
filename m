From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 23 Sep 2005 08:47:25 +0000
Subject: [KJ] printk : arch/alpha/kernel/ptrace.c
Message-Id: <20050923084725.GE10553@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89686602397060633=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89686602397060633==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.14-rc2/arch/alpha/kernel/ptrace.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/ptrace.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/ptrace.c
@@ -232,7 +232,7 @@ ptrace_cancel_bpt(struct task_struct * c
 	child->thread_info->bpt_nsaved = 0;
 
 	if (nsaved > 2) {
-		printk("ptrace_cancel_bpt: bogus nsaved: %d!\n", nsaved);
+		printk(KERN_ERR "ptrace_cancel_bpt: bogus nsaved: %d!\n", nsaved);
 		nsaved = 2;
 	}
 


--===============89686602397060633==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89686602397060633==--
