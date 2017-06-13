From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Jun 2017 08:52:54 +0000
Subject: [PATCH][crypto-next] crypto: cavium: fix spelling mistake "Revsion" -> "Revision"
Message-Id: <20170613085254.20855-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Srikanth Jampala <Jampala.Srikanth@cavium.com>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in seq_printf message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/cavium/nitrox/nitrox_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/cavium/nitrox/nitrox_main.c b/drivers/crypto/cavium/nitrox/nitrox_main.c
index eee6fb501580..ae44a464cd2d 100644
--- a/drivers/crypto/cavium/nitrox/nitrox_main.c
+++ b/drivers/crypto/cavium/nitrox/nitrox_main.c
@@ -399,7 +399,7 @@ static int nitrox_show(struct seq_file *s, void *v)
 	struct nitrox_device *ndev = s->private;
 
 	seq_printf(s, "NITROX-5 [idx: %d]\n", ndev->idx);
-	seq_printf(s, "  Revsion ID: 0x%0x\n", ndev->hw.revision_id);
+	seq_printf(s, "  Revision ID: 0x%0x\n", ndev->hw.revision_id);
 	seq_printf(s, "  Cores [AE: %u  SE: %u]\n",
 		   ndev->hw.ae_cores, ndev->hw.se_cores);
 	seq_printf(s, "  Number of Queues: %u\n", ndev->nr_queues);
-- 
2.11.0

