From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Dec 2013 21:55:46 +0000
Subject: [PATCH 11/25] pcmcia: fix error return code
Message-Id: <1388357260-4843-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Set the return variable to an error code as done elsewhere in the function.

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
Not tested.

 drivers/pcmcia/electra_cf.c |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pcmcia/electra_cf.c b/drivers/pcmcia/electra_cf.c
index 5ea64d0..b012bd9 100644
--- a/drivers/pcmcia/electra_cf.c
+++ b/drivers/pcmcia/electra_cf.c
@@ -251,23 +251,31 @@ static int electra_cf_probe(struct platform_device *ofdev)
 	cf->socket.pci_irq = cf->irq;
 
 	prop = of_get_property(np, "card-detect-gpio", NULL);
-	if (!prop)
+	if (!prop) {
+		status = -ENODEV;
 		goto fail1;
+	}
 	cf->gpio_detect = *prop;
 
 	prop = of_get_property(np, "card-vsense-gpio", NULL);
-	if (!prop)
+	if (!prop) {
+		status = -ENODEV;
 		goto fail1;
+	}
 	cf->gpio_vsense = *prop;
 
 	prop = of_get_property(np, "card-3v-gpio", NULL);
-	if (!prop)
+	if (!prop) {
+		status = -ENODEV;
 		goto fail1;
+	}
 	cf->gpio_3v = *prop;
 
 	prop = of_get_property(np, "card-5v-gpio", NULL);
-	if (!prop)
+	if (!prop) {
+		status = -ENODEV;
 		goto fail1;
+	}
 	cf->gpio_5v = *prop;
 
 	cf->socket.io_offset = cf->io_base;

