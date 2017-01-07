From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 07 Jan 2017 19:58:50 +0000
Subject: [PATCH 6/9] memstick: Improve a size determination in msb_probe()
Message-Id: <f7ef764b-3885-e83e-254d-883709764734@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
In-Reply-To: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Jan 2017 19:36:21 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/memstick/core/ms_block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 818c8f8de553..a30c0ae95ae5 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -2188,7 +2188,7 @@ static int msb_probe(struct memstick_dev *card)
 	struct msb_data *msb;
 	int rc = 0;
 
-	msb = kzalloc(sizeof(struct msb_data), GFP_KERNEL);
+	msb = kzalloc(sizeof(*msb), GFP_KERNEL);
 	if (!msb)
 		return -ENOMEM;
 	memstick_set_drvdata(card, msb);
-- 
2.11.0

