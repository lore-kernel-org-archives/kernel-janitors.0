From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 07 Jan 2017 19:56:33 +0000
Subject: [PATCH 4/9] memstick: Improve two size determinations in msb_resume()
Message-Id: <9375faf8-986d-e642-df14-1dd2b97d7025@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
In-Reply-To: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Jan 2017 19:17:07 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/memstick/core/ms_block.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 526e671a3435..fd3d9f78bcba 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -2261,8 +2261,7 @@ static int msb_resume(struct memstick_dev *card)
 	return 0;
 #endif
 	mutex_lock(&card->host->lock);
-
-	new_msb = kzalloc(sizeof(struct msb_data), GFP_KERNEL);
+	new_msb = kzalloc(sizeof(*new_msb), GFP_KERNEL);
 	if (!new_msb)
 		goto out;
 
@@ -2277,8 +2276,9 @@ static int msb_resume(struct memstick_dev *card)
 	if (msb->block_size != new_msb->block_size)
 		goto out;
 
-	if (memcmp(msb->boot_page, new_msb->boot_page,
-					sizeof(struct ms_boot_page)))
+	if (memcmp(msb->boot_page,
+		   new_msb->boot_page,
+		   sizeof(*msb->boot_page)))
 		goto out;
 
 	if (msb->logical_block_count != new_msb->logical_block_count ||
-- 
2.11.0

