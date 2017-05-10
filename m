From: Firo Yang <firogm@gmail.com>
Date: Wed, 10 May 2017 15:29:35 +0000
Subject: [PATCH] elevator: eliminate unused result build warning
Message-Id: <20170510152935.24968-1-yongming.yang@windriver.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: axboe@kernel.dk
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org, Firo Yang <yongming.yang@windriver.com>, Firo Yang <firogm@gmail.com>

Gcc complains about ignoring return value of ‘strstrip’; Fix it by
just using the strstrip() as the function parameter.

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 block/elevator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/elevator.c b/block/elevator.c
index fda6be9..dd0ed19 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -1099,8 +1099,7 @@ ssize_t elv_iosched_store(struct request_queue *q, const char *name,
 		return count;
 
 	strlcpy(elevator_name, skip_spaces(name), sizeof(elevator_name));
-	strstrip(elevator_name);
-	ret = __elevator_change(q, elevator_name);
+	ret = __elevator_change(q, strstrip(elevator_name));
 	if (!ret)
 		return count;
 
-- 
2.9.3

