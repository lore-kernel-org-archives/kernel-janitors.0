From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Oct 2013 09:10:20 +0000
Subject: [patch] firewire: info leak in ioctl_get_info()
Message-Id: <20131019091020.GE9312@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a 4 byte hole in the bus_reset struct at the end of the struct
after ->generation.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index d7d5c8a..d34adb3 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -353,6 +353,8 @@ static void fill_bus_reset_event(struct fw_cdev_event_bus_reset *event,
 {
 	struct fw_card *card = client->device->card;
 
+	memset(event, 0, sizeof(*event));
+
 	spin_lock_irq(&card->lock);
 
 	event->closure	     = client->bus_reset_closure;
