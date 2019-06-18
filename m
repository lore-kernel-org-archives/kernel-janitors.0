From: Colin King <colin.king@canonical.com>
Date: Tue, 18 Jun 2019 15:39:24 +0000
Subject: [PATCH][next] platform/chrome: wilco_ec: fix null pointer dereference on failed kzalloc
Message-Id: <20190618153924.19491-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Nick Crews <ncrews@chromium.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

If the kzalloc of the entries queue q fails a null pointer dereference
occurs when accessing q->capacity and q->lock.  Add a kzalloc failure
check and handle the null return case in the calling function
event_device_add.

Addresses-Coverity: ("Dereference null return")
Fixes: 75589e37d1dc ("platform/chrome: wilco_ec: Add circular buffer as event queue")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/chrome/wilco_ec/event.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
index c975b76e6255..e251a989b152 100644
--- a/drivers/platform/chrome/wilco_ec/event.c
+++ b/drivers/platform/chrome/wilco_ec/event.c
@@ -112,8 +112,11 @@ module_param(queue_size, int, 0644);
 static struct ec_event_queue *event_queue_new(int capacity)
 {
 	size_t entries_size = sizeof(struct ec_event *) * capacity;
-	struct ec_event_queue *q = kzalloc(sizeof(*q) + entries_size,
-					   GFP_KERNEL);
+	struct ec_event_queue *q;
+
+	q = kzalloc(sizeof(*q) + entries_size, GFP_KERNEL);
+	if (!q)
+		return NULL;
 
 	q->capacity = capacity;
 	spin_lock_init(&q->lock);
@@ -474,6 +477,11 @@ static int event_device_add(struct acpi_device *adev)
 	/* Initialize the device data. */
 	adev->driver_data = dev_data;
 	dev_data->events = event_queue_new(queue_size);
+	if (!dev_data->events) {
+		kfree(dev_data);
+		error = -ENOMEM;
+		goto free_minor;
+	}
 	init_waitqueue_head(&dev_data->wq);
 	dev_data->exist = true;
 	atomic_set(&dev_data->available, 1);
-- 
2.20.1
