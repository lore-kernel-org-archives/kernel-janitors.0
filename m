From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:03:34 +0000
Subject: [KJ] [PATCH] security/selinux/ss/conditional.c: fix sparse warnings
Message-Id: <200503100152.37248.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85952163882561594=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85952163882561594==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/security/selinux/ss/conditional.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/security/selinux/ss/conditional.c	2005-03-02 09:37:49.000000000 +0200
+++ linux-2.6.11-bk3-sparse/security/selinux/ss/conditional.c	2005-03-08 14:01:04.000000000 +0200
@@ -219,7 +219,8 @@ int cond_read_bool(struct policydb *p, s
 {
 	char *key = NULL;
 	struct cond_bool_datum *booldatum;
-	u32 buf[3], len;
+	__le32 buf[3];
+	u32 len;
 	int rc;
 
 	booldatum = kmalloc(sizeof(struct cond_bool_datum), GFP_KERNEL);
@@ -263,7 +264,8 @@ static int cond_read_av_list(struct poli
 	struct avtab_datum datum;
 	struct avtab_node *node_ptr;
 	int rc;
-	u32 buf[1], i, len;
+	__le32 buf[1];
+	u32 i, len;
 	u8 found;
 
 	*ret_list = NULL;
@@ -369,7 +371,8 @@ static int expr_isvalid(struct policydb 
 
 static int cond_read_node(struct policydb *p, struct cond_node *node, void *fp)
 {
-	u32 buf[2], len, i;
+	__le32 buf[2];
+	u32 len, i;
 	int rc;
 	struct cond_expr *expr = NULL, *last = NULL;
 
@@ -427,7 +430,8 @@ err:
 int cond_read_list(struct policydb *p, void *fp)
 {
 	struct cond_node *node, *last = NULL;
-	u32 buf[1], i, len;
+	__le32 buf[1];
+	u32 i, len;
 	int rc;
 
 	rc = next_entry(buf, fp, sizeof buf);

--===============85952163882561594==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85952163882561594==--
