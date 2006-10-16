From: Amit Choudhary <amit2030@gmail.com>
Date: Mon, 16 Oct 2006 04:37:26 +0000
Subject: [KJ] [PATCH 2.6.19-rc1] fs/cifs/readdir.c: check kmalloc() return
Message-Id: <20061015213726.a1d97c51.amit2030@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description: Check the return value of kmalloc() in function cifs_readdir(), in file fs/cifs/readdir.c.

Signed-off-by: Amit Choudhary <amit2030@gmail.com>

diff --git a/fs/cifs/readdir.c b/fs/cifs/readdir.c
index b5b0a2a..2d43b2a 100644
--- a/fs/cifs/readdir.c
+++ b/fs/cifs/readdir.c
@@ -1063,6 +1063,11 @@ int cifs_readdir(struct file *file, void
 		such multibyte target UTF-8 characters. cifs_unicode.c,
 		which actually does the conversion, has the same limit */
 		tmp_buf = kmalloc((2 * NAME_MAX) + 4, GFP_KERNEL);
+		if (!tmp_buf) {
+			cERROR(1, ("No memory!"));
+			rc = -ENOMEM;
+			goto rddir2_exit;
+		}
 		for(i=0;(i<num_to_fill) && (rc = 0);i++) {
 			if(current_entry = NULL) {
 				/* evaluate whether this case is an error */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
