From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 11 Dec 2009 21:35:36 +0000
Subject: [PATCH 04/10] Fix misspellings of "successful" and "successfully" in strings.
Message-Id: <1260567342-8327-5-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some string messages misspell "successful" or "successfully"; this
fixes them. No change in functionality.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 drivers/net/benet/be_main.c             |    2 +-
 drivers/net/ehea/ehea_ethtool.c         |    4 ++--
 drivers/net/smsc911x.c                  |    2 +-
 drivers/net/usb/smsc95xx.c              |    2 +-
 drivers/staging/comedi/drivers/me4000.c |    2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/benet/be_main.c b/drivers/net/benet/be_main.c
index 876b357..c3a7db3 100644
--- a/drivers/net/benet/be_main.c
+++ b/drivers/net/benet/be_main.c
@@ -1877,7 +1877,7 @@ int be_load_fw(struct be_adapter *adapter, u8 *func)
 		goto fw_exit;
 	}
 
-	dev_info(&adapter->pdev->dev, "Firmware flashed succesfully\n");
+	dev_info(&adapter->pdev->dev, "Firmware flashed successfully\n");
 
 fw_exit:
 	release_firmware(fw);
diff --git a/drivers/net/ehea/ehea_ethtool.c b/drivers/net/ehea/ehea_ethtool.c
index d768852..75b099c 100644
--- a/drivers/net/ehea/ehea_ethtool.c
+++ b/drivers/net/ehea/ehea_ethtool.c
@@ -118,7 +118,7 @@ doit:
 	ret = ehea_set_portspeed(port, sp);
 
 	if (!ret)
-		ehea_info("%s: Port speed succesfully set: %dMbps "
+		ehea_info("%s: Port speed successfully set: %dMbps "
 			  "%s Duplex",
 			  port->netdev->name, port->port_speed,
 			  port->full_duplex = 1 ? "Full" : "Half");
@@ -134,7 +134,7 @@ static int ehea_nway_reset(struct net_device *dev)
 	ret = ehea_set_portspeed(port, EHEA_SPEED_AUTONEG);
 
 	if (!ret)
-		ehea_info("%s: Port speed succesfully set: %dMbps "
+		ehea_info("%s: Port speed successfully set: %dMbps "
 			  "%s Duplex",
 			  port->netdev->name, port->port_speed,
 			  port->full_duplex = 1 ? "Full" : "Half");
diff --git a/drivers/net/smsc911x.c b/drivers/net/smsc911x.c
index f9cdcbc..24954fe 100644
--- a/drivers/net/smsc911x.c
+++ b/drivers/net/smsc911x.c
@@ -816,7 +816,7 @@ static int smsc911x_mii_probe(struct net_device *dev)
 	SMSC_TRACE(HW, "Passed Loop Back Test");
 #endif				/* USE_PHY_WORK_AROUND */
 
-	SMSC_TRACE(HW, "phy initialised succesfully");
+	SMSC_TRACE(HW, "phy initialised successfully");
 	return 0;
 }
 
diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index c6c9222..0c3c738 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -748,7 +748,7 @@ static int smsc95xx_phy_initialize(struct usbnet *dev)
 	mii_nway_restart(&dev->mii);
 
 	if (netif_msg_ifup(dev))
-		devdbg(dev, "phy initialised succesfully");
+		devdbg(dev, "phy initialised successfully");
 	return 0;
 }
 
diff --git a/drivers/staging/comedi/drivers/me4000.c b/drivers/staging/comedi/drivers/me4000.c
index 6079913..8b9fa0f 100644
--- a/drivers/staging/comedi/drivers/me4000.c
+++ b/drivers/staging/comedi/drivers/me4000.c
@@ -840,7 +840,7 @@ static int xilinx_download(struct comedi_device *dev)
 		       "comedi%d: me4000: xilinx_download(): DONE flag is not set\n",
 		       dev->minor);
 		printk(KERN_ERR
-		       "comedi%d: me4000: xilinx_download(): Download not succesful\n",
+		       "comedi%d: me4000: xilinx_download(): Download not successful\n",
 		       dev->minor);
 		return -EIO;
 	}
-- 
1.6.3.3

