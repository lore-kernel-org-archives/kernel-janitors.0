From: Silvan Jegen <s.jegen@gmail.com>
Date: Mon, 10 Mar 2014 21:33:50 +0000
Subject: [PATCH] pata_legacy: Remove dead code
Message-Id: <531e3c9a.085e0e0a.4316.ffffe91d@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>, linux-ide@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The current flow of control prevents this function from being
called. Let's remove the call.

Signed-off-by: Silvan Jegen <s.jegen@gmail.com>
---
 drivers/ata/pata_legacy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ata/pata_legacy.c b/drivers/ata/pata_legacy.c
index be81642..bce2a8c 100644
--- a/drivers/ata/pata_legacy.c
+++ b/drivers/ata/pata_legacy.c
@@ -916,7 +916,6 @@ static __init int probe_chip_type(struct legacy_probe *probe)
 			local_irq_restore(flags);
 			return BIOS;
 		}
-		local_irq_restore(flags);
 	}
 
 	if (ht6560a & mask)
-- 
1.9.0

