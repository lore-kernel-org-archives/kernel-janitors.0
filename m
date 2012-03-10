From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 10 Mar 2012 08:57:29 +0000
Subject: [patch] spi: release lock on error path in spi_pump_messages()
Message-Id: <20120310085729.GB4647@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We should release the lock here and enable IRQs before returning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 5ae1e84..ab1bdce 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -535,6 +535,7 @@ static void spi_pump_messages(struct kthread_work *work)
 			if (ret) {
 				dev_err(&master->dev,
 					"failed to unprepare transfer hardware\n");
+				spin_unlock_irqrestore(&master->queue_lock, flags);
 				return;
 			}
 		}
