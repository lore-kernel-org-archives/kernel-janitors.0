From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 20:22:17 +0000
Subject: [PATCH 2/4] [media] ds3000: Improve a size determination in ds3000_attach()
Message-Id: <01634417-dd3f-acc0-f550-11a33e5c2a59@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c854b845-3b79-ca7a-a597-4abc5f32ec54@users.sourceforge.net>
In-Reply-To: <c854b845-3b79-ca7a-a597-4abc5f32ec54@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 21:49:22 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/ds3000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/ds3000.c b/drivers/media/dvb-frontends/ds3000.c
index c2959a9695a7..988a464de3e9 100644
--- a/drivers/media/dvb-frontends/ds3000.c
+++ b/drivers/media/dvb-frontends/ds3000.c
@@ -839,7 +839,7 @@ struct dvb_frontend *ds3000_attach(const struct ds3000_config *config,
 	dprintk("%s\n", __func__);
 
 	/* allocate memory for the internal state */
-	state = kzalloc(sizeof(struct ds3000_state), GFP_KERNEL);
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		goto error2;
 
-- 
2.14.1

