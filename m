From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 20:24:26 +0000
Subject: [PATCH 4/4] [media] ds3000: Delete jump targets in ds3000_attach()
Message-Id: <6845c215-eeb8-5286-6049-ea4befb645ae@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c854b845-3b79-ca7a-a597-4abc5f32ec54@users.sourceforge.net>
In-Reply-To: <c854b845-3b79-ca7a-a597-4abc5f32ec54@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 22:02:54 +0200

* Return directly after a call of the function "kzalloc" failed
  at the beginning.

* Move a bit of exception handling code into an if branch.

* Delete two jump targets which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/ds3000.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/dvb-frontends/ds3000.c b/drivers/media/dvb-frontends/ds3000.c
index 3e347d03acb3..bd4f8278c906 100644
--- a/drivers/media/dvb-frontends/ds3000.c
+++ b/drivers/media/dvb-frontends/ds3000.c
@@ -841,7 +841,7 @@ struct dvb_frontend *ds3000_attach(const struct ds3000_config *config,
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
-		goto error2;
+		return NULL;
 
 	state->config = config;
 	state->i2c = i2c;
@@ -850,8 +850,9 @@ struct dvb_frontend *ds3000_attach(const struct ds3000_config *config,
 	/* check if the demod is present */
 	ret = ds3000_readreg(state, 0x00) & 0xfe;
 	if (ret != 0xe0) {
+		kfree(state);
 		printk(KERN_ERR "Invalid probe, probably not a DS3000\n");
-		goto error3;
+		return NULL;
 	}
 
 	printk(KERN_INFO "DS3000 chip version: %d.%d attached.\n",
@@ -869,11 +870,6 @@ struct dvb_frontend *ds3000_attach(const struct ds3000_config *config,
 	 */
 	ds3000_set_voltage(&state->frontend, SEC_VOLTAGE_OFF);
 	return &state->frontend;
-
-error3:
-	kfree(state);
-error2:
-	return NULL;
 }
 EXPORT_SYMBOL(ds3000_attach);
 
-- 
2.14.1

