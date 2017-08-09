From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Aug 2017 10:25:21 +0000
Subject: [PATCH] cgroup: remove unneeded checks
Message-Id: <20170809102521.pizo5vlqhb5unrin@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>, Roman Gushchin <guro@fb.com>
Cc: Zefan Li <lizefan@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"descendants" and "depth" are declared as int, so they can't be larger
than INT_MAX.  Static checkers complain and it's slightly confusing for
humans as well so let's just remove these conditions.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index bf8a6e2db278..5988781d7128 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3247,7 +3247,7 @@ static ssize_t cgroup_max_descendants_write(struct kernfs_open_file *of,
 			return ret;
 	}
 
-	if (descendants < 0 || descendants > INT_MAX)
+	if (descendants < 0)
 		return -ERANGE;
 
 	cgrp = cgroup_kn_lock_live(of->kn, false);
@@ -3290,7 +3290,7 @@ static ssize_t cgroup_max_depth_write(struct kernfs_open_file *of,
 			return ret;
 	}
 
-	if (depth < 0 || depth > INT_MAX)
+	if (depth < 0)
 		return -ERANGE;
 
 	cgrp = cgroup_kn_lock_live(of->kn, false);
