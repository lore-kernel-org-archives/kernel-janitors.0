From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 09 Oct 2020 04:16:21 +0000
Subject: [PATCH] MAINTAINERS: rectify ZR36067 VIDEO FOR LINUX DRIVER section
Message-Id: <20201009041621.17513-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corentin Labbe <clabbe@baylibre.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>

Commit 754f0f1ba8d9 ("media: MAINTAINERS: change maintainer of the zoran
driver") added a new section in MAINTAINERS with an invalid file entry
and at the wrong place for alphabetic ordering.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:  Documentation/media/v4l-drivers/zoran.rst

Point the file entry to the right location and move the section to the
right place in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20201008

Corentin, please ack.
Mauro, please pick this minor non-urgent cleanup patch into your -next tree.

 MAINTAINERS | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 239ae2425cf8..6879ca545677 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19412,6 +19412,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/zonefs.git
 F:	Documentation/filesystems/zonefs.rst
 F:	fs/zonefs/
 
+ZPOOL COMPRESSED PAGE STORAGE API
+M:	Dan Streetman <ddstreet@ieee.org>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	include/linux/zpool.h
+F:	mm/zpool.c
+
 ZR36067 VIDEO FOR LINUX DRIVER
 M:	Corentin Labbe <clabbe@baylibre.com>
 L:	mjpeg-users@lists.sourceforge.net
@@ -19419,16 +19426,9 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	http://mjpeg.sourceforge.net/driver-zoran/
 Q:	https://patchwork.linuxtv.org/project/linux-media/list/
-F:	Documentation/media/v4l-drivers/zoran.rst
+F:	Documentation/driver-api/media/drivers/v4l-drivers/zoran.rst
 F:	drivers/staging/media/zoran/
 
-ZPOOL COMPRESSED PAGE STORAGE API
-M:	Dan Streetman <ddstreet@ieee.org>
-L:	linux-mm@kvack.org
-S:	Maintained
-F:	include/linux/zpool.h
-F:	mm/zpool.c
-
 ZRAM COMPRESSED RAM BLOCK DEVICE DRVIER
 M:	Minchan Kim <minchan@kernel.org>
 M:	Nitin Gupta <ngupta@vflare.org>
-- 
2.17.1
