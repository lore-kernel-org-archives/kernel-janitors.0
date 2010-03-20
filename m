From: Wolfram Sang <w.sang@pengutronix.de>
Date: Sat, 20 Mar 2010 14:12:43 +0000
Subject: [PATCH 02/24] power/ds2782: really clear i2c_clientdata on exit
Message-Id: <1269094385-16114-3-git-send-email-w.sang@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1269094385-16114-1-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ryan Mallon <ryan-7Wk5F4Od5/oYd5yxfr4S2w@public.gmane.org>, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Probably due to a copy & paste bug, clientdata was set again to the data
structure (which is freed immediately afterwards) when it should be NULLed.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Ryan Mallon <ryan@bluewatersys.com>
Cc: Anton Vorontsov <cbouatmailru@gmail.com>
---
 drivers/power/ds2782_battery.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/ds2782_battery.c b/drivers/power/ds2782_battery.c
index da14f37..6971b85 100644
--- a/drivers/power/ds2782_battery.c
+++ b/drivers/power/ds2782_battery.c
@@ -236,7 +236,7 @@ static int ds2782_battery_remove(struct i2c_client *client)
 	idr_remove(&battery_id, info->id);
 	mutex_unlock(&battery_lock);
 
-	i2c_set_clientdata(client, info);
+	i2c_set_clientdata(client, NULL);
 
 	kfree(info);
 	return 0;
@@ -289,7 +289,7 @@ static int ds2782_battery_probe(struct i2c_client *client,
 fail_register:
 	kfree(info->battery.name);
 fail_name:
-	i2c_set_clientdata(client, info);
+	i2c_set_clientdata(client, NULL);
 	kfree(info);
 fail_info:
 	mutex_lock(&battery_lock);
-- 
1.7.0

