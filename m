From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:29:20 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - wait.h - compiler cleanup
Message-Id: <200402130829.20144.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_wENLAizXFaO4bqh"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_wENLAizXFaO4bqh
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_wENLAizXFaO4bqh
Content-Type: text/x-diff;
  charset="us-ascii";
  name="wait.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="wait.h.diff"

--- linux-2.6.2.orig/include/linux/wait.h	2004-02-03 22:43:56.000000000 -0500
+++ linux-2.6.2/include/linux/wait.h	2004-02-13 07:59:24.000000000 -0500
@@ -101,6 +101,7 @@
 static inline void __remove_wait_queue(wait_queue_head_t *head,
 							wait_queue_t *old)
 {
+	head = head;
 	list_del(&old->task_list);
 }
 

--Boundary-00=_wENLAizXFaO4bqh
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_wENLAizXFaO4bqh--
