From: Nicolas Kaiser <nikai@nikai.net>
Date: Tue, 22 Nov 2005 19:23:21 +0000
Subject: [KJ] [PATCH] selinux: use ARRAY_SIZE macro
Message-Id: <20051122202321.011911d5@lucky.kitzblitz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37599864507248437=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37599864507248437==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]).

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>

---

--- a/security/selinux/selinuxfs.c	2005-11-20 11:49:01.000000000 +0100
+++ b/security/selinux/selinuxfs.c	2005-11-22 19:51:47.000000000 +0100
@@ -376,7 +376,7 @@ static ssize_t selinux_transaction_write
 	char *data;
 	ssize_t rv;
 
-	if (ino >= sizeof(write_op)/sizeof(write_op[0]) || !write_op[ino])
+	if (ino >= ARRAY_SIZE(write_op) || !write_op[ino])
 		return -EINVAL;
 
 	data = simple_transaction_get(file, buf, size);
@@ -1161,7 +1161,7 @@ static int sel_make_avc_files(struct den
 #endif
 	};
 
-	for (i = 0; i < sizeof (files) / sizeof (files[0]); i++) {
+	for (i = 0; i < ARRAY_SIZE(files); i++) {
 		struct inode *inode;
 		struct dentry *dentry;
 

--===============37599864507248437==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37599864507248437==--
