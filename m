From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:03:52 +0000
Subject: [KJ] [PATCH] security/selinux/ss/ebitmap.c: fix sparse warnings
Message-Id: <200503100151.34925.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79673682377101662=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============79673682377101662==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/security/selinux/ss/ebitmap.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/security/selinux/ss/ebitmap.c	2005-03-02 09:38:38.000000000 +0200
+++ linux-2.6.11-bk3-sparse/security/selinux/ss/ebitmap.c	2005-03-08 13:12:02.000000000 +0200
@@ -239,8 +239,9 @@ int ebitmap_read(struct ebitmap *e, void
 {
 	int rc;
 	struct ebitmap_node *n, *l;
-	u32 buf[3], mapsize, count, i;
-	u64 map;
+	__le32 buf[3];
+	u32 mapsize, count, i;
+	__le64 map;
 
 	ebitmap_init(e);
 

--===============79673682377101662==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79673682377101662==--
