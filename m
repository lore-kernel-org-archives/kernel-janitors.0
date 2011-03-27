From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 27 Mar 2011 02:42:31 +0000
Subject: [PATCH 1/3] tg3: use <linux/io.h> and <linux/uaccess.h> instead <asm/io.h> and <asm/uaccess.h>
Message-Id: <1301193753-10045-1-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Carlson <mcarlson@broadcom.com>
Cc: Michael Chan <mchan@broadcom.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Javier Martinez Canillas <martinez.javier@gmail.com>

It is proper style to include linux/foo.h instead asm/foo.h if both exist

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/net/tg3.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/tg3.c b/drivers/net/tg3.c
index 6be4185..4410d73 100644
--- a/drivers/net/tg3.c
+++ b/drivers/net/tg3.c
@@ -48,9 +48,9 @@
 #include <net/ip.h>
 
 #include <asm/system.h>
-#include <asm/io.h>
+#include <linux/io.h>
 #include <asm/byteorder.h>
-#include <asm/uaccess.h>
+#include <linux/uaccess.h>
 
 #ifdef CONFIG_SPARC
 #include <asm/idprom.h>
-- 
1.7.2.3

