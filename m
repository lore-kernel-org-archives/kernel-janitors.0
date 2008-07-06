From: "Alexander Beregalov" <a.beregalov@gmail.com>
Date: Sun, 06 Jul 2008 11:31:55 +0000
Subject: [PATCH] drm_memory.h: remove double inclusion of linux/vmalloc.h
Message-Id: <a4423d670807060431w639f0b1ajcbad6471d50ef802@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, airlied@linux.ie, dri-devel@lists.sourceforge.net, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

From: Alexander Beregalov <a.beregalov@gmail.com>

Remove double inclusion of linux/vmalloc.h

drivers/char/drm/drm_memory.h |    2 --
1 files changed, 0 insertions(+), 2 deletions(-)

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

diff --git a/drivers/char/drm/drm_memory.h b/drivers/char/drm/drm_memory.h
index 63e425b..15af9b3 100644
--- a/drivers/char/drm/drm_memory.h
+++ b/drivers/char/drm/drm_memory.h
@@ -44,8 +44,6 @@

 #if __OS_HAS_AGP

-#include <linux/vmalloc.h>
-
 #ifdef HAVE_PAGE_AGP
 #include <asm/agp.h>
 #else
