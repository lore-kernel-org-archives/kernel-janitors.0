From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Feb 2019 08:59:31 +0000
Subject: [PATCH 3/3 net-next] test_objagg: Uninitialized variable in error handling
Message-Id: <20190213085931.GD14113@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190213085650.GB14113@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to set the error message on this path otherwise some of the
callers, such as test_hints_case(), print from an uninitialized pointer.

We had a similar bug earlier and set "errmsg" to NULL in the caller,
test_delta_action_item().  That code is no longer required so I have
removed it.

Fixes: 9069a3817d82 ("lib: objagg: implement optimization hints assembly and use hints for object creation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/test_objagg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/test_objagg.c b/lib/test_objagg.c
index 3dd45777b13c..72c1abfa154d 100644
--- a/lib/test_objagg.c
+++ b/lib/test_objagg.c
@@ -745,8 +745,10 @@ static int check_expect_stats(struct objagg *objagg,
 	int err;
 
 	stats = objagg_stats_get(objagg);
-	if (IS_ERR(stats))
+	if (IS_ERR(stats)) {
+		*errmsg = "objagg_stats_get() failed.";
 		return PTR_ERR(stats);
+	}
 	err = __check_expect_stats(stats, expect_stats, errmsg);
 	objagg_stats_put(stats);
 	return err;
@@ -786,7 +788,6 @@ static int test_delta_action_item(struct world *world,
 	if (err)
 		goto errout;
 
-	errmsg = NULL;
 	err = check_expect_stats(objagg, &action_item->expect_stats, &errmsg);
 	if (err) {
 		pr_err("Key %u: Stats: %s\n", action_item->key_id, errmsg);
-- 
2.17.1
