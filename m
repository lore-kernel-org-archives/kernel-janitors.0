From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:30:13 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - smp.h - compiler cleanup
Message-Id: <200402130830.13297.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_lFNLAlZrA0jOPgR"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_lFNLAlZrA0jOPgR
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_lFNLAlZrA0jOPgR
Content-Type: text/x-diff;
  charset="us-ascii";
  name="smp.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="smp.h.diff"

--- linux-2.6.2.orig/include/linux/smp.h	2004-02-03 22:43:56.000000000 -0500
+++ linux-2.6.2/include/linux/smp.h	2004-02-13 07:59:51.000000000 -0500
@@ -101,7 +101,7 @@
 #define smp_threads_ready			1
 #define smp_call_function(func,info,retry,wait)	({ 0; })
 #define on_each_cpu(func,info,retry,wait)	({ func(info); 0; })
-static inline void smp_send_reschedule(int cpu) { }
+static inline void smp_send_reschedule(int cpu) { cpu = cpu; }
 #define num_booting_cpus()			1
 #define smp_prepare_boot_cpu()			do {} while (0)
 

--Boundary-00=_lFNLAlZrA0jOPgR
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_lFNLAlZrA0jOPgR--
