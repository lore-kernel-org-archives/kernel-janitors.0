From: Dan Carpenter <error27@gmail.com>
Date: Mon, 20 Dec 2010 13:00:18 +0000
Subject: [patch -next] typhoon: memory corruption in typhoon_get_drvinfo()
Message-Id: <20101220130018.GX1936@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Dillow <dave@thedillows.org>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

info->version only has space for 32 characters but my UTS_RELEASE is
"2.6.37-rc6-next-20101217-05817-ge935fc8-dirty" so it doesn't fit.
This is supposed to be the version of the driver, not the kernel
version.  This driver doesn't have a version so lets just leave it
blank.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Found with static analysis.  Compile tested.

diff --git a/drivers/net/typhoon.c b/drivers/net/typhoon.c
index 5b83c3f..a3c46f6 100644
--- a/drivers/net/typhoon.c
+++ b/drivers/net/typhoon.c
@@ -1004,7 +1004,6 @@ typhoon_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 	}
 
 	strcpy(info->driver, KBUILD_MODNAME);
-	strcpy(info->version, UTS_RELEASE);
 	strcpy(info->bus_info, pci_name(pci_dev));
 }
 
