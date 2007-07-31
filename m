From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:23:36 +0000
Subject: [PATCH 16] drivers/md/dm-hw-handler.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311923.36235.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/md/dm-hw-handler.c | 4424 -> 4393 (-31 bytes)
 drivers/md/dm-hw-handler.o | 101828 -> 101652 (-176 bytes)

 drivers/md/dm-hw-handler.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/md/dm-hw-handler.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/md/dm-hw-handler.c	2007-07-31 11:28:10.000000000 +0200
@@ -91,12 +91,11 @@ void dm_put_hw_handler(struct hw_handler

 static struct hwh_internal *_alloc_hw_handler(struct hw_handler_type *hwht)
 {
-	struct hwh_internal *hwhi = kmalloc(sizeof(*hwhi), GFP_KERNEL);
-
-	if (hwhi) {
-		memset(hwhi, 0, sizeof(*hwhi));
+	struct hwh_internal *hwhi;
+
+	hwhi = kzalloc(sizeof(*hwhi), GFP_KERNEL);
+	if (hwhi)
 		hwhi->hwht = *hwht;
-	}

 	return hwhi;
 }
