From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Aug 2017 19:45:39 +0000
Subject: [media] as102_fe: Improve a size determination in as102_attach()
Message-Id: <45666d70-6afc-ccfe-c210-a3fb07ee1fb8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e27c8402-59fc-7e89-d461-d4c7c387d8bd@users.sourceforge.net>
In-Reply-To: <e27c8402-59fc-7e89-d461-d4c7c387d8bd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Aug 2017 21:30:38 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/as102_fe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/as102_fe.c b/drivers/media/dvb-frontends/as102_fe.c
index 1fb4ab21d786..b1c84ee914f0 100644
--- a/drivers/media/dvb-frontends/as102_fe.c
+++ b/drivers/media/dvb-frontends/as102_fe.c
@@ -455,7 +455,7 @@ struct dvb_frontend *as102_attach(const char *name,
 	struct as102_state *state;
 	struct dvb_frontend *fe;
 
-	state = kzalloc(sizeof(struct as102_state), GFP_KERNEL);
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return NULL;
 
-- 
2.14.1

