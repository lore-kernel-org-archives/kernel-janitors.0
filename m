From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2015 09:16:53 +0000
Subject: [patch] power: bq27xxx_battery: signedness bug in bq27xxx_battery_read_health()
Message-Id: <20150928091653.GA11367@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, "Andrew F. Davis" <afd@ti.com>
Cc: Sebastian Reichel <sre@kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

We need flags to be signed for the error handling to work.

Fixes: 74aab849f342 ('power: bq27xxx_battery: Cleanup health checking')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/power/bq27xxx_battery.c b/drivers/power/bq27xxx_battery.c
index 473aa2f..994c78d 100644
--- a/drivers/power/bq27xxx_battery.c
+++ b/drivers/power/bq27xxx_battery.c
@@ -691,7 +691,7 @@ static bool bq27xxx_battery_dead(struct bq27xxx_device_info *di, u16 flags)
  */
 static int bq27xxx_battery_read_health(struct bq27xxx_device_info *di)
 {
-	u16 flags;
+	int flags;
 
 	flags = bq27xxx_read(di, BQ27XXX_REG_FLAGS, false);
 	if (flags < 0) {
