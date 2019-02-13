From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Feb 2019 08:56:50 +0000
Subject: [PATCH 1/3 net-next] lib: objagg: Fix an error code in objagg_hints_get()
Message-Id: <20190213085650.GB14113@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>
Cc: netdev@vger.kernel.org, Ido Schimmel <idosch@mellanox.com>, kernel-janitors@vger.kernel.org

We need to set the error code on this path otherwise we return
ERR_PTR(0) which would result in a NULL dereference in the caller.

Fixes: 9069a3817d82 ("lib: objagg: implement optimization hints assembly and use hints for object creation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/objagg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/objagg.c b/lib/objagg.c
index 781f41c3c47d..d552ec9c60ed 100644
--- a/lib/objagg.c
+++ b/lib/objagg.c
@@ -968,8 +968,10 @@ struct objagg_hints *objagg_hints_get(struct objagg *objagg,
 	if (err)
 		goto err_fillup_hints;
 
-	if (WARN_ON(objagg_hints->node_count != objagg->obj_count))
+	if (WARN_ON(objagg_hints->node_count != objagg->obj_count)) {
+		err = -EINVAL;
 		goto err_node_count_check;
+	}
 
 	return objagg_hints;
 
-- 
2.17.1
