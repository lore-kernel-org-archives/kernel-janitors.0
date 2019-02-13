From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Feb 2019 08:58:20 +0000
Subject: [PATCH 2/3 net-next] test_objagg: Test the correct variable
Message-Id: <20190213085820.GC14113@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190213085650.GB14113@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo here.  We intended to check "objagg2" but we instead
test "objagg" which is not an error pointer.

Fixes: 9069a3817d82 ("lib: objagg: implement optimization hints assembly and use hints for object creation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/test_objagg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/test_objagg.c b/lib/test_objagg.c
index 3744573b6365..3dd45777b13c 100644
--- a/lib/test_objagg.c
+++ b/lib/test_objagg.c
@@ -952,8 +952,8 @@ static int test_hints_case(const struct hints_case *hints_case)
 	}
 
 	objagg2 = objagg_create(&delta_ops, hints, &world2);
-	if (IS_ERR(objagg))
-		return PTR_ERR(objagg);
+	if (IS_ERR(objagg2))
+		return PTR_ERR(objagg2);
 
 	for (i = 0; i < hints_case->key_ids_count; i++) {
 		objagg_obj = world_obj_get(&world2, objagg2,
-- 
2.17.1
