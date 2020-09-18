From: Colin King <colin.king@canonical.com>
Date: Fri, 18 Sep 2020 13:11:58 +0000
Subject: [PATCH][next] regmap: fix return of unintialized value in variable ret
Message-Id: <20200918131158.24083-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A recent commit removed the intialization of ret and now the !config
error return path returns a bogus uninitialized value in ret. Fix
this by explicitly setting ret to -EINVAL for this error exit path.

Addresses-Coverity: ("Uninitialized scalar value")
Fixes: 94cc89eb8fa5 ("regmap: debugfs: Fix handling of name string for debugfs init delays")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/base/regmap/regmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index d0f7cc574ff3..bd385b82f30b 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -710,8 +710,10 @@ struct regmap *__regmap_init(struct device *dev,
 	int i, j;
 	int ret;
 
-	if (!config)
+	if (!config) {
+		ret = -EINVAL;
 		goto err;
+	}
 
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
 	if (map = NULL) {
-- 
2.27.0
