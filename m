From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:02:21 +0000
Subject: [KJ] [PATCH] security/selinux/ss/avtab.c: fix sparse warnings
Message-Id: <200503100151.41817.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53135028754520786=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============53135028754520786==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/security/selinux/ss/avtab.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/security/selinux/ss/avtab.c	2005-03-08 13:14:37.000000000 +0200
+++ linux-2.6.11-bk3-sparse/security/selinux/ss/avtab.c	2005-03-08 13:15:49.000000000 +0200
@@ -303,7 +303,7 @@ void avtab_hash_eval(struct avtab *h, ch
 
 int avtab_read_item(void *fp, struct avtab_datum *avdatum, struct avtab_key *avkey)
 {
-	u32 buf[7];
+	__le32 buf[7];
 	u32 items, items2;
 	int rc;
 
@@ -370,7 +370,7 @@ int avtab_read(struct avtab *a, void *fp
 	int rc;
 	struct avtab_key avkey;
 	struct avtab_datum avdatum;
-	u32 buf[1];
+	__le32 buf[1];
 	u32 nel, i;
 
 

--===============53135028754520786==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53135028754520786==--
