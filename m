From: Nick Crews <ncrews@chromium.org>
Date: Fri, 14 Jun 2019 20:56:31 +0000
Subject: [PATCH 1/2] platform/chrome: wilco_ec: Fix unreleased lock in event_read()
Message-Id: <20190614205631.90222-1-ncrews@chromium.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: enric.balletbo@collabora.com, bleung@chromium.org
Cc: linux-kernel@vger.kernel.org, dlaurie@chromium.org, djkurtz@chromium.org, dtor@google.com, sjg@chromium.org, kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com, Nick Crews <ncrews@chromium.org>

When copying an event to userspace failed, the event queue
lock was never released. This fixes that.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Nick Crews <ncrews@chromium.org>
---
 drivers/platform/chrome/wilco_ec/event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
index 4d2776f77dbd..1eed55681598 100644
--- a/drivers/platform/chrome/wilco_ec/event.c
+++ b/drivers/platform/chrome/wilco_ec/event.c
@@ -342,7 +342,7 @@ static ssize_t event_read(struct file *filp, char __user *buf, size_t count,
 				 struct ec_event_entry, list);
 	n_bytes_written = entry->size;
 	if (copy_to_user(buf, &entry->event, n_bytes_written))
-		return -EFAULT;
+		n_bytes_written = -EFAULT;
 	list_del(&entry->list);
 	kfree(entry);
 	dev_data->num_events--;
-- 
2.20.1
