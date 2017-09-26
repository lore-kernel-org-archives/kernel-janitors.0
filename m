From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 11:32:26 +0000
Subject: [PATCH 4/6] [media] tda8261: Delete an unnecessary variable initialisation in tda8261_attach()
Message-Id: <f666b7ca-146e-6574-b066-2b1e034c26f5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <15d74bee-7467-4687-24e1-3501c22f6d75@users.sourceforge.net>
In-Reply-To: <15d74bee-7467-4687-24e1-3501c22f6d75@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 12:24:57 +0200

The local variable "state" is reassigned by a statement at the beginning.
Thus omit the explicit initialisation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/tda8261.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tda8261.c b/drivers/media/dvb-frontends/tda8261.c
index e3b4183d00c2..492d8c03a5fa 100644
--- a/drivers/media/dvb-frontends/tda8261.c
+++ b/drivers/media/dvb-frontends/tda8261.c
@@ -183,7 +183,7 @@ struct dvb_frontend *tda8261_attach(struct dvb_frontend *fe,
 				    const struct tda8261_config *config,
 				    struct i2c_adapter *i2c)
 {
-	struct tda8261_state *state = NULL;
+	struct tda8261_state *state;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
-- 
2.14.1

