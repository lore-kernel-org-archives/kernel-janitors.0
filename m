From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:38:26 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - profile.h - compiler cleanup
Message-Id: <200402130838.26346.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_SNNLAsdtOT2FdUQ"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_SNNLAsdtOT2FdUQ
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_SNNLAsdtOT2FdUQ
Content-Type: text/x-diff;
  charset="us-ascii";
  name="profile.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="profile.h.diff"

--- linux-2.6.2.orig/include/linux/profile.h	2004-02-03 22:43:46.000000000 -0500
+++ linux-2.6.2/include/linux/profile.h	2004-02-13 08:12:04.000000000 -0500
@@ -57,11 +57,15 @@
 
 static inline int profile_event_register(enum profile_type t, struct notifier_block * n)
 {
+	t = t;
+	n = n;
 	return -ENOSYS;
 }
 
 static inline int profile_event_unregister(enum profile_type t, struct notifier_block * n)
 {
+	t = t;
+	n = n;
 	return -ENOSYS;
 }
 
@@ -71,11 +75,13 @@
 
 static inline int register_profile_notifier(struct notifier_block * nb)
 {
+	nb = nb;
 	return -ENOSYS;
 }
 
 static inline int unregister_profile_notifier(struct notifier_block * nb)
 {
+	nb = nb;
 	return -ENOSYS;
 }
 

--Boundary-00=_SNNLAsdtOT2FdUQ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_SNNLAsdtOT2FdUQ--
