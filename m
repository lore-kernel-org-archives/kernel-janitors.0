From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 07 Jan 2017 20:01:38 +0000
Subject: [PATCH 7/9] memstick: Improve another size determination in msb_read_boot_blocks()
Message-Id: <67fecf0a-9e26-c150-d123-ee5cf33c0397@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
In-Reply-To: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Maxim Levitsky <maximlevitsky@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Jan 2017 20:00:16 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/memstick/core/ms_block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index a30c0ae95ae5..98ab5764050b 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1202,7 +1202,7 @@ static int msb_read_boot_blocks(struct msb_data *msb)
 	dbg_verbose("Start of a scan for the boot blocks");
 
 	if (!msb->boot_page) {
-		page = kmalloc(sizeof(struct ms_boot_page)*2, GFP_KERNEL);
+		page = kmalloc(sizeof(*page) * 2, GFP_KERNEL);
 		if (!page)
 			return -ENOMEM;
 
-- 
2.11.0

