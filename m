From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 02 Oct 2020 19:47:43 +0000
Subject: [PATCH] net: typhoon: Fix a typo Typoon --> Typhoon
Message-Id: <20201002194743.640440-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dave@thedillows.org, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/Typoon/Typhoon/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/3com/typhoon.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/3com/typhoon.h b/drivers/net/ethernet/3com/typhoon.h
index 2f634c64d5d1..38e6dcab4e94 100644
--- a/drivers/net/ethernet/3com/typhoon.h
+++ b/drivers/net/ethernet/3com/typhoon.h
@@ -33,7 +33,7 @@ struct basic_ring {
 	u32 lastWrite;
 };
 
-/* The Typoon transmit ring -- same as a basic ring, plus:
+/* The Typhoon transmit ring -- same as a basic ring, plus:
  * lastRead:      where we're at in regard to cleaning up the ring
  * writeRegister: register to use for writing (different for Hi & Lo rings)
  */
-- 
2.25.1
