From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:31:02 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - gfp.h - compiler cleanup
Message-Id: <200402130831.02628.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_WGNLA1K9LlDWmKY"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_WGNLA1K9LlDWmKY
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_WGNLA1K9LlDWmKY
Content-Type: text/x-diff;
  charset="us-ascii";
  name="gfp.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="gfp.h.diff"

--- linux-2.6.2.orig/include/linux/gfp.h	2004-02-03 22:43:20.000000000 -0500
+++ linux-2.6.2/include/linux/gfp.h	2004-02-13 08:00:32.000000000 -0500
@@ -66,6 +66,7 @@
 extern struct page * FASTCALL(__alloc_pages(unsigned int, unsigned int, struct zonelist *));
 static inline struct page * alloc_pages_node(int nid, unsigned int gfp_mask, unsigned int order)
 {
+	nid = nid;
 	if (unlikely(order >= MAX_ORDER))
 		return NULL;
 

--Boundary-00=_WGNLA1K9LlDWmKY
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_WGNLA1K9LlDWmKY--
