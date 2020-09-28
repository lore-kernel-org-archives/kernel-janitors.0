From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2020 09:11:03 +0000
Subject: [PATCH] staging: vchiq: Fix list_for_each exit tests
Message-Id: <20200928091103.GC377727@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcelo Diop-Gonzalez <marcgonzalez@google.com>, kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Jamal Shareef <jamal.k.shareef@gmail.com>

This code code here used to be list_for_each() and after the loop then
the "entry" pointer was non-NULL if we found the correct entry or NULL
if we couldn't find it.  Then we changed the code to use list_for_each_entry()
and so now the "entry" pointer is always non-NULL when we exit the loop.

I have introduced a new "found" variable to say if we found the correct
enty or not.  I fixed one test by making it an else statement because
that was more readable than testing "if (!found)".

Fixes: 46e4b9ec4fa4 ("staging: vchiq_arm: use list_for_each_entry when accessing bulk_waiter_list")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c    | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index bb0cc9cb96e9..c25fc559cd36 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -430,6 +430,7 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
 	struct vchiq_service *service;
 	enum vchiq_status status;
 	struct bulk_waiter_node *waiter = NULL;
+	bool found = false;
 
 	service = find_service_by_handle(handle);
 	if (!service)
@@ -443,12 +444,13 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
 	list_for_each_entry(waiter, &instance->bulk_waiter_list, list) {
 		if (waiter->pid = current->pid) {
 			list_del(&waiter->list);
+			found = true;
 			break;
 		}
 	}
 	mutex_unlock(&instance->bulk_waiter_list_mutex);
 
-	if (waiter) {
+	if (found) {
 		struct vchiq_bulk *bulk = waiter->bulk_waiter.bulk;
 
 		if (bulk) {
@@ -464,9 +466,7 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
 				spin_unlock(&bulk_waiter_spinlock);
 			}
 		}
-	}
-
-	if (!waiter) {
+	} else {
 		waiter = kzalloc(sizeof(struct bulk_waiter_node), GFP_KERNEL);
 		if (!waiter) {
 			vchiq_log_error(vchiq_core_log_level,
@@ -945,6 +945,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 {
 	struct vchiq_service *service;
 	struct bulk_waiter_node *waiter = NULL;
+	bool found = false;
 	int status = 0;
 	int ret;
 
@@ -967,11 +968,12 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 				    list) {
 			if (waiter->pid = current->pid) {
 				list_del(&waiter->list);
+				found = true;
 				break;
 			}
 		}
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
-		if (!waiter) {
+		if (!found) {
 			vchiq_log_error(vchiq_arm_log_level,
 				"no bulk_waiter found for pid %d",
 				current->pid);
-- 
2.28.0
