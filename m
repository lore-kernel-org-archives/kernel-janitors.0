From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:35:46 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - mm.h - compiler cleanup
Message-Id: <200402130835.46022.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_yKNLAJos305o7aC"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_yKNLAJos305o7aC
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_yKNLAJos305o7aC
Content-Type: text/x-diff;
  charset="us-ascii";
  name="mm.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mm.h.diff"

--- linux-2.6.2.orig/include/linux/mm.h	2004-02-03 22:43:07.000000000 -0500
+++ linux-2.6.2/include/linux/mm.h	2004-02-13 08:08:00.000000000 -0500
@@ -639,6 +639,9 @@
 static inline void
 kernel_map_pages(struct page *page, int numpages, int enable)
 {
+	page = page;
+	numpages = numpages;
+	enable = enable;
 }
 #endif
 
@@ -646,6 +649,7 @@
 #ifdef AT_SYSINFO_EHDR
 static inline int in_gate_area(struct task_struct *task, unsigned long addr)
 {
+	task = task;
 	if ((addr >= FIXADDR_USER_START) && (addr < FIXADDR_USER_END))
 		return 1;
 	else
@@ -655,16 +659,20 @@
 extern struct vm_area_struct gate_vma;
 static inline struct vm_area_struct *get_gate_vma(struct task_struct *tsk)
 {
+	tsk = tsk;
 	return &gate_vma;
 }
 #else
 static inline int in_gate_area(struct task_struct *task, unsigned long addr)
 {
+	task = task;
+	addr = addr;
 	return 0;
 }
 
 static inline struct vm_area_struct *get_gate_vma(struct task_struct *tsk)
 {
+	tsk = tsk;
 	return NULL;
 }
 #endif

--Boundary-00=_yKNLAJos305o7aC
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_yKNLAJos305o7aC--
