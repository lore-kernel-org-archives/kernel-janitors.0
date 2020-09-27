From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:24 +0000
Subject: [PATCH 14/18] regmap: debugfs: use semicolons rather than commas to separate statements
Message-Id: <1601233948-11629-15-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/base/regmap/regmap-debugfs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
index b6d63ef16b44..8dfac7f3ed7a 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -183,7 +183,7 @@ static inline void regmap_calc_tot_len(struct regmap *map,
 {
 	/* Calculate the length of a fixed format  */
 	if (!map->debugfs_tot_len) {
-		map->debugfs_reg_len = regmap_calc_reg_len(map->max_register),
+		map->debugfs_reg_len = regmap_calc_reg_len(map->max_register);
 		map->debugfs_val_len = 2 * map->format.val_bytes;
 		map->debugfs_tot_len = map->debugfs_reg_len +
 			map->debugfs_val_len + 3;      /* : \n */
