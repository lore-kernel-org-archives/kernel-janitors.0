From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Mar 2012 06:41:01 +0000
Subject: [patch] netlabel: use GFP flags from caller instead of GFP_ATOMIC
Message-Id: <20120322064101.GD7369@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Moore <paul@paul-moore.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This function takes a GFP flags as a parameter, but they are never used.
We don't take a lock in this function so there is no reason to prefer
GFP_ATOMIC over the caller's GFP flags.

There is only one caller, cipso_v4_map_cat_rng_ntoh(), and it passes
GFP_ATOMIC as the GFP flags so this doesn't change how the code works.
It's just a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/netlabel/netlabel_kapi.c b/net/netlabel/netlabel_kapi.c
index 2560e7b..7c94aed 100644
--- a/net/netlabel/netlabel_kapi.c
+++ b/net/netlabel/netlabel_kapi.c
@@ -597,7 +597,7 @@ int netlbl_secattr_catmap_setrng(struct netlbl_lsm_secattr_catmap *catmap,
 			iter = iter->next;
 			iter_max_spot = iter->startbit + NETLBL_CATMAP_SIZE;
 		}
-		ret_val = netlbl_secattr_catmap_setbit(iter, spot, GFP_ATOMIC);
+		ret_val = netlbl_secattr_catmap_setbit(iter, spot, flags);
 	}
 
 	return ret_val;
