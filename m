From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 02 Jun 2020 05:21:04 +0000
Subject: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
Message-Id: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 5c24a28b4eb8 ("dt-bindings: watchdog: Add ARM smc wdt for mt8173
watchdog") added the new ARM SMC WATCHDOG DRIVER entry in MAINTAINERS, but
slipped in a minor mistake.

Luckily, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F: devicetree/bindings/watchdog/arm-smc-wdt.yaml

Update file entry to intended file location.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Julius, Evan, please ack.

Wim, please pick this minor patch into your -next tree.

applies cleanly on next-20200529

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b045b70e54df..dcfb09700b96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1489,7 +1489,7 @@ ARM SMC WATCHDOG DRIVER
 M:	Julius Werner <jwerner@chromium.org>
 R:	Evan Benn <evanbenn@chromium.org>
 S:	Maintained
-F:	devicetree/bindings/watchdog/arm-smc-wdt.yaml
+F:	Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
 F:	drivers/watchdog/arm_smc_wdt.c
 
 ARM SMMU DRIVERS
-- 
2.17.1
