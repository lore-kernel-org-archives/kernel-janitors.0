From: Jesse Millan <jessem@cs.pdx.edu>
Date: Wed, 25 May 2005 22:41:22 +0000
Subject: [KJ] [PATCH] Fix gcc4 warning,
Message-Id: <4294FF12.7020506@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010004010108030207030807"
List-Id: <kernel-janitors.vger.kernel.org>
References: <428E3224.8030307@cs.pdx.edu>
In-Reply-To: <428E3224.8030307@cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010004010108030207030807
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Same same. This patch eliminates the warning that is generated
when passing a reference of an uninitialized variable to a function
where it possible that the function will return without initializing
that variable.

--------------010004010108030207030807
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc4/fs/devfs/base.c~	2005-05-25 15:22:47.710055525 -0700
+++ linux-2.6.12-rc4/fs/devfs/base.c	2005-05-25 15:26:15.975096985 -0700
@@ -1127,8 +1127,11 @@ static devfs_handle_t _devfs_make_parent

 	if (dir == NULL)
 		dir = _devfs_get_root_entry();
-	if (dir == NULL)
+	if (dir == NULL) {
+		/* Function would have returned without initializing 'leaf_pos' */
+		*leaf_pos = 0;
 		return NULL;
+	}
 	devfs_get(dir);
 	/*  Search for possible trailing component and ignore it  */
 	for (--namelen; (namelen > 0) && (name[namelen] != '/'); --namelen) ;

--------------010004010108030207030807
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010004010108030207030807--
