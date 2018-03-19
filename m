From: Colin King <colin.king@canonical.com>
Date: Mon, 19 Mar 2018 10:50:21 +0000
Subject: [PATCH] test_rhashtable: fix spelling mistake: "existant" -> "existent"
Message-Id: <20180319105021.327-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Florian Westphal <fw@strlen.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in warning message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/test_rhashtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/test_rhashtable.c b/lib/test_rhashtable.c
index f4000c137dbe..32d964cbac8c 100644
--- a/lib/test_rhashtable.c
+++ b/lib/test_rhashtable.c
@@ -396,7 +396,7 @@ static int __init test_rhltable(unsigned int entries)
 			if (WARN(err, "cannot remove element at slot %d", i))
 				continue;
 		} else {
-			if (WARN(err != -ENOENT, "removed non-existant element %d, error %d not %d",
+			if (WARN(err != -ENOENT, "removed non-existent element %d, error %d not %d",
 			     i, err, -ENOENT))
 				continue;
 		}
@@ -441,7 +441,7 @@ static int __init test_rhltable(unsigned int entries)
 			if (WARN(err, "cannot remove element at slot %d", i))
 				continue;
 		} else {
-			if (WARN(err != -ENOENT, "removed non-existant element, error %d not %d",
+			if (WARN(err != -ENOENT, "removed non-existent element, error %d not %d",
 				 err, -ENOENT))
 			continue;
 		}
-- 
2.15.1

