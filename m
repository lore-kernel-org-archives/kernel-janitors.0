From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:39:56 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - cpu.h - compiler cleanup
Message-Id: <200402130839.56690.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_sONLAChG5FVQqRE"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_sONLAChG5FVQqRE
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_sONLAChG5FVQqRE
Content-Type: text/x-diff;
  charset="us-ascii";
  name="cpu.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="cpu.h.diff"

--- linux-2.6.2.orig/include/linux/cpu.h	2004-02-03 22:43:17.000000000 -0500
+++ linux-2.6.2/include/linux/cpu.h	2004-02-13 08:12:43.000000000 -0500
@@ -45,10 +45,12 @@
 
 static inline int register_cpu_notifier(struct notifier_block *nb)
 {
+	nb = nb;
 	return 0;
 }
 static inline void unregister_cpu_notifier(struct notifier_block *nb)
 {
+	nb = nb;
 }
 
 #define lock_cpu_hotplug()	do { } while (0)

--Boundary-00=_sONLAChG5FVQqRE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_sONLAChG5FVQqRE--
