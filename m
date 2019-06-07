From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jun 2019 15:31:07 +0000
Subject: [PATCH v2 next] nexthop: off by one in nexthop_mpath_select()
Message-Id: <20190607153107.GS31203@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <0e02a744-f28e-e206-032b-a0ffac9f7311@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ahern <dsahern@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The nhg->nh_entries[] array is allocated in nexthop_grp_alloc() and it
has nhg->num_nh elements so this check should be >= instead of >.

Fixes: 430a049190de ("nexthop: Add support for nexthop groups")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: David Ahern <dsahern@gmail.com>
---
v2: Use the correct Fixes tag

 include/net/nexthop.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/nexthop.h b/include/net/nexthop.h
index aff7b2410057..e019ed9b3dc3 100644
--- a/include/net/nexthop.h
+++ b/include/net/nexthop.h
@@ -160,7 +160,7 @@ struct nexthop *nexthop_mpath_select(const struct nexthop *nh, int nhsel)
 	/* for_nexthops macros in fib_semantics.c grabs a pointer to
 	 * the nexthop before checking nhsel
 	 */
-	if (nhsel > nhg->num_nh)
+	if (nhsel >= nhg->num_nh)
 		return NULL;
 
 	return nhg->nh_entries[nhsel].nh;
-- 
2.20.1
