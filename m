From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 May 2017 20:08:25 +0000
Subject: [PATCH 2/2] regmap: Adjust five checks for null pointers in __regmap_init()
Message-Id: <4bca89e5-9d86-4ec9-1105-cc921c50f910@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d7b8131-5aea-cb33-994f-f410dc7cd615@users.sourceforge.net>
In-Reply-To: <7d7b8131-5aea-cb33-994f-f410dc7cd615@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 May 2017 21:52:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/base/regmap/regmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 096499e1f223..2b1f073b72a6 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -618,7 +618,7 @@ struct regmap *__regmap_init(struct device *dev,
 		goto err;
 
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
-	if (map = NULL) {
+	if (!map) {
 		ret = -ENOMEM;
 		goto err;
 	}
@@ -918,7 +918,7 @@ struct regmap *__regmap_init(struct device *dev,
 		goto err_map;
 
 	map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
-	if (map->work_buf = NULL) {
+	if (!map->work_buf) {
 		ret = -ENOMEM;
 		goto err_map;
 	}
@@ -993,7 +993,7 @@ struct regmap *__regmap_init(struct device *dev,
 		}
 
 		new = kzalloc(sizeof(*new), GFP_KERNEL);
-		if (new = NULL) {
+		if (!new) {
 			ret = -ENOMEM;
 			goto err_range;
 		}
@@ -1014,10 +1014,10 @@ struct regmap *__regmap_init(struct device *dev,
 			goto err_range;
 		}
 
-		if (map->selector_work_buf = NULL) {
+		if (!map->selector_work_buf) {
 			map->selector_work_buf  				kzalloc(map->format.buf_size, GFP_KERNEL);
-			if (map->selector_work_buf = NULL) {
+			if (!map->selector_work_buf) {
 				ret = -ENOMEM;
 				goto err_range;
 			}
-- 
2.13.0

