From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:51:41 +0000
Subject: [KJ] [PATCH 7/] fs/affs/super.c: fix sparse warning
Message-Id: <200503100132.17646.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1861738546451579=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============1861738546451579==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk2-sparse/fs/affs/super.c
===================================================================
--- linux-2.6.11-bk2-sparse.orig/fs/affs/super.c	2005-03-02 09:38:13.000000000 +0200
+++ linux-2.6.11-bk2-sparse/fs/affs/super.c	2005-03-07 15:00:30.000000000 +0200
@@ -421,11 +421,11 @@ got_root:
 	}
 
 	if (mount_flags & SF_VERBOSE) {
-		chksum = cpu_to_be32(chksum);
+		__be32 chksum1 = cpu_to_be32(chksum);
 		printk(KERN_NOTICE "AFFS: Mounting volume \"%*s\": Type=%.3s\\%c, Blocksize=%d\n",
 			AFFS_ROOT_TAIL(sb, root_bh)->disk_name[0],
 			AFFS_ROOT_TAIL(sb, root_bh)->disk_name + 1,
-			(char *)&chksum,((char *)&chksum)[3] + '0',blocksize);
+			(char *)&chksum1,((char *)&chksum1)[3] + '0',blocksize);
 	}
 
 	sb->s_flags |= MS_NODEV | MS_NOSUID;

--===============1861738546451579==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1861738546451579==--
