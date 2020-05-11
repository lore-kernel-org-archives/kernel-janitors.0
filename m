From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 11 May 2020 19:28:44 +0000
Subject: [PATCH] MAINTAINERS: correct path in TEGRA VIDEO DRIVER
Message-Id: <20200511192844.11044-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver") added
the driver to drivers/staging/media/tegra-video/, but commit 2c6b617f2cca
("MAINTAINERS: Add Tegra Video driver section") added a file entry
referring to drivers/staging/media/tegra/.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:  drivers/staging/media/tegra/

Adjust the file entry in TEGRA VIDEO DRIVER to the correct path.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Sowjanya, please ack this minor patch.

applies cleanly on next-20200511

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0abba1aff1ae..dd310f1c3bb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16679,7 +16679,7 @@ L:	linux-media@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
-F:	drivers/staging/media/tegra/
+F:	drivers/staging/media/tegra-video/
 
 TEGRA XUSB PADCTL DRIVER
 M:	JC Kuo <jckuo@nvidia.com>
-- 
2.17.1
