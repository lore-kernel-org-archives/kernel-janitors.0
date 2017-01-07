From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 07 Jan 2017 20:04:54 +0000
Subject: [PATCH 9/9] memstick: Delete an unnecessary check in msb_update_block()
Message-Id: <44ade3ec-9c63-d08b-4544-b0a48ac13594@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
In-Reply-To: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Jan 2017 20:21:02 +0100

Further exception handling will only be performed after an error code
was set. Thus remove a redundant check for a local variable at the end.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/memstick/core/ms_block.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 861f6a76136d..013f317d566b 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1154,10 +1154,8 @@ static int msb_update_block(struct msb_data *msb, u16 lba,
 		return 0;
 	}
 out:
-	if (error) {
-		pr_err("block update error after %d tries,  switching to r/o mode", try);
-		msb->read_only = true;
-	}
+	pr_err("block update error after %d tries, switching to r/o mode", try);
+	msb->read_only = true;
 	return error;
 }
 
-- 
2.11.0

