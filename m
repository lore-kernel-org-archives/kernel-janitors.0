From: Ron Gage <ron@rongage.org>
Date: Sun, 15 Feb 2004 03:45:01 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - scripts/fixdep.c -
Message-Id: <200402142245.01586.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_9suLAAL2Ew3Gxxl"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402142244.04007.ron@rongage.org>
In-Reply-To: <200402142244.04007.ron@rongage.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_9suLAAL2Ew3Gxxl
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Fixes signed/unsigned comparison warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_9suLAAL2Ew3Gxxl
Content-Type: text/x-diff;
  charset="us-ascii";
  name="scripts_fixdep.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="scripts_fixdep.diff"

--- linux-2.6.2.orig/scripts/fixdep.c	2004-02-03 22:43:47.000000000 -0500
+++ linux-2.6.2/scripts/fixdep.c	2004-02-14 22:28:22.000000000 -0500
@@ -213,7 +213,7 @@
 {
 	int *end = (int *) (map + len);
 	/* start at +1, so that p can never be < map */
-	int *m   = (int *) map + 1;
+	unsigned int *m   = (int *) map + 1;
 	char *p, *q;
 
 	for (; m < end; m++) {
@@ -356,7 +356,7 @@
 {
 	static char test[] __attribute__((aligned(sizeof(int)))) = "CONF";
 
-	if (*(int *)test != INT_CONF) {
+	if (*(unsigned int *)test != INT_CONF) {
 		fprintf(stderr, "fixdep: sizeof(int) != 4 or wrong endianess? %#x\n",
 			*(int *)test);
 		exit(2);

--Boundary-00=_9suLAAL2Ew3Gxxl
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_9suLAAL2Ew3Gxxl--
