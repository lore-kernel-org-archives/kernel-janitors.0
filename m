From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 02 Mar 2009 00:00:41 +0000
Subject: [PATCH] IOMMU: use ANSI style function declaration for 'iommu_found'
Message-Id: <20090302000010.14884.9400.stgit@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  drivers/base/iommu.c:34:18: warning: non-ANSI function declaration of function 'iommu_found'

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/base/iommu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/base/iommu.c b/drivers/base/iommu.c
index 5e039d4..c2d1eed 100644
--- a/drivers/base/iommu.c
+++ b/drivers/base/iommu.c
@@ -31,7 +31,7 @@ void register_iommu(struct iommu_ops *ops)
 	iommu_ops = ops;
 }
 
-bool iommu_found()
+bool iommu_found(void)
 {
 	return iommu_ops != NULL;
 }

