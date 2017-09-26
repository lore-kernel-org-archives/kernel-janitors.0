From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 11:30:21 +0000
Subject: [PATCH 3/6] [media] tda8261: Return directly after a failed kzalloc() in tda8261_attach()
Message-Id: <6613af47-7855-2633-e4dd-40b259cb4dc4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <15d74bee-7467-4687-24e1-3501c22f6d75@users.sourceforge.net>
In-Reply-To: <15d74bee-7467-4687-24e1-3501c22f6d75@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 12:20:33 +0200

* Return directly after a call of the function "kzalloc" failed
  at the beginning.

* Delete a call of the function "kfree" and the jump target "exit"
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/tda8261.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda8261.c b/drivers/media/dvb-frontends/tda8261.c
index 5269a170c84e..e3b4183d00c2 100644
--- a/drivers/media/dvb-frontends/tda8261.c
+++ b/drivers/media/dvb-frontends/tda8261.c
@@ -187,7 +187,7 @@ struct dvb_frontend *tda8261_attach(struct dvb_frontend *fe,
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
-		goto exit;
+		return NULL;
 
 	state->config		= config;
 	state->i2c		= i2c;
@@ -200,10 +200,6 @@ struct dvb_frontend *tda8261_attach(struct dvb_frontend *fe,
 	pr_info("%s: Attaching TDA8261 8PSK/QPSK tuner\n", __func__);
 
 	return fe;
-
-exit:
-	kfree(state);
-	return NULL;
 }
 
 EXPORT_SYMBOL(tda8261_attach);
-- 
2.14.1

