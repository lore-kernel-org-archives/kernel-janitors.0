From: Jesse Millan <jessem@cs.pdx.edu>
Date: Fri, 03 Jun 2005 18:43:39 +0000
Subject: [KJ]
Message-Id: <42A0A4DB.7060303@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080403010508080409060602"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1106245529.15916.12.camel@base.torri.org>
In-Reply-To: <1106245529.15916.12.camel@base.torri.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080403010508080409060602
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The function ext2_set_acl() declares a size_t called 'size' without
setting it to an initial value. 'size' is not referred to again until
you see:

if (acl) {
	// Email KJ comments: size IS initialized in this function
	// only if acl != NULL
	value = ext2_acl_to_disk(acl, &size);
	...
}

// Email KJ comments: If acl == NULL, size is passed to
// this function uninitialized.
error = ext2_xattr_set(inode, name_index, "", value, size, 0);
...

The external function ext2_xattr_set() does not seem to use size in any
meaningful way... but depending on some other parameters, it looks like
'size' could be read without being initialized.

Initializing 'size' to zero eliminates the compiler warning and the
possibility of passing an uninitialized variable around.

*Note unlike previous patches, initializing 'size' in the function
ext2_acl_to_disk() does not eliminate this particular warning. This is
because of the conditional call to the function that initializes it.




--------------080403010508080409060602
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc5.kj/fs/ext2/acl.c~	2005-06-01 16:46:22.139160702 -0700
+++ linux-2.6.12-rc5.kj/fs/ext2/acl.c	2005-06-03 10:40:36.828178073 -0700
@@ -220,7 +220,7 @@ ext2_set_acl(struct inode *inode, int ty
 	struct ext2_inode_info *ei = EXT2_I(inode);
 	int name_index;
 	void *value = NULL;
-	size_t size;
+	size_t size = 0;
 	int error;

 	if (S_ISLNK(inode->i_mode))


--------------080403010508080409060602
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080403010508080409060602--
