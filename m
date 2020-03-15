From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 15 Mar 2020 07:21:09 +0000
Subject: [PATCH] MAINTAINERS: adjust to VIVANTE GPU schema conversion
Message-Id: <20200315072109.6815-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Gaignard <benjamin.gaignard@st.com>, Rob Herring <robh@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 90aeca875f8a ("dt-bindings: display: Convert etnaviv to
json-schema") missed to adjust the DRM DRIVERS FOR VIVANTE GPU IP entry
in MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches \
  F: Documentation/devicetree/bindings/display/etnaviv/

Update MAINTAINERS entry to location of converted schema.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20200313

Benjamin, please ack.
Rob, please pick this patch (it is not urgent, though)


 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77eede976d0f..50a7a6d62e06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5766,7 +5766,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	drivers/gpu/drm/etnaviv/
 F:	include/uapi/drm/etnaviv_drm.h
-F:	Documentation/devicetree/bindings/display/etnaviv/
+F:	Documentation/devicetree/bindings/gpu/vivante,gc.yaml
 
 DRM DRIVERS FOR ZTE ZX
 M:	Shawn Guo <shawnguo@kernel.org>
-- 
2.17.1
