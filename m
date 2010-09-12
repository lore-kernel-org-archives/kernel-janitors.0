From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 12 Sep 2010 18:57:14 +0000
Subject: [PATCH] char: hvc: check for error case
Message-Id: <1284317835-5086-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Chris Metcalf <cmetcalf@tilera.com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Paul Mundt <lethal@linux-sh.org>, linuxppc-dev@lists.ozlabs.org

hvc_alloc() may fail, if so exit from init() with error.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 I cannot compile this driver at all, so it is not tested.

 drivers/char/hvc_tile.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hvc_tile.c b/drivers/char/hvc_tile.c
index c4efb55..7a84a05 100644
--- a/drivers/char/hvc_tile.c
+++ b/drivers/char/hvc_tile.c
@@ -61,7 +61,8 @@ console_initcall(hvc_tile_console_init);
 
 static int __init hvc_tile_init(void)
 {
-	hvc_alloc(0, 0, &hvc_tile_get_put_ops, 128);
-	return 0;
+	struct hvc_struct *s;
+	s = hvc_alloc(0, 0, &hvc_tile_get_put_ops, 128);
+	return IS_ERR(s) ? PTR_ERR(s) : 0;
 }
 device_initcall(hvc_tile_init);
-- 
1.7.0.4

