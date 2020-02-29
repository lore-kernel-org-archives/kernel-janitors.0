From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 29 Feb 2020 20:15:31 +0000
Subject: [PATCH] MAINTAINERS: adjust entry to refactoring smiapp.h
Message-Id: <20200229201531.6004-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: linux-media@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 7cbeb2e1bf0c ("media: smiapp: Move definitions under driver
directory") moved the definitions in include/media/i2c/smiapp.h into other
files and removed include/media/i2c/smiapp.h.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: include/media/i2c/smiapp.h

Remove MAINTAINER file entry to this removed file and while at it, update
Sakari's email address in this section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Sakari, please ack this patch.
Mauro, please pick this patch on your branch for linux-next.
applies cleanly on next-20200228

Sakari, I did not find an entry in mailmap to map your iki.fi mail address
to your latest mail address. There are also three further entries with
your iki.fi mail address in MAINTAINERS, that you could change to your
intel address.

 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 09b04505e7c3..33c8932a6756 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15392,11 +15392,10 @@ S:	Odd Fixes
 F:	drivers/net/ethernet/smsc/smc91x.*
 
 SMIA AND SMIA++ IMAGE SENSOR DRIVER
-M:	Sakari Ailus <sakari.ailus@iki.fi>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/smiapp/
-F:	include/media/i2c/smiapp.h
 F:	drivers/media/i2c/smiapp-pll.c
 F:	drivers/media/i2c/smiapp-pll.h
 F:	include/uapi/linux/smiapp.h
-- 
2.17.1
