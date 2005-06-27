From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 27 Jun 2005 16:34:05 +0000
Subject: [KJ] [PATCH] include/net/slhc_vj.h: remove __ARGS
Message-Id: <200506272034.06157.adobriyan@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28087544432966327=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28087544432966327==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I suspect "#define __ARGS(x) ()" was deprecated before I was born.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

--- linux-vanilla/include/net/slhc_vj.h	2005-06-27 09:32:49.000000000 +0400
+++ linux-slhc_vj/include/net/slhc_vj.h	2005-06-27 20:22:34.000000000 +0400
@@ -170,19 +170,14 @@ struct slcompress {
 };
 #define NULLSLCOMPR	(struct slcompress *)0
 
-#define __ARGS(x) x
-
 /* In slhc.c: */
-struct slcompress *slhc_init __ARGS((int rslots, int tslots));
-void slhc_free __ARGS((struct slcompress *comp));
+struct slcompress *slhc_init(int rslots, int tslots);
+void slhc_free(struct slcompress *comp);
 
-int slhc_compress __ARGS((struct slcompress *comp, unsigned char *icp,
-			  int isize, unsigned char *ocp, unsigned char **cpp,
-			  int compress_cid));
-int slhc_uncompress __ARGS((struct slcompress *comp, unsigned char *icp,
-			    int isize));
-int slhc_remember __ARGS((struct slcompress *comp, unsigned char *icp,
-			  int isize));
-int slhc_toss __ARGS((struct slcompress *comp));
+int slhc_compress(struct slcompress *comp, unsigned char *icp, int isize,
+		  unsigned char *ocp, unsigned char **cpp, int compress_cid);
+int slhc_uncompress(struct slcompress *comp, unsigned char *icp, int isize);
+int slhc_remember(struct slcompress *comp, unsigned char *icp, int isize);
+int slhc_toss(struct slcompress *comp);
 
 #endif	/* _SLHC_H */

--===============28087544432966327==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28087544432966327==--
