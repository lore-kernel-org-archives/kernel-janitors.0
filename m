From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:32:52 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - kdev_t.h - compiler cleanup
Message-Id: <200402130832.52096.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_EINLAhvjfPp9Up0"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_EINLAhvjfPp9Up0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_EINLAhvjfPp9Up0
Content-Type: text/x-diff;
  charset="us-ascii";
  name="kdev_t.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kdev_t.h.diff"

--- linux-2.6.2.orig/include/linux/kdev_t.h	2004-02-03 22:44:21.000000000 -0500
+++ linux-2.6.2/include/linux/kdev_t.h	2004-02-13 08:02:50.000000000 -0500
@@ -35,6 +35,7 @@
 
 static inline int new_valid_dev(dev_t dev)
 {
+	dev = dev;
 	return 1;
 }
 
@@ -54,6 +55,7 @@
 
 static inline int huge_valid_dev(dev_t dev)
 {
+	dev = dev;
 	return 1;
 }
 

--Boundary-00=_EINLAhvjfPp9Up0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_EINLAhvjfPp9Up0--
