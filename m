From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Jun 2018 12:53:40 +0000
Subject: [PATCH] cpuset: Fix cpuset_get_tree()
Message-Id: <20180619125340.h2supkskfgwmrbtq@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There was a reversed NULL test to the function couldn't work.

Fixes: ec0090a1ccf7 ("cpuset: Use fs_context")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index e6582b2f5144..b02161a41d5a 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -324,10 +324,8 @@ static int cpuset_get_tree(struct fs_context *fc)
 	int ret = -ENODEV;
 
 	cgroup_fs = get_fs_type("cgroup");
-	if (cgroup_fs) {
-		ret = PTR_ERR(cgroup_fs);
+	if (!cgroup_fs)
 		goto out;
-	}
 
 	cg_fc = vfs_new_fs_context(cgroup_fs, NULL, fc->sb_flags, fc->purpose);
 	put_filesystem(cgroup_fs);
