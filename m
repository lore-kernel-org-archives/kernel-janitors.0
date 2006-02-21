From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 21 Feb 2006 22:02:29 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/cifs
Message-Id: <1140559350.26477.3.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85102239068735774=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85102239068735774==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/cifs to kzalloc() usage.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/cifs/cifsfs.c.orig	2006-02-21 22:50:58.000000000 +0100
+++ linux-2.6.16-rc4/fs/cifs/cifsfs.c	2006-02-21 22:51:21.000000000 +0100
@@ -93,13 +93,10 @@ cifs_read_super(struct super_block *sb, 
 	int rc = 0;
 
 	sb->s_flags |= MS_NODIRATIME; /* and probably even noatime */
-	sb->s_fs_info = kmalloc(sizeof(struct cifs_sb_info),GFP_KERNEL);
+	sb->s_fs_info = kzalloc(sizeof(struct cifs_sb_info),GFP_KERNEL);
 	cifs_sb = CIFS_SB(sb);
 	if(cifs_sb == NULL)
 		return -ENOMEM;
-	else
-		memset(cifs_sb,0,sizeof(struct cifs_sb_info));
-	
 
 	rc = cifs_mount(sb, cifs_sb, data, devname);
 
--- linux-2.6.16-rc4/fs/cifs/dir.c.orig	2006-02-21 22:50:29.000000000 +0100
+++ linux-2.6.16-rc4/fs/cifs/dir.c	2006-02-21 22:50:46.000000000 +0100
@@ -255,12 +255,10 @@ cifs_create(struct inode *inode, struct 
 			CIFSSMBClose(xid, pTcon, fileHandle);
 		} else if(newinode) {
 			pCifsFile =
-			   kmalloc(sizeof (struct cifsFileInfo), GFP_KERNEL);
+			   kzalloc(sizeof (struct cifsFileInfo), GFP_KERNEL);
 			
 			if(pCifsFile == NULL)
 				goto cifs_create_out;
-			memset((char *)pCifsFile, 0,
-			       sizeof (struct cifsFileInfo));
 			pCifsFile->netfid = fileHandle;
 			pCifsFile->pid = current->tgid;
 			pCifsFile->pInode = newinode;
--- linux-2.6.16-rc4/fs/cifs/inode.c.orig	2006-02-21 22:49:52.000000000 +0100
+++ linux-2.6.16-rc4/fs/cifs/inode.c	2006-02-21 22:50:21.000000000 +0100
@@ -609,9 +609,8 @@ int cifs_unlink(struct inode *inode, str
 		}
 	} else if (rc == -EACCES) {
 		/* try only if r/o attribute set in local lookup data? */
-		pinfo_buf = kmalloc(sizeof(FILE_BASIC_INFO), GFP_KERNEL);
+		pinfo_buf = kzalloc(sizeof(FILE_BASIC_INFO), GFP_KERNEL);
 		if (pinfo_buf) {
-			memset(pinfo_buf, 0, sizeof(FILE_BASIC_INFO));
 			/* ATTRS set to normal clears r/o bit */
 			pinfo_buf->Attributes = cpu_to_le32(ATTR_NORMAL);
 			if (!(pTcon->ses->flags & CIFS_SES_NT4))
--- linux-2.6.16-rc4/fs/cifs/misc.c.orig	2006-02-21 22:51:32.000000000 +0100
+++ linux-2.6.16-rc4/fs/cifs/misc.c	2006-02-21 22:55:47.000000000 +0100
@@ -72,10 +72,9 @@ sesInfoAlloc(void)
 	struct cifsSesInfo *ret_buf;
 
 	ret_buf =
-	    (struct cifsSesInfo *) kmalloc(sizeof (struct cifsSesInfo),
+	    (struct cifsSesInfo *) kzalloc(sizeof (struct cifsSesInfo),
 					   GFP_KERNEL);
 	if (ret_buf) {
-		memset(ret_buf, 0, sizeof (struct cifsSesInfo));
 		write_lock(&GlobalSMBSeslock);
 		atomic_inc(&sesInfoAllocCount);
 		ret_buf->status = CifsNew;
@@ -110,10 +109,9 @@ tconInfoAlloc(void)
 {
 	struct cifsTconInfo *ret_buf;
 	ret_buf =
-	    (struct cifsTconInfo *) kmalloc(sizeof (struct cifsTconInfo),
+	    (struct cifsTconInfo *) kzalloc(sizeof (struct cifsTconInfo),
 					    GFP_KERNEL);
 	if (ret_buf) {
-		memset(ret_buf, 0, sizeof (struct cifsTconInfo));
 		write_lock(&GlobalSMBSeslock);
 		atomic_inc(&tconInfoAllocCount);
 		list_add(&ret_buf->cifsConnectionList,



--===============85102239068735774==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85102239068735774==--
