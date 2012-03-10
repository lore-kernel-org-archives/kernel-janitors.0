From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 10 Mar 2012 09:00:05 +0000
Subject: [patch] sata_mv: silence an uninitialized variable warning
Message-Id: <20120310090005.GE4647@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>, Michael Walle <michael@walle.cc>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org

Gcc version 4.6.2-12 complains that if we can't find the "nr-ports"
property in of_property_read_u32_array() then "n_ports" is used
uninitialized.  Let's set it to zero in that case.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
index ebd0d24..3d8d5c6 100644
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@ -4026,7 +4026,8 @@ static int mv_platform_probe(struct platform_device *pdev)
 	struct ata_host *host;
 	struct mv_host_priv *hpriv;
 	struct resource *res;
-	int n_ports, rc;
+	int n_ports = 0;
+	int rc;
 
 	ata_print_version_once(&pdev->dev, DRV_VERSION);
 
