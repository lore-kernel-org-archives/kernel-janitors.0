From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 03 Nov 2020 06:07:33 +0000
Subject: [PATCH] MAINTAINERS: assign mediatek headers to Mediatek SoC support
Message-Id: <20201103060733.25729-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>

./include/soc/mediatek/smi.h and ./include/linux/soc/mediatek/infracfg.h
are currently not assigned to a specific section in MAINTAINERS.

./include/soc/mediatek/smi.h is the header file for definitions in
./drivers/memory/mtk-smi.c, which is assigned to the section ARM/Mediatek
SoC support in MAINTAINERS.

./include/linux/soc/mediatek/infracfg.h is the header file for definitions
in ./drivers/soc/mediatek/mtk-infracfg.c, which is assigned to the section
ARM/Mediatek SoC support in MAINTAINERS.

Hence, assign those header files to ARM/Mediatek SoC support as well.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Matthias, please pick this minor non-urgent cleanup patch.

This patch is part of an initial experiment to assign all files to
specific sections in MAINTAINERS. At the moment, about 3200 files are
currently not assigned to specific sections and maintainers.

If you think these cleanup patch cause more churn than value, please let
me know. Thanks.

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b4197e9da495..1703c7d2e146 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2066,6 +2066,8 @@ F:	arch/arm/boot/dts/mt8*
 F:	arch/arm/mach-mediatek/
 F:	arch/arm64/boot/dts/mediatek/
 F:	drivers/soc/mediatek/
+F:	include/linux/soc/mediatek/infracfg.h
+F:	include/soc/mediatek/smi.h
 N:	mtk
 N:	mt[678]
 K:	mediatek
-- 
2.17.1
