From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Jan 2017 15:06:46 +0000
Subject: [PATCH][next-next] net: ethernet: aquantia: return -ETIME in macro AQ_HW_WAIT_FOR
Message-Id: <20170127150646.19181-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Pavel Belous <Pavel.Belous@aquantia.com>, Alexander Loktionov <Alexander.Loktionov@aquantia.com>, Dmitry Bezrukov <Dmitry.Bezrukov@aquantia.com>, David VomLehn <vomlehn@texas.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The macro is returning ETIME which means various checks to see if
the returned err is less than zero never work. I believe a -ETIME
should be returned instead.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_hw_utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_hw_utils.h b/drivers/net/ethernet/aquantia/atlantic/aq_hw_utils.h
index 78fcc0c..03b72dd 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_hw_utils.h
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_hw_utils.h
@@ -31,7 +31,7 @@ do { \
 		udelay(_US_); \
 	} \
 	if (!AQ_HW_WAIT_FOR_i) {\
-		err = ETIME; \
+		err = -ETIME; \
 	} \
 } while (0)
 
-- 
2.10.2

