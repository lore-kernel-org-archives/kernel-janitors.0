From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:01:49 +0000
Subject: [KJ] [PATCH] security/selinux/ss/mls.c	: fix sparse warnings
Message-Id: <200503100153.18132.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16123305724574277=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============16123305724574277==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/security/selinux/ss/mls.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/security/selinux/ss/mls.c	2005-03-02 09:38:37.000000000 +0200
+++ linux-2.6.11-bk3-sparse/security/selinux/ss/mls.c	2005-03-08 14:44:31.000000000 +0200
@@ -402,7 +402,7 @@ void mls_user_destroy(struct user_datum 
 
 int mls_read_perm(struct perm_datum *perdatum, void *fp)
 {
-	u32 buf[1];
+	__le32 buf[1];
 	int rc;
 
 	rc = next_entry(buf, fp, sizeof buf);
@@ -455,7 +455,8 @@ bad:
  */
 static int mls_read_range_helper(struct mls_range *r, void *fp)
 {
-	u32 buf[2], items;
+	__le32 buf[2];
+	u32 items;
 	int rc;
 
 	rc = next_entry(buf, fp, sizeof(u32));
@@ -522,7 +523,7 @@ int mls_read_range(struct context *c, vo
 int mls_read_class(struct class_datum *cladatum, void *fp)
 {
 	struct mls_perms *p = &cladatum->mlsperms;
-	u32 buf[4];
+	__le32 buf[4];
 	int rc;
 
 	rc = next_entry(buf, fp, sizeof buf);
@@ -542,7 +543,7 @@ int mls_read_user(struct user_datum *usr
 	struct mls_range_list *r, *l;
 	int rc;
 	u32 nel, i;
-	u32 buf[1];
+	__le32 buf[1];
 
 	rc = next_entry(buf, fp, sizeof buf);
 	if (rc < 0)
@@ -575,7 +576,7 @@ out:
 
 int mls_read_nlevels(struct policydb *p, void *fp)
 {
-	u32 buf[1];
+	__le32 buf[1];
 	int rc;
 
 	rc = next_entry(buf, fp, sizeof buf);
@@ -664,7 +665,8 @@ int sens_read(struct policydb *p, struct
 	char *key = NULL;
 	struct level_datum *levdatum;
 	int rc;
-	u32 buf[2], len;
+	__le32 buf[2];
+	u32 len;
 
 	levdatum = kmalloc(sizeof(*levdatum), GFP_ATOMIC);
 	if (!levdatum) {
@@ -712,7 +714,8 @@ int cat_read(struct policydb *p, struct 
 	char *key = NULL;
 	struct cat_datum *catdatum;
 	int rc;
-	u32 buf[3], len;
+	__le32 buf[3];
+	u32 len;
 
 	catdatum = kmalloc(sizeof(*catdatum), GFP_ATOMIC);
 	if (!catdatum) {

--===============16123305724574277==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16123305724574277==--
