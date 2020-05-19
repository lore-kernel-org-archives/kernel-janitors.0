From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 19 May 2020 20:36:54 +0000
Subject: [PATCH] crypto: cavium/nitrox - Fix a typo in a comment
Message-Id: <20200519203654.281351-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net, jsrikanth@marvell.com, phemadri@marvell.com, gustavo@embeddedor.com, tglx@linutronix.de
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/NITORX/NITROX/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/cavium/nitrox/nitrox_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/cavium/nitrox/nitrox_main.c b/drivers/crypto/cavium/nitrox/nitrox_main.c
index e91be9b8b083..788c6607078b 100644
--- a/drivers/crypto/cavium/nitrox/nitrox_main.c
+++ b/drivers/crypto/cavium/nitrox/nitrox_main.c
@@ -346,7 +346,7 @@ static void nitrox_pf_sw_cleanup(struct nitrox_device *ndev)
 }
 
 /**
- * nitrox_bist_check - Check NITORX BIST registers status
+ * nitrox_bist_check - Check NITROX BIST registers status
  * @ndev: NITROX device
  */
 static int nitrox_bist_check(struct nitrox_device *ndev)
-- 
2.25.1
