From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:31:56 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - percpu.h - compiler cleanup
Message-Id: <200402130831.56361.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_MHNLA8mvE7xvKGB"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_MHNLA8mvE7xvKGB
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_MHNLA8mvE7xvKGB
Content-Type: text/x-diff;
  charset="us-ascii";
  name="percpu.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="percpu.h.diff"

--- linux-2.6.2.orig/include/linux/percpu.h	2004-02-03 22:44:37.000000000 -0500
+++ linux-2.6.2/include/linux/percpu.h	2004-02-13 08:01:32.000000000 -0500
@@ -44,6 +44,7 @@
 static inline void *__alloc_percpu(size_t size, size_t align)
 {
 	void *ret = kmalloc(size, GFP_KERNEL);
+	align = align;
 	if (ret)
 		memset(ret, 0, size);
 	return ret;

--Boundary-00=_MHNLA8mvE7xvKGB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_MHNLA8mvE7xvKGB--
