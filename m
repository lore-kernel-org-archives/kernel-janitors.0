From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 06 Apr 2019 03:11:34 +0000
Subject: [PATCH -next] staging: rtl8192e: Remove set but not used variable 'VenderID'
Message-Id: <20190406031134.59419-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218123359.83746-1-yuehaibing@huawei.com>
In-Reply-To: <20190218123359.83746-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/staging/rtl8192e/rtl8192e/rtl_pci.c: In function 'rtl92e_check_adapter':
drivers/staging/rtl8192e/rtl8192e/rtl_pci.c:36:6: warning:
 variable 'VenderID' set but not used [-Wunused-but-set-variable]
  u16 VenderID;
      ^

It's never used and can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
index bab41ab7c0a5..1d992d5c4e17 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
@@ -33,12 +33,10 @@ static void _rtl92e_parse_pci_configuration(struct pci_dev *pdev,
 bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev)
 {
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
-	u16 VenderID;
 	u16 DeviceID;
 	u8  RevisionID;
 	u16 IrqLine;
 
-	VenderID = pdev->vendor;
 	DeviceID = pdev->device;
 	RevisionID = pdev->revision;
 	pci_read_config_word(pdev, 0x3C, &IrqLine);
