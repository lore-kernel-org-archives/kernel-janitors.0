From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:33:48 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - proc_fs.h - compiler cleanup
Message-Id: <200402130833.48091.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_8INLAmxY8/5JzxH"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_8INLAmxY8/5JzxH
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings.
-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_8INLAmxY8/5JzxH
Content-Type: text/x-diff;
  charset="us-ascii";
  name="proc_fs.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="proc_fs.h.diff"

--- linux-2.6.2.orig/include/linux/proc_fs.h	2004-02-03 22:45:13.000000000 -0500
+++ linux-2.6.2/include/linux/proc_fs.h	2004-02-13 08:03:31.000000000 -0500
@@ -138,6 +138,8 @@
 #else /* !CONFIG_PROC_DEVICETREE */
 static inline void proc_device_tree_add_node(struct device_node *np, struct proc_dir_entry *pde)
 {
+	np = np;
+	pde = pde;
 	return;
 }
 #endif /* CONFIG_PROC_DEVICETREE */

--Boundary-00=_8INLAmxY8/5JzxH
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_8INLAmxY8/5JzxH--
