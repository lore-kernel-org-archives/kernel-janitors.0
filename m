From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Jun 2017 09:28:00 +0000
Subject: [PATCH] ext4: fix reserved_clusters_store()
Message-Id: <20170623092800.eize6ayzkvngpseq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

The test if kstrtoull() failed is reversed so we can't set cluster_store
any more.

Fixes: 76d33bca5581 ("ext4: refactor sysfs support code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
index d74dc5f81a04..5d543523f479 100644
--- a/fs/ext4/sysfs.c
+++ b/fs/ext4/sysfs.c
@@ -100,7 +100,9 @@ static ssize_t reserved_clusters_store(struct ext4_attr *a,
 	int ret;
 
 	ret = kstrtoull(skip_spaces(buf), 0, &val);
-	if (!ret || val >= clusters)
+	if (ret)
+		return ret;
+	if (val >= clusters)
 		return -EINVAL;
 
 	atomic64_set(&sbi->s_resv_clusters, val);
