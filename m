From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:51:51 +0000
Subject: [KJ] [PATCH 8/] fs/befs/endian.h: fix sparse warnings
Message-Id: <200503100133.23344.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============04823885167423736=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============04823885167423736==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk2-sparse/fs/befs/endian.h
===================================================================
--- linux-2.6.11-bk2-sparse.orig/fs/befs/endian.h	2005-03-02 09:38:17.000000000 +0200
+++ linux-2.6.11-bk2-sparse/fs/befs/endian.h	2005-03-07 15:18:13.000000000 +0200
@@ -16,9 +16,9 @@ static inline u64
 fs64_to_cpu(const struct super_block *sb, u64 n)
 {
 	if (BEFS_SB(sb)->byte_order == BEFS_BYTESEX_LE)
-		return le64_to_cpu(n);
+		return le64_to_cpu((__le64 __force) n);
 	else
-		return be64_to_cpu(n);
+		return be64_to_cpu((__be64 __force) n);
 }
 
 static inline u64
@@ -34,9 +34,9 @@ static inline u32
 fs32_to_cpu(const struct super_block *sb, u32 n)
 {
 	if (BEFS_SB(sb)->byte_order == BEFS_BYTESEX_LE)
-		return le32_to_cpu(n);
+		return le32_to_cpu((__le32 __force) n);
 	else
-		return be32_to_cpu(n);
+		return be32_to_cpu((__be32 __force) n);
 }
 
 static inline u32
@@ -52,9 +52,9 @@ static inline u16
 fs16_to_cpu(const struct super_block *sb, u16 n)
 {
 	if (BEFS_SB(sb)->byte_order == BEFS_BYTESEX_LE)
-		return le16_to_cpu(n);
+		return le16_to_cpu((__le16 __force) n);
 	else
-		return be16_to_cpu(n);
+		return be16_to_cpu((__be16 __force) n);
 }
 
 static inline u16
@@ -73,15 +73,9 @@ fsrun_to_cpu(const struct super_block *s
 {
 	befs_block_run run;
 
-	if (BEFS_SB(sb)->byte_order == BEFS_BYTESEX_LE) {
-		run.allocation_group = le32_to_cpu(n.allocation_group);
-		run.start = le16_to_cpu(n.start);
-		run.len = le16_to_cpu(n.len);
-	} else {
-		run.allocation_group = be32_to_cpu(n.allocation_group);
-		run.start = be16_to_cpu(n.start);
-		run.len = be16_to_cpu(n.len);
-	}
+	run.allocation_group = fs32_to_cpu(sb, n.allocation_group);
+	run.start = fs16_to_cpu(sb, n.start);
+	run.len = fs16_to_cpu(sb, n.len);
 	return run;
 }
 

--===============04823885167423736==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============04823885167423736==--
