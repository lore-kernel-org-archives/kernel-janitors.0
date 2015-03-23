From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Mar 2015 09:35:19 +0000
Subject: [patch] jffs2: remove an unneeded condition
Message-Id: <20150323093519.GB558@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org

We know "rc" is set so there is no need to check again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 762c7a3..2eac553 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -1266,7 +1266,6 @@ int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_
 	if (rc) {
 		JFFS2_WARNING("%s: jffs2_reserve_space_gc() = %d, request = %u\n",
 			      __func__, rc, totlen);
-		rc = rc ? rc : -EBADFD;
 		goto out;
 	}
 	rc = save_xattr_ref(c, ref);
