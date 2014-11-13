From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Nov 2014 06:19:06 +0000
Subject: [patch v2 -next] amd-xgbe: fix ->rss_hash_type
Message-Id: <20141113061905.GA1280@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141112.150459.233340605780805877.davem@davemloft.net>
In-Reply-To: <20141112.150459.233340605780805877.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Lendacky <thomas.lendacky@amd.com>, David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There was a missing break statement so we set everything to
PKT_HASH_TYPE_L3 even when we intended to use PKT_HASH_TYPE_L4.

Fixes: 5b9dfe299e55 ('amd-xgbe: Provide support for receive side scaling')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: remove blank line

diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
index 7daa2cd..f6014d3 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
@@ -1600,7 +1600,7 @@ static int xgbe_dev_read(struct xgbe_channel *channel)
 		case RX_DESC3_L34T_IPV6_TCP:
 		case RX_DESC3_L34T_IPV6_UDP:
 			packet->rss_hash_type = PKT_HASH_TYPE_L4;
-
+			break;
 		default:
 			packet->rss_hash_type = PKT_HASH_TYPE_L3;
 		}
