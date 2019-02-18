From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 07:52:26 +0000
Subject: [PATCH] rtl818x_pci: Remove set but not used variables 'io_addr, mem_addr'
Message-Id: <20190218075226.183964-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "John W. Linville" <linville@tuxdriver.com>, Colin Ian King <colin.king@canonical.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c: In function 'rtl8180_probe':
drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c:1727:15: warning:
 variable 'io_addr' set but not used [-Wunused-but-set-variable]

drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c:1726:16: warning:
 variable 'mem_addr' set but not used [-Wunused-but-set-variable]

They're never used since introduction.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c b/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c
index e2b1bfbcfbd4..d5f65372356b 100644
--- a/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c
+++ b/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c
@@ -1723,8 +1723,8 @@ static int rtl8180_probe(struct pci_dev *pdev,
 {
 	struct ieee80211_hw *dev;
 	struct rtl8180_priv *priv;
-	unsigned long mem_addr, mem_len;
-	unsigned int io_addr, io_len;
+	unsigned long mem_len;
+	unsigned int io_len;
 	int err;
 	const char *chip_name, *rf_name = NULL;
 	u32 reg;
@@ -1743,9 +1743,7 @@ static int rtl8180_probe(struct pci_dev *pdev,
 		goto err_disable_dev;
 	}
 
-	io_addr = pci_resource_start(pdev, 0);
 	io_len = pci_resource_len(pdev, 0);
-	mem_addr = pci_resource_start(pdev, 1);
 	mem_len = pci_resource_len(pdev, 1);
 
 	if (mem_len < sizeof(struct rtl818x_csr) ||
