From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 02:47:36 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - module.h - compiler cleanups
Message-Id: <200402122147.36532.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_IrDLATQOnoHzcu6"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_IrDLATQOnoHzcu6
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch gets rid of some "parameter defined but not used" warnings from 
module.h.

Hopefully someone will find this of some (probably limited) use.  :)

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_IrDLATQOnoHzcu6
Content-Type: text/x-diff;
  charset="us-ascii";
  name="module.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="module.h.diff"

--- linux-2.6.2.orig/include/linux/module.h	2004-02-03 22:44:16.000000000 -0500
+++ linux-2.6.2/include/linux/module.h	2004-02-12 21:16:06.000000000 -0500
@@ -339,9 +339,11 @@
 }
 static inline void module_put(struct module *module)
 {
+	module = module;
 }
 static inline void __module_get(struct module *module)
 {
+	module = module;
 }
 #define symbol_put(x) do { } while(0)
 #define symbol_put_addr(p) do { } while(0)

--Boundary-00=_IrDLATQOnoHzcu6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_IrDLATQOnoHzcu6--
