From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:52:30 +0000
Subject: [KJ] [PATCH 9/] fs/cifs/cifssmb.c: fix the rest of sparse warnings
Message-Id: <200503100135.23445.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28438819366142409=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28438819366142409==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix those that weren't brought by le'ifying in posix_acl_xattr.h

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk2-sparse/fs/cifs/cifssmb.c
===================================================================
--- linux-2.6.11-bk2-sparse.orig/fs/cifs/cifssmb.c	2005-03-07 12:26:38.000000000 +0200
+++ linux-2.6.11-bk2-sparse/fs/cifs/cifssmb.c	2005-03-07 15:27:46.000000000 +0200
@@ -1838,7 +1838,7 @@ __u16 convert_ace_to_cifs_ace(struct cif
 	/* Probably no need to le convert -1 on any arch but can not hurt */
 		cifs_ace->cifs_uid = cpu_to_le64(-1);
 	} else 
-		cifs_ace->cifs_uid = (__u64)le32_to_cpu(local_ace->e_id);
+		cifs_ace->cifs_uid = cpu_to_le64((__u64)le32_to_cpu(local_ace->e_id));
         /*cFYI(1,("perm %d tag %d id %d",ace->e_perm,ace->e_tag,ace->e_id));*/
 	return rc;
 }
@@ -1865,9 +1865,9 @@ __u16 ACL_to_cifs_posix(char * parm_data
 	}
 	cifs_acl->version = cpu_to_le16(1);
 	if(acl_type == ACL_TYPE_ACCESS) 
-		cifs_acl->access_entry_count = count;
+		cifs_acl->access_entry_count = cpu_to_le16(count);
 	else if(acl_type == ACL_TYPE_DEFAULT)
-		cifs_acl->default_entry_count = count;
+		cifs_acl->default_entry_count = cpu_to_le16(count);
 	else {
 		cFYI(1,("unknown ACL type %d",acl_type));
 		return 0;

--===============28438819366142409==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28438819366142409==--
