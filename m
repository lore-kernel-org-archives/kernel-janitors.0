From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 05 Aug 2016 11:26:11 +0000
Subject: [PATCH 03/11 v2] pinctrl: nomadik: use of_property_read_bool
Message-Id: <alpine.DEB.2.10.1608051325350.2999@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
 <1470387411-15879-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470387411-15879-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Use of_property_read_bool to check for the existence of a property.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2,x;
@@
-	if (of_get_property(e1,e2,NULL))
-		x = true;
-	else
-		x = false;
+	x = of_property_read_bool(e1,e2);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: special case for propagating true and false

 drivers/pinctrl/nomadik/pinctrl-nomadik.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 35f6218..6f2e1da 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1110,10 +1110,8 @@ static int nmk_gpio_probe(struct platform_device *dev)
 		return PTR_ERR(nmk_chip);
 	}

-	if (of_get_property(np, "st,supports-sleepmode", NULL))
-		supports_sleepmode = true;
-	else
-		supports_sleepmode = false;
+	supports_sleepmode +		of_property_read_bool(np, "st,supports-sleepmode");

 	/* Correct platform device ID */
 	dev->id = nmk_chip->bank;

