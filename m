From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 20:23:15 +0000
Subject: [PATCH 3/4] [media] ds3000: Delete an unnecessary variable initialisation in ds3000_attach()
Message-Id: <a7e259a5-88a6-4967-d8e0-50217b9eb6f5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c854b845-3b79-ca7a-a597-4abc5f32ec54@users.sourceforge.net>
In-Reply-To: <c854b845-3b79-ca7a-a597-4abc5f32ec54@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 21:51:26 +0200

The variable "state" will be set to an appropriate pointer a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/ds3000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/ds3000.c b/drivers/media/dvb-frontends/ds3000.c
index 988a464de3e9..3e347d03acb3 100644
--- a/drivers/media/dvb-frontends/ds3000.c
+++ b/drivers/media/dvb-frontends/ds3000.c
@@ -833,7 +833,7 @@ static const struct dvb_frontend_ops ds3000_ops;
 struct dvb_frontend *ds3000_attach(const struct ds3000_config *config,
 				    struct i2c_adapter *i2c)
 {
-	struct ds3000_state *state = NULL;
+	struct ds3000_state *state;
 	int ret;
 
 	dprintk("%s\n", __func__);
-- 
2.14.1

