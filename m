From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Apr 2020 23:20:31 +0000
Subject: [PATCH] nft_set_pipapo: remove unused pointer lt
Message-Id: <20200406232031.657615-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer lt being assigned with a value that is never read and
the pointer is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/netfilter/nft_set_pipapo_avx2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/netfilter/nft_set_pipapo_avx2.c b/net/netfilter/nft_set_pipapo_avx2.c
index d65ae0e23028..9458c6b6ea04 100644
--- a/net/netfilter/nft_set_pipapo_avx2.c
+++ b/net/netfilter/nft_set_pipapo_avx2.c
@@ -1049,11 +1049,9 @@ static int nft_pipapo_avx2_lookup_slow(unsigned long *map, unsigned long *fill,
 					struct nft_pipapo_field *f, int offset,
 					const u8 *pkt, bool first, bool last)
 {
-	unsigned long *lt = f->lt, bsize = f->bsize;
+	unsigned long bsize = f->bsize;
 	int i, ret = -1, b;
 
-	lt += offset * NFT_PIPAPO_LONGS_PER_M256;
-
 	if (first)
 		memset(map, 0xff, bsize * sizeof(*map));
 
-- 
2.25.1
