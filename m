From: Colin King <colin.king@canonical.com>
Date: Thu, 26 Sep 2019 11:13:06 +0000
Subject: [PATCH] NFC: st95hf: clean up indentation issue
Message-Id: <20190926111306.17409-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The return statement is indented incorrectly, add in a missing
tab and remove an extraneous space after the return

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nfc/st95hf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index ce38782ebf80..291efff048af 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -661,7 +661,7 @@ static int st95hf_error_handling(struct st95hf_context *stcontext,
 			result = -ETIMEDOUT;
 		else
 			result = -EIO;
-	return  result;
+		return result;
 	}
 
 	/* Check for CRC err only if CRC is present in the tag response */
-- 
2.20.1
