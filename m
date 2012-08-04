From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 04 Aug 2012 16:50:49 +0000
Subject: [PATCH 6/6] drivers/net/phy/mdio-mux-gpio.c: drop devm_kfree of devm_kzalloc'd data
Message-Id: <1344099049-15212-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm_kfree should not have to be explicitly used.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,d;
@@

x = devm_kzalloc(...)
...
?-devm_kfree(d,x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/phy/mdio-mux-gpio.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/phy/mdio-mux-gpio.c b/drivers/net/phy/mdio-mux-gpio.c
index e0cc4ef..eefe49e 100644
--- a/drivers/net/phy/mdio-mux-gpio.c
+++ b/drivers/net/phy/mdio-mux-gpio.c
@@ -101,7 +101,6 @@ err:
 		n--;
 		gpio_free(s->gpio[n]);
 	}
-	devm_kfree(&pdev->dev, s);
 	return r;
 }
 

