From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 21 Jun 2019 13:59:07 +0000
Subject: [PATCH -next] platform/chrome: wilco_ec: Use kmemdup in enqueue_events()
Message-Id: <20190621135907.112232-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Nick Crews <ncrews@chromium.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/platform/chrome/wilco_ec/event.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
index c975b76e6255..70156e75047e 100644
--- a/drivers/platform/chrome/wilco_ec/event.c
+++ b/drivers/platform/chrome/wilco_ec/event.c
@@ -248,10 +248,9 @@ static int enqueue_events(struct acpi_device *adev, const u8 *buf, u32 length)
 		offset += event_size;
 
 		/* Copy event into the queue */
-		queue_event = kzalloc(event_size, GFP_KERNEL);
+		queue_event = kmemdup(event, event_size, GFP_KERNEL);
 		if (!queue_event)
 			return -ENOMEM;
-		memcpy(queue_event, event, event_size);
 		event_queue_push(dev_data->events, queue_event);
 	}
