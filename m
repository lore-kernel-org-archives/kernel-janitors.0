From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Jan 2014 05:41:04 +0000
Subject: [patch] regmap: fix a potential leak in regmap_bulk_write()
Message-Id: <20140109054104.GH1265@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain that there is an error path where
_regmap_raw_write() fails and we goto out without freeing the "wval"
buffer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 062f59860091..939f9b26d5ee 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1514,7 +1514,7 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 {
 	int ret = 0, i;
 	size_t val_bytes = map->format.val_bytes;
-	void *wval;
+	void *wval = NULL;
 
 	if (!map->bus)
 		return -EINVAL;
@@ -1555,10 +1555,10 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 		ret = _regmap_raw_write(map, reg, wval, val_bytes * val_count);
 	}
 
-	if (val_bytes != 1)
-		kfree(wval);
 
 out:
+	if (val_bytes != 1)
+		kfree(wval);
 	map->unlock(map->lock_arg);
 	return ret;
 }
