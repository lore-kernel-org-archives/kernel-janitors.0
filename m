From: Julia Lawall <julia@diku.dk>
Date: Tue, 02 Aug 2011 10:34:59 +0000
Subject: [PATCH 6/11] drivers/iommu/iommu.c: trivial: use BUG_ON
Message-Id: <1312281304-11847-7-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>, trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, Joerg Roedel <joerg.roedel@amd.com>, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use BUG_ON(x) rather than if(x) BUG();

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ identifier x; @@
-if (x) BUG();
+BUG_ON(x);

@@ identifier x; @@
-if (!x) BUG();
+BUG_ON(!x);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/iommu/iommu.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -27,8 +27,7 @@ static struct iommu_ops *iommu_ops;
 
 void register_iommu(struct iommu_ops *ops)
 {
-	if (iommu_ops)
-		BUG();
+	BUG_ON(iommu_ops);
 
 	iommu_ops = ops;
 }

