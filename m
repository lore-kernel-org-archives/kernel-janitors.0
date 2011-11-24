From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 07:18:20 +0000
Subject: [patch] net/netlabel: copy and paste bug in
Message-Id: <20111124071820.GB14122@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Moore <paul@paul-moore.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This was copy and pasted from the IPv4 code.  We're calling the
ip4 version of that function and map4 is NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/netlabel/netlabel_kapi.c b/net/netlabel/netlabel_kapi.c
index 8ed67dcc..3735297 100644
--- a/net/netlabel/netlabel_kapi.c
+++ b/net/netlabel/netlabel_kapi.c
@@ -162,8 +162,8 @@ int netlbl_cfg_unlbl_map_add(const char *domain,
 			map6->list.addr.s6_addr32[3] &= mask6->s6_addr32[3];
 			map6->list.mask = *mask6;
 			map6->list.valid = 1;
-			ret_val = netlbl_af4list_add(&map4->list,
-						     &addrmap->list4);
+			ret_val = netlbl_af6list_add(&map6->list,
+						     &addrmap->list6);
 			if (ret_val != 0)
 				goto cfg_unlbl_map_add_failure;
 			break;
