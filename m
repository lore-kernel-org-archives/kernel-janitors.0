From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Dec 2020 19:45:49 +0000
Subject: [PATCH] net: fix spelling mistake "wil" -> "will" in Kconfig
Message-Id: <20201204194549.1153063-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 4ee41924cdf1..260f9f46668b 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -287,7 +287,7 @@ config GTP
 	  3GPP TS 29.060 standards.
 
 	  To compile this drivers as a module, choose M here: the module
-	  wil be called gtp.
+	  will be called gtp.
 
 config MACSEC
 	tristate "IEEE 802.1AE MAC-level encryption (MACsec)"
-- 
2.29.2
