From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Jul 2020 19:22:11 +0000
Subject: [PATCH] OMAP: iommu: check for failure of a call to omap_iommu_dump_ctx
Message-Id: <20200714192211.744776-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>, Tony Lindgren <tony@atomide.com>, Hiroshi DOYU <Hiroshi.DOYU@nokia.com>, iommu@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

It is possible for the call to omap_iommu_dump_ctx to return
a negative error number, so check for the failure and return
the error number rather than pass the negative value to
simple_read_from_buffer.

Addresses-Coverity: ("Improper use of negative value")
Fixes: 14e0e6796a0d ("OMAP: iommu: add initial debugfs support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iommu/omap-iommu-debug.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/omap-iommu-debug.c b/drivers/iommu/omap-iommu-debug.c
index 8e19bfa94121..a99afb5d9011 100644
--- a/drivers/iommu/omap-iommu-debug.c
+++ b/drivers/iommu/omap-iommu-debug.c
@@ -98,8 +98,11 @@ static ssize_t debug_read_regs(struct file *file, char __user *userbuf,
 	mutex_lock(&iommu_debug_lock);
 
 	bytes = omap_iommu_dump_ctx(obj, p, count);
+	if (bytes < 0)
+		goto err;
 	bytes = simple_read_from_buffer(userbuf, count, ppos, buf, bytes);
 
+err:
 	mutex_unlock(&iommu_debug_lock);
 	kfree(buf);
 
-- 
2.27.0
