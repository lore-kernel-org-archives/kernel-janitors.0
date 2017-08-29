From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Aug 2017 19:44:40 +0000
Subject: [PATCH 1/2] [media] as102_fe: Delete an error message for a failed memory allocation in as102_attach
Message-Id: <9c0645bc-181a-4f34-49b7-8de4150b1555@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e27c8402-59fc-7e89-d461-d4c7c387d8bd@users.sourceforge.net>
In-Reply-To: <e27c8402-59fc-7e89-d461-d4c7c387d8bd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Aug 2017 21:26:12 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/as102_fe.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/as102_fe.c b/drivers/media/dvb-frontends/as102_fe.c
index 98d575f2744c..1fb4ab21d786 100644
--- a/drivers/media/dvb-frontends/as102_fe.c
+++ b/drivers/media/dvb-frontends/as102_fe.c
@@ -459,7 +459,6 @@ struct dvb_frontend *as102_attach(const char *name,
-	if (state = NULL) {
-		pr_err("%s: unable to allocate memory for state\n", __func__);
+	if (!state)
 		return NULL;
-	}
+
 	fe = &state->frontend;
 	fe->demodulator_priv = state;
 	state->ops = ops;
-- 
2.14.1

