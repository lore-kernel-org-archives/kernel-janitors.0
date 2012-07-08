From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 08 Jul 2012 11:37:42 +0000
Subject: [PATCH 5/7] drivers/iommu/tegra-smmu.c: remove invalid reference to list iterator variable
Message-Id: <1341747464-1772-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341747464-1772-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341747464-1772-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

If list_for_each_entry, etc complete a traversal of the list, the iterator
variable ends up pointing to an address at an offset from the list head,
and not a meaningful structure.  Thus this value should not be used after
the end of the iterator.  Replace c->dev by dev, which is the value that
c->dev has been compared to.

This problem was found using Coccinelle (http://coccinelle.lip6.fr/).

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/iommu/tegra-smmu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 3757bb5..d3fbf37 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -780,7 +780,7 @@ static void smmu_iommu_detach_dev(struct iommu_domain *domain,
 			goto out;
 		}
 	}
-	dev_err(smmu->dev, "Couldn't find %s\n", dev_name(c->dev));
+	dev_err(smmu->dev, "Couldn't find %s\n", dev_name(dev));
 out:
 	spin_unlock(&as->client_lock);
 }

