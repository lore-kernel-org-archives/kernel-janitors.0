From: Colin King <colin.king@canonical.com>
Date: Wed, 02 Sep 2020 16:13:32 +0000
Subject: [PATCH][next] xsk: fix incorrect memory allocation failure check on dma_map->dma_pages
Message-Id: <20200902161332.199961-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The failed memory allocation check for dma_map->dma_pages is incorrect,
it is null checking dma_map and not dma_map->dma_pages. Fix this.

Addresses-Coverity: ("Logicall dead code")
Fixes: 921b68692abb ("xsk: Enable sharing of dma mappings")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/xdp/xsk_buff_pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
index 795d7c81c0ca..5b00bc5707f2 100644
--- a/net/xdp/xsk_buff_pool.c
+++ b/net/xdp/xsk_buff_pool.c
@@ -287,7 +287,7 @@ static struct xsk_dma_map *xp_create_dma_map(struct device *dev, struct net_devi
 		return NULL;
 
 	dma_map->dma_pages = kvcalloc(nr_pages, sizeof(*dma_map->dma_pages), GFP_KERNEL);
-	if (!dma_map) {
+	if (!dma_map->dma_pages) {
 		kfree(dma_map);
 		return NULL;
 	}
-- 
2.27.0
