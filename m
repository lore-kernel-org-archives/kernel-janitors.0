From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Aug 2013 11:52:18 +0000
Subject: [patch] pstore: d_alloc_name() doesn't return an ERR_PTR
Message-Id: <20130814115218.GC8044@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <anton@enomsg.org>
Cc: Colin Cross <ccross@android.com>, Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

d_alloc_name() returns NULL on error.  Also I changed the error code
from -ENOSPC to -ENOMEM to reflect that we were short on RAM not disk
space.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
index 71bf5f4..6a4123d 100644
--- a/fs/pstore/inode.c
+++ b/fs/pstore/inode.c
@@ -345,9 +345,8 @@ int pstore_mkfile(enum pstore_type_id type, char *psname, u64 id, int count,
 
 	mutex_lock(&root->d_inode->i_mutex);
 
-	rc = -ENOSPC;
 	dentry = d_alloc_name(root, name);
-	if (IS_ERR(dentry))
+	if (!dentry)
 		goto fail_lockedalloc;
 
 	memcpy(private->data, data, size);
