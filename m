From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Oct 2020 13:47:48 +0000
Subject: [PATCH v2] staging: vchiq: Fix list_for_each exit tests
Message-Id: <20201006134748.GA2076872@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20201001085650.GA1832570@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcelo Diop-Gonzalez <marcgonzalez@google.com>, kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Jamal Shareef <jamal.k.shareef@gmail.com>

After a list_for_each_entry() loop, the list iterator is always non-NULL
so these conditions don't work.  If the "waiter" is not found then this
results in an out of bounds access.

I have fixed it by introducing a new "found" variable.  In one case, I
used an else statement for readability.

Fixes: 46e4b9ec4fa4 ("staging: vchiq_arm: use list_for_each_entry when accessing bulk_waiter_list")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: rebase on latest linux-next

 .../vc04_services/interface/vchiq_arm/vchiq_arm.c    | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 590415561b73..e6a9aab66f4a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -432,6 +432,7 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
 	struct vchiq_service *service;
 	enum vchiq_status status;
 	struct bulk_waiter_node *waiter = NULL;
+	bool found = false;
 
 	service = find_service_by_handle(handle);
 	if (!service)
@@ -445,12 +446,13 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
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
@@ -467,9 +469,7 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
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
@@ -952,6 +952,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 {
 	struct vchiq_service *service;
 	struct bulk_waiter_node *waiter = NULL;
+	bool found = false;
 	void *userdata;
 	int status = 0;
 	int ret;
@@ -975,11 +976,12 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
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
