From: Theodore Ts'o <tytso@mit.edu>
Date: Fri, 23 Jun 2017 12:14:26 +0000
Subject: Re: [PATCH] ext4: fix reserved_clusters_store()
Message-Id: <20170623121426.3e7sivaip6izvz5c@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623092800.eize6ayzkvngpseq@mwanda>
In-Reply-To: <20170623092800.eize6ayzkvngpseq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 23, 2017 at 12:28:00PM +0300, Dan Carpenter wrote:
> The test if kstrtoull() failed is reversed so we can't set cluster_store
> any more.
> 
> Fixes: 76d33bca5581 ("ext4: refactor sysfs support code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, this should already be fixed in the ext4.git tree.

	     	    	       	     	- Ted
			
commit f5b877c913026b9c5d4d1ac2916eff46c49b37a0
Author: Chao Yu <yuchao0@huawei.com>
Date:   Fri Jun 23 01:08:22 2017 -0400

    ext4: check return value of kstrtoull correctly in reserved_clusters_store
    
    kstrtoull returns 0 on success, however, in reserved_clusters_store we
    will return -EINVAL if kstrtoull returns 0, it makes us fail to update
    reserved_clusters value through sysfs.
    
    Fixes: 76d33bca5581b1dd5c3157fa168db849a784ada4
    Cc: stable@vger.kernel.org # 4.4
    Signed-off-by: Chao Yu <yuchao0@huawei.com>
    Signed-off-by: Miao Xie <miaoxie@huawei.com>
    Signed-off-by: Theodore Ts'o <tytso@mit.edu>

diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
index d74dc5f81a04..48c7a7d55ed3 100644
--- a/fs/ext4/sysfs.c
+++ b/fs/ext4/sysfs.c
@@ -100,7 +100,7 @@ static ssize_t reserved_clusters_store(struct ext4_attr *a,
 	int ret;
 
 	ret = kstrtoull(skip_spaces(buf), 0, &val);
-	if (!ret || val >= clusters)
+	if (ret || val >= clusters)
 		return -EINVAL;
 
 	atomic64_set(&sbi->s_resv_clusters, val);
