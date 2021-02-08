From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 08 Feb 2021 07:16:19 +0000
Subject: [PATCH] MAINTAINERS: rectify BROADCOM PMB (POWER MANAGEMENT BUS) DRIVER
Message-Id: <20210208071619.3234-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 8bcac4011ebe ("soc: bcm: add PM driver for Broadcom's PMB") includes
a new MAINTAINERS section BROADCOM PMB (POWER MANAGEMENT BUS) DRIVER with
'drivers/soc/bcm/bcm-pmb.c', but the file was actually added at
'drivers/soc/bcm/bcm63xx/bcm-pmb.c'.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:    drivers/soc/bcm/bcm-pmb.c

Point the file entry to the right location.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210205

Rafal, please ack.
Florian, please pick this minor fixup patch for soc next tree.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b507e8d7828..c23731c88dc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3647,7 +3647,7 @@ M:	bcm-kernel-feedback-list@broadcom.com
 L:	linux-pm@vger.kernel.org
 S:	Maintained
 T:	git git://github.com/broadcom/stblinux.git
-F:	drivers/soc/bcm/bcm-pmb.c
+F:	drivers/soc/bcm/bcm63xx/bcm-pmb.c
 F:	include/dt-bindings/soc/bcm-pmb.h
 
 BROADCOM SPECIFIC AMBA DRIVER (BCMA)
-- 
2.17.1
