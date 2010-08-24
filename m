From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 16:53:33 +0000
Subject: [patch 2/4] pxa168_eth: fix error handling in prope
Message-Id: <20100824165333.GI29330@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sachin Sanap <ssanap@marvell.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

A couple issues here:
* Some resources weren't released.  
* If alloc_etherdev() failed it would have caused a NULL dereference
  because "pep" would be null when we checked "if (pep->clk)".
* Also it's better to propagate the error codes from mdiobus_register()
  instead of just returning -ENOMEM.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/pxa168_eth.c b/drivers/net/pxa168_eth.c
index 857a681..302fb48 100644
--- a/drivers/net/pxa168_eth.c
+++ b/drivers/net/pxa168_eth.c
@@ -1497,7 +1497,7 @@ static int pxa168_eth_probe(struct platform_device *pdev)
 	dev = alloc_etherdev(sizeof(struct pxa168_eth_private));
 	if (!dev) {
 		err = -ENOMEM;
-		goto out;
+		goto err_clk;
 	}
 
 	platform_set_drvdata(pdev, dev);
@@ -1507,12 +1507,12 @@ static int pxa168_eth_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res = NULL) {
 		err = -ENODEV;
-		goto out;
+		goto err_netdev;
 	}
 	pep->base = ioremap(res->start, res->end - res->start + 1);
 	if (pep->base = NULL) {
 		err = -ENOMEM;
-		goto out;
+		goto err_netdev;
 	}
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	BUG_ON(!res);
@@ -1549,7 +1549,7 @@ static int pxa168_eth_probe(struct platform_device *pdev)
 	pep->smi_bus = mdiobus_alloc();
 	if (pep->smi_bus = NULL) {
 		err = -ENOMEM;
-		goto out;
+		goto err_base;
 	}
 	pep->smi_bus->priv = pep;
 	pep->smi_bus->name = "pxa168_eth smi";
@@ -1558,31 +1558,31 @@ static int pxa168_eth_probe(struct platform_device *pdev)
 	snprintf(pep->smi_bus->id, MII_BUS_ID_SIZE, "%d", pdev->id);
 	pep->smi_bus->parent = &pdev->dev;
 	pep->smi_bus->phy_mask = 0xffffffff;
-	if (mdiobus_register(pep->smi_bus) < 0) {
-		err = -ENOMEM;
-		goto out;
-	}
+	err = mdiobus_register(pep->smi_bus);
+	if (err)
+		goto err_free_mdio;
+
 	pxa168_init_hw(pep);
 	err = ethernet_phy_setup(dev);
 	if (err)
-		goto out;
+		goto err_mdiobus;
 	SET_NETDEV_DEV(dev, &pdev->dev);
 	err = register_netdev(dev);
 	if (err)
-		goto out;
+		goto err_mdiobus;
 	return 0;
-out:
-	if (pep->clk) {
-		clk_disable(pep->clk);
-		clk_put(pep->clk);
-		pep->clk = NULL;
-	}
-	if (pep->base) {
-		iounmap(pep->base);
-		pep->base = NULL;
-	}
-	if (dev)
-		free_netdev(dev);
+
+err_mdiobus:
+	mdiobus_unregister(pep->smi_bus);
+err_free_mdio:
+	mdiobus_free(pep->smi_bus);
+err_base:
+	iounmap(pep->base);
+err_netdev:
+	free_netdev(dev);
+err_clk:
+	clk_disable(clk);
+	clk_put(clk);
 	return err;
 }
 
