From: Jesse Millan <jessem@cs.pdx.edu>
Date: Fri, 03 Jun 2005 18:52:54 +0000
Subject: [KJ] [PATCH] Fix misleading gcc4 warning,
Message-Id: <42A0A706.1030109@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010503000205080509020601"
List-Id: <kernel-janitors.vger.kernel.org>
References: <42966B18.6020802@cs.pdx.edu>
In-Reply-To: <42966B18.6020802@cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010503000205080509020601
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Similar story as the ext2 version of acl.c.

The function ext3_set_acl() declares a size_t called 'size' without
setting it to an initial value. 'size' is not referred to again until
you see:

if (acl) {
	// Email KJ comments: size IS initialized in this function
	// only if acl != NULL
	value = ext3_acl_to_disk(acl, &size);
	...
}

// Email KJ comments: If acl == NULL, size is passed to
// this function uninitialized.
error = ext3_xattr_set_handle(handle, inode, name_index, "",
                                      value, size, 0);
...

The external function ext3_xattr_set_handle() initializes a member of a
 ext3_xattr_info structure to the value of size.

Initializing 'size' to zero eliminates the compiler warning and the
possibility of passing an uninitialized variable around.

*Note unlike previous patches, initializing 'size' in the function
ext3_acl_to_disk() does not eliminate this particular warning. This is
because of the conditional call to the function that initializes it.


--------------010503000205080509020601
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc5.kj/fs/ext3/acl.c~	2005-06-01 16:46:37.735581769 -0700
+++ linux-2.6.12-rc5.kj/fs/ext3/acl.c	2005-06-01 16:48:11.361096097 -0700
@@ -225,7 +225,7 @@ ext3_set_acl(handle_t *handle, struct in
 	struct ext3_inode_info *ei = EXT3_I(inode);
 	int name_index;
 	void *value = NULL;
-	size_t size;
+	size_t size = 0;
 	int error;

 	if (S_ISLNK(inode->i_mode))


--------------010503000205080509020601
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010503000205080509020601--
