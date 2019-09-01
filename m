From: Colin King <colin.king@canonical.com>
Date: Sun, 01 Sep 2019 15:52:05 +0000
Subject: [PATCH] netlabel: remove redundant assignment to pointer iter
Message-Id: <20190901155205.16877-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Moore <paul@paul-moore.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer iter is being initialized with a value that is never read and
is being re-assigned a little later on. The assignment is redundant
and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/netlabel/netlabel_kapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netlabel/netlabel_kapi.c b/net/netlabel/netlabel_kapi.c
index 2b0ef55cf89e..409a3ae47ce2 100644
--- a/net/netlabel/netlabel_kapi.c
+++ b/net/netlabel/netlabel_kapi.c
@@ -607,7 +607,7 @@ static struct netlbl_lsm_catmap *_netlbl_catmap_getnode(
  */
 int netlbl_catmap_walk(struct netlbl_lsm_catmap *catmap, u32 offset)
 {
-	struct netlbl_lsm_catmap *iter = catmap;
+	struct netlbl_lsm_catmap *iter;
 	u32 idx;
 	u32 bit;
 	NETLBL_CATMAP_MAPTYPE bitmap;
-- 
2.20.1
