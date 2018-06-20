From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jun 2018 11:09:21 +0000
Subject: [PATCH] hugetlbfs: Fix an error code in init_hugetlbfs_fs()
Message-Id: <20180620110921.2s4krw4zjbnfniq5@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Kravetz <mike.kravetz@oracle.com>, David Howells <dhowells@redhat.com>
Cc: linux-mm@kvack.org, kernel-janitors@vger.kernel.org

We accidentally deleted the error code assignment.

Fixes: 9b82d88c136c ("hugetlbfs: Convert to fs_context")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 9a5c9fcf54f5..91fadca3c8e6 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -1482,8 +1482,10 @@ static int __init init_hugetlbfs_fs(void)
 	i = 0;
 	for_each_hstate(h) {
 		mnt = mount_one_hugetlbfs(h);
-		if (IS_ERR(mnt) && i = 0)
+		if (IS_ERR(mnt) && i = 0) {
+			error = PTR_ERR(mnt);
 			goto out;
+		}
 		hugetlbfs_vfsmount[i] = mnt;
 		i++;
 	}
