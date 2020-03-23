From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 23 Mar 2020 18:45:01 +0000
Subject: [PATCH] MAINTAINERS: adjust entry to ICST clocks YAML schema creation
Message-Id: <20200323184501.5756-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-arm-kernel@lists.infradead.org

Commit 78c7d8f96b6f ("dt-bindings: clock: Create YAML schema for ICST
clocks") transformed arm-integrator.txt into arm,syscon-icst.yaml, but did
not adjust the reference to that file in the ARM INTEGRATOR, VERSATILE AND
REALVIEW SUPPORT entry in MAINTAINERS.

Hence, since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches \
  F: Documentation/devicetree/bindings/clock/arm-integrator.txt

Update the file entry in MAINTAINERS to the new transformed yaml file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20200323

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 07888a277f6f..69e94d712e8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1297,7 +1297,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/arm-boards
 F:	Documentation/devicetree/bindings/auxdisplay/arm-charlcd.txt
-F:	Documentation/devicetree/bindings/clock/arm-integrator.txt
+F:	Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
 F:	Documentation/devicetree/bindings/i2c/i2c-versatile.txt
 F:	Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
 F:	Documentation/devicetree/bindings/mtd/arm-versatile.txt
-- 
2.17.1
