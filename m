From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 20 Aug 2017 18:38:46 +0000
Subject: [PATCH 1/3] ceph: Delete an error message for a failed memory allocation in __get_or_create_frag()
Message-Id: <1c62414e-f9c9-3c3b-a6d3-cd1ea582939a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b05df66b-b8a7-ac63-989d-091efecf2ab8@users.sourceforge.net>
In-Reply-To: <b05df66b-b8a7-ac63-989d-091efecf2ab8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Sage Weil <sage@redhat.com>, "Yan, Zheng" <zyan@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 20 Aug 2017 20:00:09 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ceph/inode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index 220dfd87cbfa..010e7be768e6 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -133,12 +133,9 @@ static struct ceph_inode_frag *__get_or_create_frag(struct ceph_inode_info *ci,
 	}
 
 	frag = kmalloc(sizeof(*frag), GFP_NOFS);
-	if (!frag) {
-		pr_err("__get_or_create_frag ENOMEM on %p %llx.%llx "
-		       "frag %x\n", &ci->vfs_inode,
-		       ceph_vinop(&ci->vfs_inode), f);
+	if (!frag)
 		return ERR_PTR(-ENOMEM);
-	}
+
 	frag->frag = f;
 	frag->split_by = 0;
 	frag->mds = -1;
-- 
2.14.0

