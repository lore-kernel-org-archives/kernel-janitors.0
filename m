From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Aug 2017 20:32:30 +0000
Subject: [PATCH 2/3] [media] cx24113: Return directly after a failed kzalloc() in cx24113_attach()
Message-Id: <935e3259-e764-8395-84c8-def879f0bbbc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <36a5402f-c7a2-edf0-1af8-b98b0684d8e5@users.sourceforge.net>
In-Reply-To: <36a5402f-c7a2-edf0-1af8-b98b0684d8e5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Aug 2017 22:10:49 +0200

Return directly after a call of the function "kzalloc" failed
at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/cx24113.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cx24113.c b/drivers/media/dvb-frontends/cx24113.c
index 8fc7333c76b7..09c3fd1840f2 100644
--- a/drivers/media/dvb-frontends/cx24113.c
+++ b/drivers/media/dvb-frontends/cx24113.c
@@ -557,7 +557,7 @@ struct dvb_frontend *cx24113_attach(struct dvb_frontend *fe,
 	int rc;
 
 	if (!state)
-		goto error;
+		return NULL;
 
 	/* setup the state */
 	state->config = config;
-- 
2.14.1

