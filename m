From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 13:28:13 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - timex.h - compiler cleanup
Message-Id: <200402130828.13699.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_tDNLA4nCg6j5191"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_tDNLA4nCg6j5191
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_tDNLA4nCg6j5191
Content-Type: text/x-diff;
  charset="us-ascii";
  name="timex.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="timex.h.diff"

--- linux-2.6.2.orig/include/linux/timex.h	2004-02-03 22:43:07.000000000 -0500
+++ linux-2.6.2/include/linux/timex.h	2004-02-13 07:57:55.000000000 -0500
@@ -402,6 +402,7 @@
 static inline void
 time_interpolator_update(long delta_nsec)
 {
+delta_nsec = delta_nsec;
 }
 
 static inline void

--Boundary-00=_tDNLA4nCg6j5191
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_tDNLA4nCg6j5191--
