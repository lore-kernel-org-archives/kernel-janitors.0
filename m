From: Ron Gage <ron@rongage.org>
Date: Sun, 15 Feb 2004 03:46:32 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 -scripts/modpost.c -
Message-Id: <200402142246.32092.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_YuuLA/K51HKjZXF"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_YuuLA/K51HKjZXF
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Fixes signed/unsigned comparison warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_YuuLA/K51HKjZXF
Content-Type: text/x-diff; charset="us-ascii"; name="scripts_modpost.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="scripts_modpost.diff"

--- linux-2.6.2.orig/scripts/modpost.c	2004-02-03 22:43:16.000000000 -0500
+++ linux-2.6.2/scripts/modpost.c	2004-02-14 22:39:04.000000000 -0500
@@ -514,7 +514,7 @@
 		goto close_write;
 
 	tmp = NOFAIL(malloc(b->pos));
-	if (fread(tmp, 1, b->pos, file) != b->pos)
+	if (fread(tmp, 1, b->pos, file) != (unsigned)b->pos)
 		goto free_write;
 
 	if (memcmp(tmp, b->p, b->pos) != 0)
@@ -534,7 +534,7 @@
 		perror(fname);
 		exit(1);
 	}
-	if (fwrite(b->p, 1, b->pos, file) != b->pos) {
+	if (fwrite(b->p, 1, b->pos, file) != (unsigned)b->pos) {
 		perror(fname);
 		exit(1);
 	}

--Boundary-00=_YuuLA/K51HKjZXF
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_YuuLA/K51HKjZXF--
