From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 16 Mar 2005 10:24:44 +0000
Subject: [KJ] [PATCH] printk : arch/ia64/kernel/smp.c
Message-Id: <20050316102444.GC17405@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="SkvwRMAIpAhPCcCJ"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
printk() calls should include appropriate KERN_* constant.

Have a nice day,

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-printk-linux-2.6.11_arch_ia64_kernel_smp.c.diff"

diff -urpN -X dontdiff linux-2.6.11-vanilla/arch/ia64/kernel/smp.c linux-2.6.11/arch/ia64/kernel/smp.c
--- linux-2.6.11-vanilla/arch/ia64/kernel/smp.c	2005-03-02 08:38:33.000000000 +0100
+++ linux-2.6.11/arch/ia64/kernel/smp.c	2005-03-16 10:56:25.000000000 +0100
@@ -270,7 +270,7 @@ smp_call_function_single (int cpuid, voi
 	int me = get_cpu(); /* prevent preemption and reschedule on another processor */
 
 	if (cpuid == me) {
-		printk("%s: trying to call self\n", __FUNCTION__);
+		printk(KERN_INFO "%s: trying to call self\n", __FUNCTION__);
 		put_cpu();
 		return -EBUSY;
 	}

--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--SkvwRMAIpAhPCcCJ--
