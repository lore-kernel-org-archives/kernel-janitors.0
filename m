From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Thu, 09 Feb 2006 13:36:54 +0000
Subject: [KJ][Patch] Remove second masking instance of variable i from
Message-Id: <1139492214.17930.41.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42642424020863334=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42642424020863334==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

from http://linuxicc.sourceforge.net/

Remark #1599: Declaration hides variable "variable name"

unsigned int __cpuinit init_intel_cacheinfo(struct cpuinfo_x86 *c)

seems to have declared 
174: "unsigned int new_l2 = 0, new_l3 = 0, i;"
then 
219: "int i, j, n;" 
Which masks the earlier "i" variable (weird code but this seems right).

"i" seems to be only used as a positive value (as a loop counter), so
"unsigned int" seems ok for the second bit too. 

The patch below just removes the second declaration.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc2/arch/i386/kernel/cpu/intel_cacheinfo.c.orig	2006-02-09 23:52:25.000000000 +1100
+++ linux-2.6.16-rc2/arch/i386/kernel/cpu/intel_cacheinfo.c	2006-02-09 23:55:24.000000000 +1100
@@ -216,7 +216,7 @@ unsigned int __cpuinit init_intel_cachei
 	}
 	if (c->cpuid_level > 1) {
 		/* supports eax=2  call */
-		int i, j, n;
+		int j, n;
 		int regs[4];
 		unsigned char *dp = (unsigned char *)regs;
 



--===============42642424020863334==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42642424020863334==--
