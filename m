From: Colin King <colin.king@canonical.com>
Date: Fri, 01 Dec 2017 12:38:11 +0000
Subject: [PATCH] liquidio: fix incorrect indentation of assignment statement
Message-Id: <20171201123811.14882-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>, Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Remove one extraneous level of indentation on assignment statement.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/cavium/liquidio/lio_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_main.c b/drivers/net/ethernet/cavium/liquidio/lio_main.c
index 6aa0eee88ea5..a5eecd895a82 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_main.c
@@ -1113,7 +1113,7 @@ static int liquidio_watchdog(void *param)
 				dev_err(&oct->pci_dev->dev,
 					"ERROR: Octeon core %d crashed or got stuck!  See oct-fwdump for details.\n",
 					core);
-					err_msg_was_printed[core] = true;
+				err_msg_was_printed[core] = true;
 			}
 		}
 
-- 
2.14.1

