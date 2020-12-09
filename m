From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 09 Dec 2020 07:46:58 +0000
Subject: [PATCH] media: MAINTAINERS: correct entry in Amlogic GE2D driver section
Message-Id: <20201209074658.11557-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Armstrong <narmstrong@baylibre.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org

Commit aa821b2b9269 ("media: MAINTAINERS: Add myself as maintainer of the
Amlogic GE2D driver") introduced a new MAINTAINERS section, but the file
entry points to the wrong location.

Hence, ./scripts/get_maintainer.pl --self-test=patterns warns:

  warning: no file matches    F:    drivers/media/meson/ge2d/

Adjust the entry to the actual location of the driver.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies on next-20201208, not on current master

Neil, please ack.
Hans, Mauro, please pick this minor non-urgent fix-up for your -next tree.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b20babb9f7b..d66bf50fc640 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11520,7 +11520,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
-F:	drivers/media/meson/ge2d/
+F:	drivers/media/platform/meson/ge2d/
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
-- 
2.17.1
