From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:51:56 +0000
Subject: [KJ] [PATCH 6/] __le'ify posix_acl_xattr_entry,
Message-Id: <200503100130.59675.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62240634025424368=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62240634025424368==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix sparse warnings in fs/xattr_acl.c, fs/xfs/xfs_acl.c and new ones in
fs/cifs/cifssmb.c

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk2-sparse/fs/cifs/cifssmb.c
===================================================================
--- linux-2.6.11-bk2-sparse.orig/fs/cifs/cifssmb.c	2005-03-02 09:37:50.000000000 +0200
+++ linux-2.6.11-bk2-sparse/fs/cifs/cifssmb.c	2005-03-07 12:26:38.000000000 +0200
@@ -1764,9 +1764,9 @@ CIFSSMBQueryReparseLinkInfo(const int xi
 static void cifs_convert_ace(posix_acl_xattr_entry * ace, struct cifs_posix_ace * cifs_ace)
 {
 	/* u8 cifs fields do not need le conversion */
-	ace->e_perm = (__u16)cifs_ace->cifs_e_perm; 
-	ace->e_tag  = (__u16)cifs_ace->cifs_e_tag;
-	ace->e_id   = (__u32)le64_to_cpu(cifs_ace->cifs_uid);
+	ace->e_perm = cpu_to_le16((__u16)cifs_ace->cifs_e_perm);
+	ace->e_tag  = cpu_to_le16((__u16)cifs_ace->cifs_e_tag);
+	ace->e_id   = cpu_to_le32((__u32)le64_to_cpu(cifs_ace->cifs_uid));
 	/* cFYI(1,("perm %d tag %d id %d",ace->e_perm,ace->e_tag,ace->e_id)); */
 
 	return;
@@ -1817,7 +1817,7 @@ static int cifs_copy_posix_acl(char * tr
 	} else if(size > buflen) {
 		return -ERANGE;
 	} else /* buffer big enough */ {
-		local_acl->a_version = POSIX_ACL_XATTR_VERSION;
+		local_acl->a_version = cpu_to_le32(POSIX_ACL_XATTR_VERSION);
 		for(i = 0;i < count ;i++) {
 			cifs_convert_ace(&local_acl->a_entries[i],pACE);
 			pACE ++;
@@ -1831,14 +1831,14 @@ __u16 convert_ace_to_cifs_ace(struct cif
 {
 	__u16 rc = 0; /* 0 = ACL converted ok */
 
-	cifs_ace->cifs_e_perm = (__u8)cpu_to_le16(local_ace->e_perm);
-	cifs_ace->cifs_e_tag =  (__u8)cpu_to_le16(local_ace->e_tag);
+	cifs_ace->cifs_e_perm = (__u8)le16_to_cpu(local_ace->e_perm);
+	cifs_ace->cifs_e_tag =  (__u8)le16_to_cpu(local_ace->e_tag);
 	/* BB is there a better way to handle the large uid? */
-	if(local_ace->e_id == -1) {
+	if(local_ace->e_id == cpu_to_le32(-1)) {
 	/* Probably no need to le convert -1 on any arch but can not hurt */
 		cifs_ace->cifs_uid = cpu_to_le64(-1);
 	} else 
-		cifs_ace->cifs_uid = (__u64)cpu_to_le32(local_ace->e_id);
+		cifs_ace->cifs_uid = (__u64)le32_to_cpu(local_ace->e_id);
         /*cFYI(1,("perm %d tag %d id %d",ace->e_perm,ace->e_tag,ace->e_id));*/
 	return rc;
 }
@@ -1859,7 +1859,7 @@ __u16 ACL_to_cifs_posix(char * parm_data
 	count = posix_acl_xattr_count((size_t)buflen);
 	cFYI(1,("setting acl with %d entries from buf of length %d and version of %d",
 		count,buflen,local_acl->a_version));
-	if(local_acl->a_version != 2) {
+	if(local_acl->a_version != cpu_to_le32(POSIX_ACL_XATTR_VERSION)) {
 		cFYI(1,("unknown POSIX ACL version %d",local_acl->a_version));
 		return 0;
 	}
Index: linux-2.6.11-bk2-sparse/include/linux/posix_acl_xattr.h
===================================================================
--- linux-2.6.11-bk2-sparse.orig/include/linux/posix_acl_xattr.h	2005-03-06 23:59:33.000000000 +0200
+++ linux-2.6.11-bk2-sparse/include/linux/posix_acl_xattr.h	2005-03-07 00:00:29.000000000 +0200
@@ -23,13 +23,13 @@
 #define ACL_UNDEFINED_ID	(-1)
 
 typedef struct {
-	__u16			e_tag;
-	__u16			e_perm;
-	__u32			e_id;
+	__le16			e_tag;
+	__le16			e_perm;
+	__le32			e_id;
 } posix_acl_xattr_entry;
 
 typedef struct {
-	__u32			a_version;
+	__le32			a_version;
 	posix_acl_xattr_entry	a_entries[0];
 } posix_acl_xattr_header;
 

--===============62240634025424368==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62240634025424368==--
