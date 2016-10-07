From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 07 Oct 2016 19:46:21 +0000
Subject: [PATCH 2/2] [media] dvb-tc90522: Rename a jump label in tc90522_probe()
Message-Id: <7cee472f-4dad-7306-ed14-098bef5f862c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <906cc86f-bac0-fd47-8a6f-d3310b10fd08@users.sourceforge.net>
In-Reply-To: <906cc86f-bac0-fd47-8a6f-d3310b10fd08@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Akihiro Tsukada <tskd08@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Ira Krufky <mkrufky@linuxtv.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 7 Oct 2016 21:13:57 +0200

Adjust a jump label according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/tc90522.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/tc90522.c b/drivers/media/dvb-frontends/tc90522.c
index c2d45f0..4687e15 100644
--- a/drivers/media/dvb-frontends/tc90522.c
+++ b/drivers/media/dvb-frontends/tc90522.c
@@ -794,14 +794,13 @@ static int tc90522_probe(struct i2c_client *client,
 	i2c_set_adapdata(adap, state);
 	ret = i2c_add_adapter(adap);
 	if (ret < 0)
-		goto err;
+		goto free_state;
 	cfg->tuner_i2c = state->cfg.tuner_i2c = adap;
 
 	i2c_set_clientdata(client, &state->cfg);
 	dev_info(&client->dev, "Toshiba TC90522 attached.\n");
 	return 0;
-
-err:
+free_state:
 	kfree(state);
 	return ret;
 }
-- 
2.10.1

