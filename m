From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:59:43 +0000
Subject: [KJ] [PATCH] security/selinux/ss/policydb.c: fix sparse warnings
Message-Id: <200503100150.40495.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58203585337270813=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58203585337270813==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/security/selinux/ss/policydb.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/security/selinux/ss/policydb.c	2005-03-02 09:38:07.000000000 +0200
+++ linux-2.6.11-bk3-sparse/security/selinux/ss/policydb.c	2005-03-08 13:32:55.000000000 +0200
@@ -631,7 +631,7 @@ static int context_read_and_validate(str
 				     struct policydb *p,
 				     void *fp)
 {
-	u32 buf[3];
+	__le32 buf[3];
 	int rc;
 
 	rc = next_entry(buf, fp, sizeof buf);
@@ -669,7 +669,8 @@ static int perm_read(struct policydb *p,
 	char *key = NULL;
 	struct perm_datum *perdatum;
 	int rc;
-	u32 buf[2], len;
+	__le32 buf[2];
+	u32 len;
 
 	perdatum = kmalloc(sizeof(*perdatum), GFP_KERNEL);
 	if (!perdatum) {
@@ -712,7 +713,8 @@ static int common_read(struct policydb *
 {
 	char *key = NULL;
 	struct common_datum *comdatum;
-	u32 buf[4], len, nel;
+	__le32 buf[4];
+	u32 len, nel;
 	int i, rc;
 
 	comdatum = kmalloc(sizeof(*comdatum), GFP_KERNEL);
@@ -767,7 +769,8 @@ static int class_read(struct policydb *p
 	struct class_datum *cladatum;
 	struct constraint_node *c, *lc;
 	struct constraint_expr *e, *le;
-	u32 buf[6], len, len2, ncons, nexpr, nel;
+	__le32 buf[6];
+	u32 len, len2, ncons, nexpr, nel;
 	int i, j, depth, rc;
 
 	cladatum = kmalloc(sizeof(*cladatum), GFP_KERNEL);
@@ -927,7 +930,8 @@ static int role_read(struct policydb *p,
 	char *key = NULL;
 	struct role_datum *role;
 	int rc;
-	u32 buf[2], len;
+	__le32 buf[2];
+	u32 len;
 
 	role = kmalloc(sizeof(*role), GFP_KERNEL);
 	if (!role) {
@@ -987,7 +991,8 @@ static int type_read(struct policydb *p,
 	char *key = NULL;
 	struct type_datum *typdatum;
 	int rc;
-	u32 buf[3], len;
+	__le32 buf[3];
+	u32 len;
 
 	typdatum = kmalloc(sizeof(*typdatum),GFP_KERNEL);
 	if (!typdatum) {
@@ -1029,7 +1034,8 @@ static int user_read(struct policydb *p,
 	char *key = NULL;
 	struct user_datum *usrdatum;
 	int rc;
-	u32 buf[2], len;
+	__le32 buf[2];
+	u32 len;
 
 
 	usrdatum = kmalloc(sizeof(*usrdatum), GFP_KERNEL);
@@ -1099,7 +1105,8 @@ int policydb_read(struct policydb *p, vo
 	struct ocontext *l, *c, *newc;
 	struct genfs *genfs_p, *genfs, *newgenfs;
 	int i, j, rc;
-	u32 buf[8], len, len2, config, nprim, nel, nel2;
+	__le32 buf[8];
+	u32 len, len2, config, nprim, nel, nel2;
 	char *policydb_str;
 	struct policydb_compat_info *info;
 
@@ -1115,17 +1122,14 @@ int policydb_read(struct policydb *p, vo
 	if (rc < 0)
 		goto bad;
 
-	for (i = 0; i < 2; i++)
-		buf[i] = le32_to_cpu(buf[i]);
-
-	if (buf[0] != POLICYDB_MAGIC) {
+	if (buf[0] != cpu_to_le32(POLICYDB_MAGIC)) {
 		printk(KERN_ERR "security:  policydb magic number 0x%x does "
 		       "not match expected magic number 0x%x\n",
-		       buf[0], POLICYDB_MAGIC);
+		       le32_to_cpu(buf[0]), POLICYDB_MAGIC);
 		goto bad;
 	}
 
-	len = buf[1];
+	len = le32_to_cpu(buf[1]);
 	if (len != strlen(POLICYDB_STRING)) {
 		printk(KERN_ERR "security:  policydb string length %d does not "
 		       "match expected length %Zu\n",
@@ -1160,22 +1164,20 @@ int policydb_read(struct policydb *p, vo
 	rc = next_entry(buf, fp, sizeof(u32)*4);
 	if (rc < 0)
 		goto bad;
-	for (i = 0; i < 4; i++)
-		buf[i] = le32_to_cpu(buf[i]);
 
-	p->policyvers = buf[0];
+	p->policyvers = le32_to_cpu(buf[0]);
 	if (p->policyvers < POLICYDB_VERSION_MIN ||
 	    p->policyvers > POLICYDB_VERSION_MAX) {
 	    	printk(KERN_ERR "security:  policydb version %d does not match "
-	    	       "my version range %d-%d\n",
-	    	       buf[0], POLICYDB_VERSION_MIN, POLICYDB_VERSION_MAX);
+	    	       "my version range %d-%d\n", p->policyvers,
+		       POLICYDB_VERSION_MIN, POLICYDB_VERSION_MAX);
 	    	goto bad;
 	}
 
-	if (buf[1] != config) {
+	if (le32_to_cpu(buf[1]) != config) {
 		printk(KERN_ERR "security:  policydb configuration (%s) does "
 		       "not match my configuration (%s)\n",
-		       mls_config(buf[1]),
+		       mls_config(le32_to_cpu(buf[1])),
 		       mls_config(config));
 		goto bad;
 	}
@@ -1188,9 +1190,11 @@ int policydb_read(struct policydb *p, vo
 		goto bad;
 	}
 
-	if (buf[2] != info->sym_num || buf[3] != info->ocon_num) {
+	if (le32_to_cpu(buf[2]) != info->sym_num ||
+	    le32_to_cpu(buf[3]) != info->ocon_num) {
 		printk(KERN_ERR "security:  policydb table sizes (%d,%d) do "
-		       "not match mine (%d,%d)\n", buf[2], buf[3],
+		       "not match mine (%d,%d)\n",
+		       le32_to_cpu(buf[2]), le32_to_cpu(buf[3]),
 		       info->sym_num, info->ocon_num);
 		goto bad;
 	}

--===============58203585337270813==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58203585337270813==--
