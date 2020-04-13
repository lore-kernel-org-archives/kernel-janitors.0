From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 13 Apr 2020 07:53:29 +0000
Subject: [PATCH] MAINTAINERS: point to display schemas in DRM DRIVERS FOR ALLWINNER A10
Message-Id: <20200413075329.10717-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display
pipeline to schemas") replaced sunxi/sun4i-drm.txt with
allwinner,sun*.yaml files in Documentation/devicetree/bindings/display/,
but did not adjust DRM DRIVERS FOR ALLWINNER A10.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches \
  F: Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt

Point to allwinner display schemas in DRM DRIVERS FOR ALLWINNER A10.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Maxime, please ack.
Rob, please pick this non-urgent minor clean-up patch.


 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..1f6c9bec872a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5552,7 +5552,7 @@ M:	Chen-Yu Tsai <wens@csie.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+F:	Documentation/devicetree/bindings/display/allwinner,sun*.yaml
 F:	drivers/gpu/drm/sun4i/
 
 DRM DRIVERS FOR AMLOGIC SOCS
-- 
2.17.1
