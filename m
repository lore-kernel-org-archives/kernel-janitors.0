From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:27:12 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - bugs.h - compiler cleanups
Message-Id: <200402130827.12490.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_wCNLA5RBMnlM6lx"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_wCNLA5RBMnlM6lx
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_wCNLA5RBMnlM6lx
Content-Type: text/x-diff;
  charset="us-ascii";
  name="bugs.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="bugs.h.diff"

--- linux-2.6.2.orig/include/asm-i386/bugs.h	2004-02-03 22:43:15.000000000 -0500
+++ linux-2.6.2/include/asm-i386/bugs.h	2004-02-13 07:56:52.000000000 -0500
@@ -28,6 +28,7 @@
 
 static int __init no_halt(char *s)
 {
+	s = s;
 	boot_cpu_data.hlt_works_ok = 0;
 	return 1;
 }
@@ -36,6 +37,7 @@
 
 static int __init mca_pentium(char *s)
 {
+	s = s;
 	mca_pentium_flag = 1;
 	return 1;
 }
@@ -44,6 +46,7 @@
 
 static int __init no_387(char *s)
 {
+	s = s;
 	boot_cpu_data.hard_math = 0;
 	write_cr0(0xE | read_cr0());
 	return 1;

--Boundary-00=_wCNLA5RBMnlM6lx
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_wCNLA5RBMnlM6lx--
