From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 19 Mar 2020 12:07:43 +0000
Subject: [PATCH net-next] liquidio: remove set but not used variable 's'
Message-Id: <20200319120743.28056-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200306023254.61731-1-yuehaibing@huawei.com>
In-Reply-To: <20200306023254.61731-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <dchickles@marvell.com>, Leon Romanovsky <leonro@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Satanand Burla <sburla@marvell.com>, Felix Manlunas <fmanlunas@marvell.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/cavium/liquidio/lio_main.c: In function 'octeon_chip_specific_setup':
drivers/net/ethernet/cavium/liquidio/lio_main.c:1378:8: warning:
 variable 's' set but not used [-Wunused-but-set-variable]

It's not used since commit b6334be64d6f ("net/liquidio: Delete driver version assignment")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/cavium/liquidio/lio_main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_main.c b/drivers/net/ethernet/cavium/liquidio/lio_main.c
index a8d9ec927627..66d31c018c7e 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_main.c
@@ -1375,7 +1375,6 @@ static int octeon_chip_specific_setup(struct octeon_device *oct)
 {
 	u32 dev_id, rev_id;
 	int ret = 1;
-	char *s;
 
 	pci_read_config_dword(oct->pci_dev, 0, &dev_id);
 	pci_read_config_dword(oct->pci_dev, 8, &rev_id);
@@ -1385,13 +1384,11 @@ static int octeon_chip_specific_setup(struct octeon_device *oct)
 	case OCTEON_CN68XX_PCIID:
 		oct->chip_id = OCTEON_CN68XX;
 		ret = lio_setup_cn68xx_octeon_device(oct);
-		s = "CN68XX";
 		break;
 
 	case OCTEON_CN66XX_PCIID:
 		oct->chip_id = OCTEON_CN66XX;
 		ret = lio_setup_cn66xx_octeon_device(oct);
-		s = "CN66XX";
 		break;
 
 	case OCTEON_CN23XX_PCIID_PF:
@@ -1404,11 +1401,9 @@ static int octeon_chip_specific_setup(struct octeon_device *oct)
 			pci_sriov_set_totalvfs(oct->pci_dev,
 					       oct->sriov_info.max_vfs);
 #endif
-		s = "CN23XX";
 		break;
 
 	default:
-		s = "?";
 		dev_err(&oct->pci_dev->dev, "Unknown device found (dev_id: %x)\n",
 			dev_id);
 	}
