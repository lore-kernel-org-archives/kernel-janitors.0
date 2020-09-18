From: Colin King <colin.king@canonical.com>
Date: Fri, 18 Sep 2020 21:51:26 +0000
Subject: [PATCH] rhashtable: fix indentation of a continue statement
Message-Id: <20200918215126.49236-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Graf <tgraf@suug.ch>, Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A continue statement is indented incorrectly, add in the missing
tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/test_rhashtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_rhashtable.c b/lib/test_rhashtable.c
index c5a6fef7b45d..76c607ee6db5 100644
--- a/lib/test_rhashtable.c
+++ b/lib/test_rhashtable.c
@@ -434,7 +434,7 @@ static int __init test_rhltable(unsigned int entries)
 		} else {
 			if (WARN(err != -ENOENT, "removed non-existent element, error %d not %d",
 				 err, -ENOENT))
-			continue;
+				continue;
 		}
 	}
 
-- 
2.27.0
