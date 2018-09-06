From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 06 Sep 2018 11:22:09 +0000
Subject: [PATCH net-next] liquidio CN23XX: Remove set but not used variable 'ring_flag'
Message-Id: <1536232929-117243-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>, Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, "David S. Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c: In function 'cn23xx_setup_octeon_vf_device':
drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c:619:20: warning:
 variable 'ring_flag' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c b/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c
index 962bb62..fda4940 100644
--- a/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c
@@ -616,7 +616,7 @@ static void cn23xx_disable_vf_interrupt(struct octeon_device *oct, u8 intr_flag)
 int cn23xx_setup_octeon_vf_device(struct octeon_device *oct)
 {
 	struct octeon_cn23xx_vf *cn23xx = (struct octeon_cn23xx_vf *)oct->chip;
-	u32 rings_per_vf, ring_flag;
+	u32 rings_per_vf;
 	u64 reg_val;
 
 	if (octeon_map_pci_barx(oct, 0, 0))
@@ -634,8 +634,6 @@ int cn23xx_setup_octeon_vf_device(struct octeon_device *oct)
 
 	rings_per_vf = reg_val & CN23XX_PKT_INPUT_CTL_RPVF_MASK;
 
-	ring_flag = 0;
-
 	cn23xx->conf  = oct_get_config_info(oct, LIO_23XX);
 	if (!cn23xx->conf) {
 		dev_err(&oct->pci_dev->dev, "%s No Config found for CN23XX\n",
