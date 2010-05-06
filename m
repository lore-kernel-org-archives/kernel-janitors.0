From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 06 May 2010 09:51:37 +0000
Subject: [PATCH] powerpc/BSR: Use resource_size
Message-Id: <1273139497-25961-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>

Use the resource_size function instead of manually calculating the
resource size.  This reduces the chance of introducing off-by-one
errors.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/char/bsr.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/bsr.c b/drivers/char/bsr.c
index 89d871e..aadc78b 100644
--- a/drivers/char/bsr.c
+++ b/drivers/char/bsr.c
@@ -210,7 +210,7 @@ static int bsr_add_node(struct device_node *bn)
 
 		cur->bsr_minor  = i + total_bsr_devs;
 		cur->bsr_addr   = res.start;
-		cur->bsr_len    = res.end - res.start + 1;
+		cur->bsr_len    = resource_size(&res);
 		cur->bsr_bytes  = bsr_bytes[i];
 		cur->bsr_stride = bsr_stride[i];
 		cur->bsr_dev    = MKDEV(bsr_major, i + total_bsr_devs);
-- 
1.6.3.3

