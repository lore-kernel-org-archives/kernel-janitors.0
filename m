From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Mar 2014 08:29:50 +0000
Subject: [patch] iommu/vt-d: returning free pointer in get_domain_for_dev()
Message-Id: <20140328082950.GN25192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org

If we hit this error condition then we want to return a NULL pointer and
not a freed variable.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 6fbce01..69fa7da 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2257,6 +2257,7 @@ static struct dmar_domain *get_domain_for_dev(struct device *dev, int gaw)
 		goto error;
 	if (iommu_attach_domain(domain, iommu)) {
 		free_domain_mem(domain);
+		domain = NULL;
 		goto error;
 	}
 	free = domain;
