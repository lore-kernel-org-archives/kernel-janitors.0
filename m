From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:01:57 +0000
Subject: [KJ] [PATCH] fs/smbfs/*: fix sparse warnings
Message-Id: <200503100151.29706.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58144540056678307=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58144540056678307==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/include/linux/smb_fs.h
===================================================================
--- linux-2.6.11-bk3-sparse.orig/include/linux/smb_fs.h	2005-03-02 09:38:13.000000000 +0200
+++ linux-2.6.11-bk3-sparse/include/linux/smb_fs.h	2005-03-08 12:53:32.000000000 +0200
@@ -43,17 +43,17 @@ static inline struct smb_inode_info *SMB
 
 /* macro names are short for word, double-word, long value (?) */
 #define WVAL(buf,pos) \
-	(le16_to_cpu(get_unaligned((u16 *)((u8 *)(buf) + (pos)))))
+	(le16_to_cpu(get_unaligned((__le16 *)((u8 *)(buf) + (pos)))))
 #define DVAL(buf,pos) \
-	(le32_to_cpu(get_unaligned((u32 *)((u8 *)(buf) + (pos)))))
+	(le32_to_cpu(get_unaligned((__le32 *)((u8 *)(buf) + (pos)))))
 #define LVAL(buf,pos) \
-	(le64_to_cpu(get_unaligned((u64 *)((u8 *)(buf) + (pos)))))
+	(le64_to_cpu(get_unaligned((__le64 *)((u8 *)(buf) + (pos)))))
 #define WSET(buf,pos,val) \
-	put_unaligned(cpu_to_le16((u16)(val)), (u16 *)((u8 *)(buf) + (pos)))
+	put_unaligned(cpu_to_le16((u16)(val)), (__le16 *)((u8 *)(buf) + (pos)))
 #define DSET(buf,pos,val) \
-	put_unaligned(cpu_to_le32((u32)(val)), (u32 *)((u8 *)(buf) + (pos)))
+	put_unaligned(cpu_to_le32((u32)(val)), (__le32 *)((u8 *)(buf) + (pos)))
 #define LSET(buf,pos,val) \
-	put_unaligned(cpu_to_le64((u64)(val)), (u64 *)((u8 *)(buf) + (pos)))
+	put_unaligned(cpu_to_le64((u64)(val)), (__le64 *)((u8 *)(buf) + (pos)))
 
 /* where to find the base of the SMB packet proper */
 #define smb_base(buf) ((u8 *)(((u8 *)(buf))+4))

--===============58144540056678307==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58144540056678307==--
