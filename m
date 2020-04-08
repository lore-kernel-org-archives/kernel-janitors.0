From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Apr 2020 11:14:56 +0000
Subject: [bug report] kernfs: Add option to enable user xattrs
Message-Id: <20200408111456.GA250869@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Daniel Xu,

The patch 0c47383ba3bd: "kernfs: Add option to enable user xattrs"
from Mar 12, 2020, leads to the following static checker warning:

	fs/kernfs/inode.c:379 kernfs_vfs_user_xattr_rm()
	error: uninitialized symbol 'removed_size'.

fs/kernfs/inode.c
   366  static int kernfs_vfs_user_xattr_rm(struct kernfs_node *kn,
   367                                      const char *full_name,
   368                                      struct simple_xattrs *xattrs,
   369                                      const void *value, size_t size, int flags)
   370  {
   371          atomic_t *sz = &kn->iattr->user_xattr_size;
   372          atomic_t *nr = &kn->iattr->nr_user_xattrs;
   373          ssize_t removed_size;
   374          int ret;
   375  
   376          ret = simple_xattr_set(xattrs, full_name, value, size, flags,
   377                                 &removed_size);
   378  
   379          if (removed_size >= 0) {
                    ^^^^^^^^^^^^^^^^^
There are some path where simple_xattr_set() doesn't initialize
"removed_size" on allocation failure.

   380                  atomic_sub(removed_size, sz);
   381                  atomic_dec(nr);
   382          }
   383  
   384          return ret;
   385  }

regards,
dan carpenter
