From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:56:39 +0000
Subject: [KJ] [PATCH] [1/29] isdn_bsdcomp.c - vfree() checking cleanups
Message-Id: <41db1117.7dc74fa8.2568.07aa@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42769270274837101=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42769270274837101==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

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
-			db->dict -		}
+		vfree (db->dict);
+		db->dict  
 		/*
 		 * Release the string buffer
 		 */
-		if (db->lens) {
-			vfree (db->lens);
-			db->lens -		}
+		vfree (db->lens);
+		db->lens  
 		/*
 		 * Finally release the structure itself.



--===============42769270274837101==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42769270274837101==--
