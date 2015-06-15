From: ChengYi He <chengyihetaipei@gmail.com>
Date: Mon, 15 Jun 2015 19:04:59 +0000
Subject: [PATCH] staging: wilc1000: remove unnecessary cast
Message-Id: <20150615190459.GA7310@chengyihe-ThinkCentre-M82>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

kmalloc() returns void pointer.

Signed-off-by: ChengYi He <chengyihetaipei@gmail.com>
---
 drivers/staging/wilc1000/linux_mon.c  | 2 +-
 drivers/staging/wilc1000/linux_wlan.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/wilc1000/linux_mon.c b/drivers/staging/wilc1000/linux_mon.c
index d5860ce..bc7feb4 100644
--- a/drivers/staging/wilc1000/linux_mon.c
+++ b/drivers/staging/wilc1000/linux_mon.c
@@ -258,7 +258,7 @@ static int mon_mgmt_tx(struct net_device *dev, const u8 *buf, size_t len)
 	len += sizeof(struct tx_complete_mon_data *);
 	#endif
 
-	mgmt_tx->buff = (char *)kmalloc(len, GFP_ATOMIC);
+	mgmt_tx->buff = kmalloc(len, GFP_ATOMIC);
 	if (mgmt_tx->buff = NULL) {
 		PRINT_ER("Failed to allocate memory for mgmt_tx buff\n");
 		return WILC_FAIL;
diff --git a/drivers/staging/wilc1000/linux_wlan.c b/drivers/staging/wilc1000/linux_wlan.c
index 5f87148..c1e9272 100644
--- a/drivers/staging/wilc1000/linux_wlan.c
+++ b/drivers/staging/wilc1000/linux_wlan.c
@@ -580,7 +580,7 @@ static void linux_wlan_dbg(uint8_t *buff)
 static void *linux_wlan_malloc_atomic(uint32_t sz)
 {
 	char *pntr = NULL;
-	pntr = (char *)kmalloc(sz, GFP_ATOMIC);
+	pntr = kmalloc(sz, GFP_ATOMIC);
 	PRINT_D(MEM_DBG, "Allocating %d bytes at address %p\n", sz, pntr);
 	return (void *)pntr;
 
@@ -588,7 +588,7 @@ static void *linux_wlan_malloc_atomic(uint32_t sz)
 static void *linux_wlan_malloc(uint32_t sz)
 {
 	char *pntr = NULL;
-	pntr = (char *)kmalloc(sz, GFP_KERNEL);
+	pntr = kmalloc(sz, GFP_KERNEL);
 	PRINT_D(MEM_DBG, "Allocating %d bytes at address %p\n", sz, pntr);
 	return (void *)pntr;
 }
@@ -605,7 +605,7 @@ void linux_wlan_free(void *vp)
 static void *internal_alloc(uint32_t size, uint32_t flag)
 {
 	char *pntr = NULL;
-	pntr = (char *)kmalloc(size, flag);
+	pntr = kmalloc(size, flag);
 	PRINT_D(MEM_DBG, "Allocating %d bytes at address %p\n", size, pntr);
 	return (void *)pntr;
 }
-- 
1.9.1

