From: Colin King <colin.king@canonical.com>
Date: Sun, 30 Dec 2018 13:38:01 +0000
Subject: [PATCH] NFC: st95hf: clean up indentation, add in missing tab on return statement
Message-Id: <20181230133801.7237-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Daniel Mack <daniel@zonque.org>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A return statement is not indented enough, fix this by adding the
missing tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nfc/st95hf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index a50a95cfcfd8..76d0ed14d6af 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -672,7 +672,7 @@ static int st95hf_error_handling(struct st95hf_context *stcontext,
 			result = -ETIMEDOUT;
 		else
 			result = -EIO;
-	return  result;
+		return  result;
 	}
 
 	/* Check for CRC err only if CRC is present in the tag response */
-- 
2.19.1
