From: Colin King <colin.king@canonical.com>
Date: Thu, 16 Jan 2020 17:09:00 +0000
Subject: [PATCH][next] power: supply: bq25890_charger: fix incorrect error return when bq25890_field_read fai
Message-Id: <20200116170900.86548-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Yauhen Kharuzhy <jekhor@gmail.com>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently a read failure by bq25890_field_read on F_DEV_REV is returning
an error in id instead of rev. Fix this by returning the value in rev.

Addresses-Coverity: ("Copy-paste error")
Fixes: d20267c9a98e ("power: supply: bq25890_charger: Add support of BQ25892 and BQ25896 chips")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/bq25890_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/supply/bq25890_charger.c
index 785dbc6307b0..aebd1253dbc9 100644
--- a/drivers/power/supply/bq25890_charger.c
+++ b/drivers/power/supply/bq25890_charger.c
@@ -765,7 +765,7 @@ static int bq25890_get_chip_version(struct bq25890_device *bq)
 	rev = bq25890_field_read(bq, F_DEV_REV);
 	if (rev < 0) {
 		dev_err(bq->dev, "Cannot read chip revision.\n");
-		return id;
+		return rev;
 	}
 
 	switch (id) {
-- 
2.24.0
