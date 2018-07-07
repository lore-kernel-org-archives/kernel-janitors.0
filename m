From: Colin King <colin.king@canonical.com>
Date: Sat, 07 Jul 2018 11:27:30 +0000
Subject: [PATCH] farsync: remove redundant variable txq_length
Message-Id: <20180707112730.21404-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Curtis <kevin.curtis@farsite.co.uk>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable txq_length is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'txq_length' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wan/farsync.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wan/farsync.c b/drivers/net/wan/farsync.c
index bd46b2552980..2a3f0f1a2b0a 100644
--- a/drivers/net/wan/farsync.c
+++ b/drivers/net/wan/farsync.c
@@ -2134,7 +2134,6 @@ static void
 fst_openport(struct fst_port_info *port)
 {
 	int signals;
-	int txq_length;
 
 	/* Only init things if card is actually running. This allows open to
 	 * succeed for downloads etc.
@@ -2161,7 +2160,6 @@ fst_openport(struct fst_port_info *port)
 		else
 			netif_carrier_off(port_to_dev(port));
 
-		txq_length = port->txqe - port->txqs;
 		port->txqe = 0;
 		port->txqs = 0;
 	}
-- 
2.17.1

