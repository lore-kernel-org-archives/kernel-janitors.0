From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Apr 2017 12:57:15 +0000
Subject: [PATCH net] liquidio: silence a locking static checker warning
Message-Id: <20170428125715.h6d5ttnfq7rdnpni@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>
Cc: Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Presumably we never hit this return, but static checkers complain that
we need to unlock so we may as well fix that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c b/drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c
index 201b9875f9bb..5cca73b8880b 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c
@@ -313,6 +313,7 @@ int octeon_mbox_process_message(struct octeon_mbox *mbox)
 		return 0;
 	}
 
+	spin_unlock_irqrestore(&mbox->lock, flags);
 	WARN_ON(1);
 
 	return 0;
