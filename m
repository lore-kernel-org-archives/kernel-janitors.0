From: Dan Carpenter <error27@gmail.com>
Date: Wed, 07 Apr 2010 09:35:46 +0000
Subject: [patch] stmmac: use resource_size()
Message-Id: <20100407093546.GF5157@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322121111.GJ21571@bicker>
In-Reply-To: <20100322121111.GJ21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Resource size should be calculated as end - start + 1 because we start
counting at zero.  I changed the code to resource_size() to do the 
calculation.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/stmmac/stmmac_main.c b/drivers/net/stmmac/stmmac_main.c
index a214a16..4111a85 100644
--- a/drivers/net/stmmac/stmmac_main.c
+++ b/drivers/net/stmmac/stmmac_main.c
@@ -1686,7 +1686,7 @@ static int stmmac_dvr_probe(struct platform_device *pdev)
 	}
 	pr_info("done!\n");
 
-	if (!request_mem_region(res->start, (res->end - res->start),
+	if (!request_mem_region(res->start, resource_size(res),
 				pdev->name)) {
 		pr_err("%s: ERROR: memory allocation failed"
 		       "cannot get the I/O addr 0x%x\n",
@@ -1695,9 +1695,9 @@ static int stmmac_dvr_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	addr = ioremap(res->start, (res->end - res->start));
+	addr = ioremap(res->start, resource_size(res));
 	if (!addr) {
-		pr_err("%s: ERROR: memory mapping failed \n", __func__);
+		pr_err("%s: ERROR: memory mapping failed\n", __func__);
 		ret = -ENOMEM;
 		goto out;
 	}
@@ -1775,7 +1775,7 @@ static int stmmac_dvr_probe(struct platform_device *pdev)
 out:
 	if (ret < 0) {
 		platform_set_drvdata(pdev, NULL);
-		release_mem_region(res->start, (res->end - res->start));
+		release_mem_region(res->start, resource_size(res));
 		if (addr != NULL)
 			iounmap(addr);
 	}
@@ -1813,7 +1813,7 @@ static int stmmac_dvr_remove(struct platform_device *pdev)
 
 	iounmap((void *)ndev->base_addr);
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(res->start, (res->end - res->start));
+	release_mem_region(res->start, resource_size(res));
 
 	free_netdev(ndev);
 
