From: Pradeep Singh Rautela <rautelap@gmail.com>
Date: Thu, 29 May 2008 17:59:35 +0000
Subject: [PATCH v2.6.26-rc4] ata: Convert deprecated static spinlock_t lock
Message-Id: <20080529175814.GB4926@kernelpanic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ide@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, jgarzik@pobox.com

Replace deprecated static spinlock_t instance to static DEFINE_SPINLOCK(lock).

Signed-off-by: Pradeep Singh <rautelap@gmail.com>
---
 drivers/ata/libata-core.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 3c89f20..cc816ca 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -5403,7 +5403,7 @@ static void ata_host_stop(struct device *gendev, void *res)
  */
 static void ata_finalize_port_ops(struct ata_port_operations *ops)
 {
-	static spinlock_t lock = SPIN_LOCK_UNLOCKED;
+	static DEFINE_SPINLOCK(lock);
 	const struct ata_port_operations *cur;
 	void **begin = (void **)ops;
 	void **end = (void **)&ops->inherits;
-- 
1.5.5.1

