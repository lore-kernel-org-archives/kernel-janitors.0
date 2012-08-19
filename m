From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 19 Aug 2012 08:44:18 +0000
Subject: [PATCH 6/14] drivers/power/wm97xx_battery.c: fix error return code
Message-Id: <1345365870-29831-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <cbou@mail.ru>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Initialize return variable before exiting on an error path.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/power/wm97xx_battery.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/power/wm97xx_battery.c b/drivers/power/wm97xx_battery.c
index d2d4c08..0ba331a 100644
--- a/drivers/power/wm97xx_battery.c
+++ b/drivers/power/wm97xx_battery.c
@@ -212,8 +212,10 @@ static int __devinit wm97xx_bat_probe(struct platform_device *dev)
 		props++;	/* POWER_SUPPLY_PROP_VOLTAGE_MIN */
 
 	prop = kzalloc(props * sizeof(*prop), GFP_KERNEL);
-	if (!prop)
+	if (!prop) {
+		ret = -ENOMEM;
 		goto err3;
+	}
 
 	prop[i++] = POWER_SUPPLY_PROP_PRESENT;
 	if (pdata->charge_gpio >= 0)

