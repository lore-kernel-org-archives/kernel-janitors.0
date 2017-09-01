From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 01 Sep 2017 19:43:42 +0000
Subject: [PATCH 2/4] [media] sp2: Improve a size determination in sp2_probe()
Message-Id: <f07cbc6e-9179-6270-31a6-0fa55cb57f02@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6142ca34-fcda-f2b6-bc35-dbbde0d34378@users.sourceforge.net>
In-Reply-To: <6142ca34-fcda-f2b6-bc35-dbbde0d34378@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Olli Salonen <olli.salonen@iki.fi>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 1 Sep 2017 20:46:18 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/sp2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/sp2.c b/drivers/media/dvb-frontends/sp2.c
index d3b4f8822096..dd556012ceb6 100644
--- a/drivers/media/dvb-frontends/sp2.c
+++ b/drivers/media/dvb-frontends/sp2.c
@@ -381,6 +381,6 @@ static int sp2_probe(struct i2c_client *client,
 
 	dev_dbg(&client->dev, "\n");
 
-	s = kzalloc(sizeof(struct sp2), GFP_KERNEL);
+	s = kzalloc(sizeof(*s), GFP_KERNEL);
 	if (!s) {
 		ret = -ENOMEM;
-- 
2.14.1

