From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jan 2021 11:42:29 +0000
Subject: [PATCH] regmap: debugfs: Fix a reversed if statement in regmap_debugfs_init()
Message-Id: <X/RQpfAwRdLg0GqQ@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This code will leak "map->debugfs_name" because the if statement is
reversed so it only frees NULL pointers instead of non-NULL.  In
fact the if statement is not required and should just be removed
because kfree() accepts NULL pointers.

Fixes: cffa4b2122f5 ("regmap: debugfs: Fix a memory leak when calling regmap_attach_dev")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/base/regmap/regmap-debugfs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
index bf03cd343be2..ff2ee87987c7 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -594,9 +594,7 @@ void regmap_debugfs_init(struct regmap *map)
 	}
 
 	if (!strcmp(name, "dummy")) {
-		if (!map->debugfs_name)
-			kfree(map->debugfs_name);
-
+		kfree(map->debugfs_name);
 		map->debugfs_name = kasprintf(GFP_KERNEL, "dummy%d",
 						dummy_index);
 		if (!map->debugfs_name)
-- 
2.29.2
