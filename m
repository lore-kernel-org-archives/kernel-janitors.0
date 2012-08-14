From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2012 07:03:35 +0000
Subject: [patch] [media] stk1160: remove unneeded check
Message-Id: <20120814070335.GE4791@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

"card" is a valid pointer here because we checked snd_card_create() for
error returns.  Checking after a dereference makes the static checkers
complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed on linux-next.

diff --git a/drivers/media/video/stk1160/stk1160-ac97.c b/drivers/media/video/stk1160/stk1160-ac97.c
index 8d325f5..c8583c2 100644
--- a/drivers/media/video/stk1160/stk1160-ac97.c
+++ b/drivers/media/video/stk1160/stk1160-ac97.c
@@ -133,8 +133,7 @@ int stk1160_ac97_register(struct stk1160 *dev)
 
 err:
 	dev->snd_card = NULL;
-	if (card)
-		snd_card_free(card);
+	snd_card_free(card);
 	return rc;
 }
 
