From: Colin King <colin.king@canonical.com>
Date: Thu, 19 Dec 2019 18:56:07 +0000
Subject: [PATCH][next] rtc: rv3029: remove redundant return statement
Message-Id: <20191219185607.21285-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two return statements at the end of the function
rv30x9_init, the latter is redundant and can be removed. Remove
it.

Addresses-Coverity: ("Structurally dead code")
Fixes: ef2f1df54a29 ("rtc: rv3029: remove useless error messages")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-rv3029c2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 4eda0db72b66..7c52efb7d113 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -898,8 +898,6 @@ static int __init rv30x9_init(void)
 		return ret;
 
 	return rv3049_register_driver();
-
-	return ret;
 }
 module_init(rv30x9_init)
 
-- 
2.24.0
