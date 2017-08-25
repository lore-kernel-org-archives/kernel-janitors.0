From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 16:03:37 +0000
Subject: [PATCH 07/14] vme: fake: Improve five size determinations in fake_init()
Message-Id: <833ed88a-d969-3745-b61a-7274c87394b9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 09:46:13 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/bridges/vme_fake.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/vme/bridges/vme_fake.c b/drivers/vme/bridges/vme_fake.c
index 6ceea5e9fd8b..39f84df44557 100644
--- a/drivers/vme/bridges/vme_fake.c
+++ b/drivers/vme/bridges/vme_fake.c
@@ -1075,11 +1075,11 @@ static int __init fake_init(void)
 	/* If we want to support more than one bridge at some point, we need to
 	 * dynamically allocate this so we get one per device.
 	 */
-	fake_bridge = kzalloc(sizeof(struct vme_bridge), GFP_KERNEL);
+	fake_bridge = kzalloc(sizeof(*fake_bridge), GFP_KERNEL);
 	if (fake_bridge = NULL) {
 		retval = -ENOMEM;
 		goto err_struct;
 	}
 
-	fake_device = kzalloc(sizeof(struct fake_driver), GFP_KERNEL);
+	fake_device = kzalloc(sizeof(*fake_device), GFP_KERNEL);
 	if (fake_device = NULL) {
@@ -1104,6 +1104,5 @@ static int __init fake_init(void)
 	/* Add master windows to list */
 	INIT_LIST_HEAD(&fake_bridge->master_resources);
 	for (i = 0; i < FAKE_MAX_MASTER; i++) {
-		master_image = kmalloc(sizeof(struct vme_master_resource),
-				GFP_KERNEL);
+		master_image = kmalloc(sizeof(*master_image), GFP_KERNEL);
 		if (master_image = NULL) {
@@ -1131,6 +1130,5 @@ static int __init fake_init(void)
 	/* Add slave windows to list */
 	INIT_LIST_HEAD(&fake_bridge->slave_resources);
 	for (i = 0; i < FAKE_MAX_SLAVE; i++) {
-		slave_image = kmalloc(sizeof(struct vme_slave_resource),
-				GFP_KERNEL);
+		slave_image = kmalloc(sizeof(*slave_image), GFP_KERNEL);
 		if (slave_image = NULL) {
@@ -1154,5 +1152,5 @@ static int __init fake_init(void)
 
 	/* Add location monitor to list */
 	INIT_LIST_HEAD(&fake_bridge->lm_resources);
-	lm = kmalloc(sizeof(struct vme_lm_resource), GFP_KERNEL);
+	lm = kmalloc(sizeof(*lm), GFP_KERNEL);
 	if (lm = NULL) {
-- 
2.14.0

