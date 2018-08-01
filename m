From: Colin King <colin.king@canonical.com>
Date: Wed, 01 Aug 2018 13:06:10 +0000
Subject: [PATCH][media-next] media: ddbridge/sx8: remove redundant check of iq_mode == 2
Message-Id: <20180801130610.19643-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Scheller <d.scheller.oss@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for irq_mode = 2 occurs is always false and hence flags
is always zero.  This is because the check occurs in a path where
irq_mode is >= 3. Clean up the code by removing the check and irq_mode
and just pass 0.

Detected by CoverityScan, CID#1472214 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/ddbridge/ddbridge-sx8.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/pci/ddbridge/ddbridge-sx8.c b/drivers/media/pci/ddbridge/ddbridge-sx8.c
index 4418604258d1..c1c69d47f8c9 100644
--- a/drivers/media/pci/ddbridge/ddbridge-sx8.c
+++ b/drivers/media/pci/ddbridge/ddbridge-sx8.c
@@ -398,9 +398,7 @@ static int set_parameters(struct dvb_frontend *fe)
 		}
 		stat = start(fe, 3, mask, ts_config);
 	} else {
-		u32 flags = (iq_mode = 2) ? 1 : 0;
-
-		stat = start_iq(fe, flags, 4, ts_config);
+		stat = start_iq(fe, 0, 4, ts_config);
 	}
 	if (!stat) {
 		state->started = 1;
-- 
2.17.1

