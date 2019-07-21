From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 19:04:23 +0000
Subject: [PATCH] media: ov2680: fix a typo in a function name
Message-Id: <20190721190423.9534-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rmfrfs@gmail.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

All functions in this file starts with 'ov2680_', except ov2860_parse_dt().

This is likely a typo.
rename it to 'ov2680_parse_dt()' (6 and 8)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/i2c/ov2680.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index b10bcfabaeeb..c59c9e51c380 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1023,7 +1023,7 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
 	return 0;
 }
 
-static int ov2860_parse_dt(struct ov2680_dev *sensor)
+static int ov2680_parse_dt(struct ov2680_dev *sensor)
 {
 	struct device *dev = ov2680_to_dev(sensor);
 	int ret;
@@ -1064,7 +1064,7 @@ static int ov2680_probe(struct i2c_client *client)
 
 	sensor->i2c_client = client;
 
-	ret = ov2860_parse_dt(sensor);
+	ret = ov2680_parse_dt(sensor);
 	if (ret < 0)
 		return -EINVAL;
 
-- 
2.20.1
