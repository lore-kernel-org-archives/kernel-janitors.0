From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:36:40 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - skbuff.h - compiler cleanup
Message-Id: <200402130836.40521.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_oLNLA551Ir2M5QX"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_oLNLA551Ir2M5QX
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_oLNLA551Ir2M5QX
Content-Type: text/x-diff;
  charset="us-ascii";
  name="skbuff.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="skbuff.h.diff"

--- linux-2.6.2.orig/include/linux/skbuff.h	2004-02-03 22:43:56.000000000 -0500
+++ linux-2.6.2/include/linux/skbuff.h	2004-02-13 08:10:47.000000000 -0500
@@ -1149,6 +1149,7 @@
 
 static inline void kunmap_skb_frag(void *vaddr)
 {
+	vaddr = vaddr;
 	kunmap_atomic(vaddr, KM_SKB_DATA_SOFTIRQ);
 #ifdef CONFIG_HIGHMEM
 	local_bh_enable();

--Boundary-00=_oLNLA551Ir2M5QX
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_oLNLA551Ir2M5QX--
