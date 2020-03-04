From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 04 Mar 2020 21:26:00 +0000
Subject: [PATCH v2] MAINTAINERS: update ALLWINNER CPUFREQ DRIVER entry
Message-Id: <20200304212600.6172-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chen-Yu Tsai <wens@csie.org>, Yangtao Li <tiny.windzz@gmail.com>, Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh@kernel.org>
Cc: linux-pm@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit b30d8cf5e171 ("dt-bindings: opp: Convert Allwinner H6 OPP to a
schema") converted in Documentation/devicetree/bindings/opp/ the file
sun50i-nvmem-cpufreq.txt to allwinner,sun50i-h6-operating-points.yaml.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches \
  F: Documentation/devicetree/bindings/opp/sun50i-nvmem-cpufreq.txt

Adjust the file pattern in the ALLWINNER CPUFREQ DRIVER entry.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Changes to v1:
  - do not include new maintainers because it is not needed.

Maxime, Chen-Yu, Yangtao, please ack.
Rob, please pick this patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6158a143a13e..9402b05630f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -693,7 +693,7 @@ ALLWINNER CPUFREQ DRIVER
 M:	Yangtao Li <tiny.windzz@gmail.com>
 L:	linux-pm@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/opp/sun50i-nvmem-cpufreq.txt
+F:	Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
 F:	drivers/cpufreq/sun50i-cpufreq-nvmem.c
 
 ALLWINNER CRYPTO DRIVERS
-- 
2.17.1
