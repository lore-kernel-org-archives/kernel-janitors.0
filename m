From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 31 Aug 2017 19:56:44 +0000
Subject: [PATCH 1/3] [media] mb86a20s: Delete an error message for a failed memory allocation in mb86a20s_att
Message-Id: <b977ca6f-5839-380c-e4b1-0b6108fb4274@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9571ee6c-5137-15f4-4cdb-9f03b5cb9268@users.sourceforge.net>
In-Reply-To: <9571ee6c-5137-15f4-4cdb-9f03b5cb9268@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 31 Aug 2017 21:10:25 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/mb86a20s.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/mb86a20s.c b/drivers/media/dvb-frontends/mb86a20s.c
index e8ac8c3e2ec0..340984100aec 100644
--- a/drivers/media/dvb-frontends/mb86a20s.c
+++ b/drivers/media/dvb-frontends/mb86a20s.c
@@ -2075,8 +2075,5 @@ struct dvb_frontend *mb86a20s_attach(const struct mb86a20s_config *config,
-	if (state = NULL) {
-		dev_err(&i2c->dev,
-			"%s: unable to allocate memory for state\n", __func__);
+	if (!state)
 		goto error;
-	}
 
 	/* setup the state */
 	state->config = config;
-- 
2.14.1

