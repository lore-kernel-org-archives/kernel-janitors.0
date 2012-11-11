From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sun, 11 Nov 2012 20:49:30 +0000
Subject: [PATCH 2/3] iommu/tegra-smmu.c: fix dentry reference leak in smmu_debugfs_stats_show().
Message-Id: <1352666971-13551-3-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1352666971-13551-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1352666971-13551-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>, joerg.roedel@amd.com, hdoyu@nvidia.com, swarren@nvidia.com

Call to d_find_alias() needs a corresponding dput().

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/iommu/tegra-smmu.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 4167863..4252d74 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -1052,6 +1052,7 @@ static int smmu_debugfs_stats_show(struct seq_file *s, void *v)
 			stats[i], val, offs);
 	}
 	seq_printf(s, "\n");
+	dput(dent);
 
 	return 0;
 }
-- 
1.7.10.4

