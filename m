From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 25 Aug 2020 05:38:28 +0000
Subject: [PATCH v2] MAINTAINERS: update QUALCOMM IOMMU after Arm SMMU drivers move
Message-Id: <20200825053828.4166-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org

Commit e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own
subdirectory") moved drivers/iommu/qcom_iommu.c to
drivers/iommu/arm/arm-smmu/qcom_iommu.c amongst other moves, adjusted some
sections in MAINTAINERS, but missed adjusting the QUALCOMM IOMMU section.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    drivers/iommu/qcom_iommu.c

Update the file entry in MAINTAINERS to the new location.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Acked-by: Will Deacon <will@kernel.org>
---
v1: https://lore.kernel.org/lkml/20200802065320.7470-1-lukas.bulwahn@gmail.com/
v1 -> v2: typo fixed; added Will's Ack.

Joerg, please pick this minor non-urgent patch for your -next branch.

applies cleanly on next-20200731

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1469cb81261d..e175c0741653 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14358,7 +14358,7 @@ M:	Rob Clark <robdclark@gmail.com>
 L:	iommu@lists.linux-foundation.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-F:	drivers/iommu/qcom_iommu.c
+F:	drivers/iommu/arm/arm-smmu/qcom_iommu.c
 
 QUALCOMM IPCC MAILBOX DRIVER
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-- 
2.17.1
