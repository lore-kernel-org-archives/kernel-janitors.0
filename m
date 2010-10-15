From: Julia Lawall <julia@diku.dk>
Date: Fri, 15 Oct 2010 12:56:01 +0000
Subject: [PATCH 4/7] drivers/power/wm97xx_battery.c: Return -ENOMEM on memory allocation failure
Message-Id: <1287147610-8041-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this code, 0 is returned on memory allocation failure, even though other
failures return -ENOMEM or other similar values.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ret;
expression x,e1,e2,e3;
@@

ret = 0
... when != ret = e1
*x = \(kmalloc\|kcalloc\|kzalloc\)(...)
... when != ret = e2
if (x = NULL) { ... when != ret = e3
  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/power/wm97xx_battery.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff -u -p a/drivers/power/wm97xx_battery.c b/drivers/power/wm97xx_battery.c
--- a/drivers/power/wm97xx_battery.c
+++ b/drivers/power/wm97xx_battery.c
@@ -215,8 +215,10 @@ static int __devinit wm97xx_bat_probe(st
 		props++;	/* POWER_SUPPLY_PROP_VOLTAGE_MIN */
 
 	prop = kzalloc(props * sizeof(*prop), GFP_KERNEL);
-	if (!prop)
+	if (!prop) {
+		ret = -ENOMEM;
 		goto err3;
+	}
 
 	prop[i++] = POWER_SUPPLY_PROP_PRESENT;
 	if (pdata->charge_gpio >= 0)

