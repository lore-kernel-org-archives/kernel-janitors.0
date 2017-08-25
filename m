From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 16:05:21 +0000
Subject: [PATCH 08/14] vme: fake: Adjust 11 checks for null pointers
Message-Id: <e3b286fc-99f3-d893-629e-afc88201ff35@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 10:01:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/bridges/vme_fake.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/vme/bridges/vme_fake.c b/drivers/vme/bridges/vme_fake.c
index 39f84df44557..7d83691047f4 100644
--- a/drivers/vme/bridges/vme_fake.c
+++ b/drivers/vme/bridges/vme_fake.c
@@ -409,7 +409,7 @@ static void fake_lm_check(struct fake_driver *bridge, unsigned long long addr,
 				/* Each location monitor covers 8 bytes */
 				if (((lm_base + (8 * i)) <= addr) &&
 				    ((lm_base + (8 * i) + 8) > addr)) {
-					if (bridge->lm_callback[i] != NULL)
+					if (bridge->lm_callback[i])
 						bridge->lm_callback[i](
 							bridge->lm_data[i]);
 				}
@@ -866,7 +866,7 @@ static int fake_lm_set(struct vme_lm_resource *lm, unsigned long long lm_base,
 
 	/* If we already have a callback attached, we can't move it! */
 	for (i = 0; i < lm->monitors; i++) {
-		if (bridge->lm_callback[i] != NULL) {
+		if (bridge->lm_callback[i]) {
 			mutex_unlock(&lm->mtx);
 			pr_err("Location monitor callback attached, can't reset\n");
 			return -EBUSY;
@@ -940,7 +940,7 @@ static int fake_lm_attach(struct vme_lm_resource *lm, int monitor,
 	}
 
 	/* Check that a callback isn't already attached */
-	if (bridge->lm_callback[monitor] != NULL) {
+	if (bridge->lm_callback[monitor]) {
 		mutex_unlock(&lm->mtx);
 		pr_err("Existing callback attached\n");
 		return -EBUSY;
@@ -978,7 +978,7 @@ static int fake_lm_detach(struct vme_lm_resource *lm, int monitor)
 	/* If all location monitors disabled, disable global Location Monitor */
 	tmp = 0;
 	for (i = 0; i < lm->monitors; i++) {
-		if (bridge->lm_callback[i] != NULL)
+		if (bridge->lm_callback[i])
 			tmp = 1;
 	}
 
@@ -1003,7 +1003,7 @@ static void *fake_alloc_consistent(struct device *parent, size_t size,
 {
 	void *alloc = kmalloc(size, GFP_KERNEL);
 
-	if (alloc != NULL)
+	if (alloc)
 		*dma = fake_ptr_to_pci(alloc);
 
 	return alloc;
@@ -1039,7 +1039,7 @@ static int fake_crcsr_init(struct vme_bridge *fake_bridge)
 	/* Allocate mem for CR/CSR image */
 	bridge->crcsr_kernel = kzalloc(VME_CRCSR_BUF_SIZE, GFP_KERNEL);
 	bridge->crcsr_bus = fake_ptr_to_pci(bridge->crcsr_kernel);
-	if (bridge->crcsr_kernel = NULL)
+	if (!bridge->crcsr_kernel)
 		return -ENOMEM;
 
 	vstat = fake_slot_get(fake_bridge);
@@ -1076,13 +1076,13 @@ static int __init fake_init(void)
 	 * dynamically allocate this so we get one per device.
 	 */
 	fake_bridge = kzalloc(sizeof(*fake_bridge), GFP_KERNEL);
-	if (fake_bridge = NULL) {
+	if (!fake_bridge) {
 		retval = -ENOMEM;
 		goto err_struct;
 	}
 
 	fake_device = kzalloc(sizeof(*fake_device), GFP_KERNEL);
-	if (fake_device = NULL) {
+	if (!fake_device) {
 		retval = -ENOMEM;
 		goto err_driver;
 	}
@@ -1105,7 +1105,7 @@ static int __init fake_init(void)
 	INIT_LIST_HEAD(&fake_bridge->master_resources);
 	for (i = 0; i < FAKE_MAX_MASTER; i++) {
 		master_image = kmalloc(sizeof(*master_image), GFP_KERNEL);
-		if (master_image = NULL) {
+		if (!master_image) {
 			retval = -ENOMEM;
 			goto err_master;
 		}
@@ -1131,7 +1131,7 @@ static int __init fake_init(void)
 	INIT_LIST_HEAD(&fake_bridge->slave_resources);
 	for (i = 0; i < FAKE_MAX_SLAVE; i++) {
 		slave_image = kmalloc(sizeof(*slave_image), GFP_KERNEL);
-		if (slave_image = NULL) {
+		if (!slave_image) {
 			retval = -ENOMEM;
 			goto err_slave;
 		}
@@ -1153,7 +1153,7 @@ static int __init fake_init(void)
 	/* Add location monitor to list */
 	INIT_LIST_HEAD(&fake_bridge->lm_resources);
 	lm = kmalloc(sizeof(*lm), GFP_KERNEL);
-	if (lm = NULL) {
+	if (!lm) {
 		retval = -ENOMEM;
 		goto err_lm;
 	}
-- 
2.14.0

