From: Julia Lawall <julia@diku.dk>
Date: Sun, 17 Oct 2010 18:48:30 +0000
Subject: [PATCH 2/3] fs/ceph/xattr.c: Use kasprintf
Message-Id: <1287341311-11161-3-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287341311-11161-1-git-send-email-julia@diku.dk>
In-Reply-To: <1287341311-11161-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sage Weil <sage@newdream.net>
Cc: kernel-janitors@vger.kernel.org, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Convert a sequence of kmalloc and memcpy to use kasprintf.  The argument is
checked for being a string by the presence of a previous call to strlen.

The semantic patch that performs this transformation is:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression a,flag,len;
expression arg,e1,e2;
statement S;
@@

  len = strlen(arg)
  ... when != len = e1
      when != arg = e2
  a -  \(kmalloc\|kzalloc\)(len+1,flag)
+  kasprintf(flag,"%s",arg)
  <... when != a
  if (a = NULL || ...) S
  ...>
- memcpy(a,arg,len+1);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/ceph/xattr.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
index 70e9199..b8dd1f0 100644
--- a/fs/ceph/xattr.c
+++ b/fs/ceph/xattr.c
@@ -716,10 +716,9 @@ int ceph_setxattr(struct dentry *dentry, const char *name,
 
 	/* preallocate memory for xattr name, value, index node */
 	err = -ENOMEM;
-	newname = kmalloc(name_len + 1, GFP_NOFS);
+	newname = kasprintf(GFP_NOFS, "%s", name);
 	if (!newname)
 		goto out;
-	memcpy(newname, name, name_len + 1);
 
 	if (val_len) {
 		newval = kmalloc(val_len + 1, GFP_NOFS);

