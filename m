From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 05 Jul 2020 06:59:17 +0000
Subject: [PATCH] MAINTAINERS: adjust entry to renaming and conversion
Message-Id: <20200705065917.22285-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Ondrej Jirman <megous@megous.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, linux-arm-kernel@lists.infradead.org

Commit a74e81a56405 ("drm/panel: rocktech-jh057n00900: Rename the driver to
st7703") and commit 7317f4574492 ("dt-bindings: panel: Convert
rocktech,jh057n00900 to yaml") renamed and converted the files mentioned in
DRM DRIVER FOR ROCKTECH JH057N00900 PANELS, but did not adjust the entries
in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains:

  warning: no file matches  F: \
  Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
  warning: no file matches  F: \
  drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c

Adjust entries after this file renaming and devicetree conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20200703

Ondrej, please ack this patch.
Sam, please pick this minor non-urgent patch into your -next tree.

This is the minimal change to address the warning. You might consider
changing the name of the section from ROCKTECH to ST7703, change
maintainers etc.

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9375edaef11f..8a7b92faff99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5493,8 +5493,8 @@ DRM DRIVER FOR ROCKTECH JH057N00900 PANELS
 M:	Guido G=C3=BCnther <agx@sigxcpu.org>
 R:	Purism Kernel Team <kernel@puri.sm>
 S:	Maintained
-F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
-F:	drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
+F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.ya=
ml
+F:	drivers/gpu/drm/panel/panel-sitronix-st7703.c
=20
 DRM DRIVER FOR SAVAGE VIDEO CARDS
 S:	Orphan / Obsolete
--=20
2.17.1
