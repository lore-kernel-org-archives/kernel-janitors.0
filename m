From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 04 Mar 2020 12:07:11 +0000
Subject: [PATCH] MAINTAINERS: adjust to reservation.h renaming
Message-Id: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Sebastian Duda <sebastian.duda@fau.de>, linux-media@vger.kernel.org

Commit 52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
renamed include/linux/reservation.h to include/linux/dma-resv.h, but
missed the reference in the MAINTAINERS entry.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: include/linux/reservation.h

Adjust the DMA BUFFER SHARING FRAMEWORK entry in MAINTAINERS.

Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Christian, please pick this patch.
applies cleanly on current master and next-20200303

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6158a143a13e..3d6cb2789c9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5022,7 +5022,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 F:	drivers/dma-buf/
 F:	include/linux/dma-buf*
-F:	include/linux/reservation.h
+F:	include/linux/dma-resv.h
 F:	include/linux/*fence.h
 F:	Documentation/driver-api/dma-buf.rst
 K:	dma_(buf|fence|resv)
-- 
2.17.1
