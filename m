From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Apr 2018 10:43:07 +0000
Subject: [PATCH] mkiss: remove redundant check for len > 0
Message-Id: <20180425104307.8310-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Johannes Berg <johannes.berg@intel.com>, Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for len > 0 is always true and hence is redundant as
this check is already being made to execute the code inside the
while-loop. Hence it is redundant and can be removed.

Cleans up cppcheck warning:
drivers/net/hamradio/mkiss.c:220: (warning) Identical inner 'if'
condition is always true.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/hamradio/mkiss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/mkiss.c b/drivers/net/hamradio/mkiss.c
index c180b480f8ef..13e4c1eff353 100644
--- a/drivers/net/hamradio/mkiss.c
+++ b/drivers/net/hamradio/mkiss.c
@@ -217,7 +217,7 @@ static int kiss_esc_crc(unsigned char *s, unsigned char *d, unsigned short crc,
 			c = *s++;
 		else if (len > 1)
 			c = crc >> 8;
-		else if (len > 0)
+		else
 			c = crc & 0xff;
 
 		len--;
-- 
2.17.0

