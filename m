From: Colin King <colin.king@canonical.com>
Date: Sun, 17 Feb 2019 22:52:09 +0000
Subject: [PATCH] lib/test_rhashtable: fix spelling mistake "existant" -> "existent"
Message-Id: <20190217225209.17536-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Graf <tgraf@suug.ch>, Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in warning macro messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/test_rhashtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/test_rhashtable.c b/lib/test_rhashtable.c
index e52f8cafe227..2c0c53a99734 100644
--- a/lib/test_rhashtable.c
+++ b/lib/test_rhashtable.c
@@ -395,7 +395,7 @@ static int __init test_rhltable(unsigned int entries)
 			if (WARN(err, "cannot remove element at slot %d", i))
 				continue;
 		} else {
-			if (WARN(err != -ENOENT, "removed non-existant element %d, error %d not %d",
+			if (WARN(err != -ENOENT, "removed non-existent element %d, error %d not %d",
 			     i, err, -ENOENT))
 				continue;
 		}
@@ -440,7 +440,7 @@ static int __init test_rhltable(unsigned int entries)
 			if (WARN(err, "cannot remove element at slot %d", i))
 				continue;
 		} else {
-			if (WARN(err != -ENOENT, "removed non-existant element, error %d not %d",
+			if (WARN(err != -ENOENT, "removed non-existent element, error %d not %d",
 				 err, -ENOENT))
 			continue;
 		}
-- 
2.20.1
