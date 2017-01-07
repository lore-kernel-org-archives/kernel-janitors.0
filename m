From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 07 Jan 2017 20:03:30 +0000
Subject: [PATCH 8/9] memstick: Delete an unnecessary variable initialisation in msb_read_boot_blocks()
Message-Id: <116bf17b-a258-285d-3f56-709209883f78@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
In-Reply-To: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Jan 2017 20:02:24 +0100

The local variable "pba" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/memstick/core/ms_block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 98ab5764050b..861f6a76136d 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1190,7 +1190,7 @@ static void msb_fix_boot_page_endianness(struct ms_boot_page *p)
 
 static int msb_read_boot_blocks(struct msb_data *msb)
 {
-	int pba = 0;
+	int pba;
 	struct scatterlist sg;
 	struct ms_extra_data_register extra;
 	struct ms_boot_page *page;
-- 
2.11.0

