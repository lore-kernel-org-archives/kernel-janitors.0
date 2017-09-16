From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 16:19:34 +0000
Subject: [PATCH 2/2] [media] fc0012: Improve a size determination in fc0012_attach()
Message-Id: <27e2548c-09cb-2adb-9f65-f06c0e4ba86d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8f64b84d-cca0-d618-eb62-ec12f42b8c06@users.sourceforge.net>
In-Reply-To: <8f64b84d-cca0-d618-eb62-ec12f42b8c06@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 17:55:27 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/tuners/fc0012.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/fc0012.c b/drivers/media/tuners/fc0012.c
index 7126dd1d5151..c008513bd64a 100644
--- a/drivers/media/tuners/fc0012.c
+++ b/drivers/media/tuners/fc0012.c
@@ -445,5 +445,5 @@ struct dvb_frontend *fc0012_attach(struct dvb_frontend *fe,
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
 
-	priv = kzalloc(sizeof(struct fc0012_priv), GFP_KERNEL);
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
-- 
2.14.1

