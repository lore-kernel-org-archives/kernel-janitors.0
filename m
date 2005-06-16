From: Jesse Millan <jessem@cs.pdx.edu>
Date: Thu, 16 Jun 2005 22:16:08 +0000
Subject: [KJ] [PATCH] Fix misleading gcc4 warning: (160) offset and block
Message-Id: <42B1FA28.4070500@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040403070903010104000507"
List-Id: <kernel-janitors.vger.kernel.org>
References: <42966B18.6020802@cs.pdx.edu>
In-Reply-To: <42966B18.6020802@cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040403070903010104000507
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


This warning appears to be a false alarm.

This patch eliminates the warning that 'offset' and 'block' may be used
uninitialized. The compiler does not like the conditional initialization
of the two variables in the function isofs_find_entry().

In isofs_find_entry(), 'offset' and 'block' are referred to as
'block_rv' and 'offset_rv' respectively and are now initialized
unconditionally to zero.




--------------040403070903010104000507
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc6.kj/fs/isofs/namei.c~	2005-06-16 14:34:01.367647520 -0700
+++ linux-2.6.12-rc6.kj/fs/isofs/namei.c	2005-06-16 14:48:06.518165112 -0700
@@ -57,6 +57,8 @@ isofs_find_entry(struct inode *dir, stru
 	unsigned long block, f_pos, offset, block_saved, offset_saved;
 	struct buffer_head * bh = NULL;
 	struct isofs_sb_info *sbi = ISOFS_SB(dir->i_sb);
+	*block_rv = 0;
+	*offset_rv = 0;

 	if (!ISOFS_I(dir)->i_first_extent)
 		return 0;

--------------040403070903010104000507
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040403070903010104000507--
