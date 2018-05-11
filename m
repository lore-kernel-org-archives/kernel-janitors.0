From: Colin King <colin.king@canonical.com>
Date: Fri, 11 May 2018 14:18:13 +0000
Subject: [PATCH] media: dvb_frontends: fix spelling mistake: "unexpcted" -> "unexpected"
Message-Id: <20180511141813.26739-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dprintk message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/l64781.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/l64781.c b/drivers/media/dvb-frontends/l64781.c
index e056f36e6f0c..249c18761e6e 100644
--- a/drivers/media/dvb-frontends/l64781.c
+++ b/drivers/media/dvb-frontends/l64781.c
@@ -546,7 +546,7 @@ struct dvb_frontend* l64781_attach(const struct l64781_config* config,
 
 	/* Responds to all reads with 0 */
 	if (l64781_readreg(state, 0x1a) != 0) {
-		dprintk("Read 1 returned unexpcted value\n");
+		dprintk("Read 1 returned unexpected value\n");
 		goto error;
 	}
 
@@ -555,7 +555,7 @@ struct dvb_frontend* l64781_attach(const struct l64781_config* config,
 
 	/* Responds with register default value */
 	if (l64781_readreg(state, 0x1a) != 0xa1) {
-		dprintk("Read 2 returned unexpcted value\n");
+		dprintk("Read 2 returned unexpected value\n");
 		goto error;
 	}
 
-- 
2.17.0

