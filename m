From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 May 2017 20:07:18 +0000
Subject: [PATCH 1/2] regmap: Delete an error message for a failed memory allocation in regmap_bulk_write()
Message-Id: <56cba529-03eb-9088-3fea-8fbb50c355af@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d7b8131-5aea-cb33-994f-f410dc7cd615@users.sourceforge.net>
In-Reply-To: <7d7b8131-5aea-cb33-994f-f410dc7cd615@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 May 2017 21:43:58 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/base/regmap/regmap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index b9a779a4a739..096499e1f223 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1945,10 +1945,9 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 			return -EINVAL;
 
 		wval = kmemdup(val, val_count * val_bytes, map->alloc_flags);
-		if (!wval) {
-			dev_err(map->dev, "Error in memory allocation\n");
+		if (!wval)
 			return -ENOMEM;
-		}
+
 		for (i = 0; i < val_count * val_bytes; i += val_bytes)
 			map->format.parse_inplace(wval + i);
 
-- 
2.13.0

