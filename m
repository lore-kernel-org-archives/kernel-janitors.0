From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 11:28:51 +0000
Subject: [PATCH 2/6] [media] tda8261: Improve a size determination in tda8261_attach()
Message-Id: <2225a61b-d990-e2fd-2217-5d860ed86a24@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <15d74bee-7467-4687-24e1-3501c22f6d75@users.sourceforge.net>
In-Reply-To: <15d74bee-7467-4687-24e1-3501c22f6d75@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 12:06:19 +0200

* The script "checkpatch.pl" pointed information out like the following.

  ERROR: do not use assignment in if condition

  Thus fix an affected source code place.

* Replace the specification of a data structure by a pointer dereference
  as the parameter for the operator "sizeof" to make the corresponding size
  determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/tda8261.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tda8261.c b/drivers/media/dvb-frontends/tda8261.c
index 5a8a9b6b8107..5269a170c84e 100644
--- a/drivers/media/dvb-frontends/tda8261.c
+++ b/drivers/media/dvb-frontends/tda8261.c
@@ -185,7 +185,8 @@ struct dvb_frontend *tda8261_attach(struct dvb_frontend *fe,
 {
 	struct tda8261_state *state = NULL;
 
-	if ((state = kzalloc(sizeof (struct tda8261_state), GFP_KERNEL)) = NULL)
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
 		goto exit;
 
 	state->config		= config;
-- 
2.14.1

