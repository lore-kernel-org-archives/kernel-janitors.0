From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:59:33 +0000
Subject: [KJ] [PATCH] fs/cifs/netmisc.c: fix sparse warning
Message-Id: <200503100150.49935.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49966581996684578=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49966581996684578==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk2-sparse/fs/cifs/netmisc.c
===================================================================
--- linux-2.6.11-bk2-sparse.orig/fs/cifs/netmisc.c	2005-03-07 16:19:02.000000000 +0200
+++ linux-2.6.11-bk2-sparse/fs/cifs/netmisc.c	2005-03-07 16:26:43.000000000 +0200
@@ -132,7 +132,6 @@ const struct smb_to_posix_error mapping_
 int
 cifs_inet_pton(int address_family, char *cp,void *dst)
 {
-	struct in_addr address;
 	int value;
 	int digit;
 	int i;
@@ -189,8 +188,7 @@ cifs_inet_pton(int address_family, char 
 	if (value > addr_class_max[end - bytes])
 		return 0;
 
-	address.s_addr = *((__be32 *) bytes) | htonl(value);
-	*((__be32 *)dst) = address.s_addr;
+	*((__be32 *)dst) = *((__be32 *) bytes) | htonl(value);
 	return 1; /* success */
 }
 

--===============49966581996684578==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49966581996684578==--
