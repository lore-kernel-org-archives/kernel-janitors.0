From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 07 Jan 2017 19:57:46 +0000
Subject: [PATCH 5/9] memstick: Delete an unnecessary variable initialisation in msb_resume()
Message-Id: <bb2a9f55-c3e4-7f25-babd-2b77898277af@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
In-Reply-To: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Jan 2017 19:29:17 +0100

The local variable "new_msb" will eventually be set to an appropriate
pointer a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/memstick/core/ms_block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index fd3d9f78bcba..818c8f8de553 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -2253,7 +2253,7 @@ static int msb_suspend(struct memstick_dev *card, pm_message_t state)
 static int msb_resume(struct memstick_dev *card)
 {
 	struct msb_data *msb = memstick_get_drvdata(card);
-	struct msb_data *new_msb = NULL;
+	struct msb_data *new_msb;
 	bool card_dead = true;
 
 #ifndef CONFIG_MEMSTICK_UNSAFE_RESUME
-- 
2.11.0

