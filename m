From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Dec 2017 14:37:52 +0000
Subject: [PATCH] bnxt_en: Uninitialized variable in bnxt_tc_parse_actions()
Message-Id: <20171205143752.cymsw7fzlqn6ejeq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Chan <michael.chan@broadcom.com>, Sathya Perla <sathya.perla@broadcom.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch warns that:

    drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:160 bnxt_tc_parse_actions()
    error: uninitialized symbol 'rc'.

"rc" is either uninitialized or set to zero here so we can just remove
the check.

Fixes: 8c95f773b4a3 ("bnxt_en: add support for Flower based vxlan encap/decap offload")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c
index d5031f436f83..125b146da031 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c
@@ -157,9 +157,6 @@ static int bnxt_tc_parse_actions(struct bnxt *bp,
 		}
 	}
 
-	if (rc)
-		return rc;
-
 	/* Tunnel encap/decap action must be accompanied by a redirect action */
 	if ((actions->flags & BNXT_TC_ACTION_FLAG_TUNNEL_ENCAP ||
 	     actions->flags & BNXT_TC_ACTION_FLAG_TUNNEL_DECAP) &&
@@ -169,7 +166,7 @@ static int bnxt_tc_parse_actions(struct bnxt *bp,
 		return -EINVAL;
 	}
 
-	return rc;
+	return 0;
 }
 
 #define GET_KEY(flow_cmd, key_type)					\
