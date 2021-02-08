From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 08 Feb 2021 06:10:25 +0000
Subject: [PATCH] MAINTAINERS: repair file pattern in MEDIATEK IOMMU DRIVER
Message-Id: <20210208061025.29198-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yong Wu <yong.wu@mediatek.com>, linux-mediatek@lists.infradead.org, iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>

Commit 6af4873852c4 ("MAINTAINERS: Add entry for MediaTek IOMMU") mentions
the pattern 'drivers/iommu/mtk-iommu*', but the files are actually named
with an underscore, not with a hyphen.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:    drivers/iommu/mtk-iommu*

Repair this minor typo in the file pattern.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210205

Yong, please ack.
Will, please pick this minor fixup for your iommu-next tree.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 674f42375acf..6b507e8d7828 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11200,7 +11200,7 @@ L:	iommu@lists.linux-foundation.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/iommu/mediatek*
-F:	drivers/iommu/mtk-iommu*
+F:	drivers/iommu/mtk_iommu*
 F:	include/dt-bindings/memory/mt*-port.h
 
 MEDIATEK JPEG DRIVER
-- 
2.17.1
