From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:33 +0000
Subject: [KJ] [PATCH] [RESEND] [1/29] isdn_bsdcomp.c - vfree() checking
Message-Id: <auto-000001227478@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60806674450379483=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60806674450379483==

isdn_bsdcomp.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 isdn_bsdcomp.c |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)


--- linux-2.6.10-vanilla/drivers/isdn/i4l/isdn_bsdcomp.c	2004-12-24 13:35:25.000000000 -0800
+++ linux-2.6.10/drivers/isdn/i4l/isdn_bsdcomp.c	2005-01-04 11:31:35.000000000 -0800
@@ -283,18 +283,14 @@
 		/*
 		 * Release the dictionary
 		 */
-		if (db->dict) {
-			vfree (db->dict);
-			db->dict = NULL;
-		}
+		vfree (db->dict);
+		db->dict = NULL;
 
 		/*
 		 * Release the string buffer
 		 */
-		if (db->lens) {
-			vfree (db->lens);
-			db->lens = NULL;
-		}
+		vfree (db->lens);
+		db->lens = NULL;
 
 		/*
 		 * Finally release the structure itself.


--===============60806674450379483==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60806674450379483==--
