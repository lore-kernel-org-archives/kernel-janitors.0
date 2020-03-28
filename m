From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 28 Mar 2020 13:43:04 +0000
Subject: [PATCH] MAINTAINERS: clarify maintenance of ARM Dove drivers
Message-Id: <20200328134304.7317-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <rmk+kernel@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>
Cc: Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Commit 44e259ac909f ("ARM: dove: create a proper PMU driver for power
domains, PMU IRQs and resets") introduced new drivers for the ARM Dove SOC,
but did not add those drivers to the existing entry ARM/Marvell
Dove/MV78xx0/Orion SOC support in MAINTAINERS. Hence, these drivers were
considered to be part of "THE REST".

Clarify now that these drivers are maintained by the ARM/Marvell
Dove/MV78xx0/Orion SOC support maintainers. Also order the T: entry to the
place it belongs to, while at it.

This was identified with a small script that finds all files only belonging
to "THE REST" according to the current MAINTAINERS file, and I acted upon
its output.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and on next-20200327

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b8abe756ae0..38fff0374082 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1979,6 +1979,7 @@ M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
 M:	Gregory Clement <gregory.clement@bootlin.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+T:	git git://git.infradead.org/linux-mvebu.git
 F:	Documentation/devicetree/bindings/soc/dove/
 F:	arch/arm/mach-dove/
 F:	arch/arm/mach-mv78xx0/
@@ -1986,7 +1987,7 @@ F:	arch/arm/mach-orion5x/
 F:	arch/arm/plat-orion/
 F:	arch/arm/boot/dts/dove*
 F:	arch/arm/boot/dts/orion5x*
-T:	git git://git.infradead.org/linux-mvebu.git
+F:	drivers/soc/dove/
 
 ARM/Marvell Kirkwood and Armada 370, 375, 38x, 39x, XP, 3700, 7K/8K, CN9130 SOC support
 M:	Jason Cooper <jason@lakedaemon.net>
-- 
2.17.1
