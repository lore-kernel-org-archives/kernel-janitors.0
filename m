From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Dec 2018 17:52:28 +0000
Subject: [PATCH] xfrm: clean an indentation issue, remove a space
Message-Id: <20181206175228.29186-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up indentation issue, remove an extraneous
space.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 include/net/xfrm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index 0b6531a951a5..dcbd494d81fd 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -1971,7 +1971,7 @@ static inline void xfrm_dev_state_delete(struct xfrm_state *x)
 static inline void xfrm_dev_state_free(struct xfrm_state *x)
 {
 	struct xfrm_state_offload *xso = &x->xso;
-	 struct net_device *dev = xso->dev;
+	struct net_device *dev = xso->dev;
 
 	if (dev && dev->xfrmdev_ops) {
 		if (dev->xfrmdev_ops->xdo_dev_state_free)
-- 
2.19.1
