From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 07:22:07 +0000
Subject: [PATCH 4/6] [media] cx24116: Improve a size determination in cx24116_attach()
Message-Id: <e4cf3adb-0a9b-c412-0720-944a9dfd0ffc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d01b4a11-6e93-bc40-72de-dab9ce7b997a@users.sourceforge.net>
In-Reply-To: <d01b4a11-6e93-bc40-72de-dab9ce7b997a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 08:15:33 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/cx24116.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cx24116.c b/drivers/media/dvb-frontends/cx24116.c
index 54f09a5a5075..74d610207bf2 100644
--- a/drivers/media/dvb-frontends/cx24116.c
+++ b/drivers/media/dvb-frontends/cx24116.c
@@ -1123,7 +1123,7 @@ struct dvb_frontend *cx24116_attach(const struct cx24116_config *config,
 	dprintk("%s\n", __func__);
 
 	/* allocate memory for the internal state */
-	state = kzalloc(sizeof(struct cx24116_state), GFP_KERNEL);
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state = NULL)
 		goto error1;
 
-- 
2.14.1

