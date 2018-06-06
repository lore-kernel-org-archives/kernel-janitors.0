From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 Jun 2018 06:56:34 +0000
Subject: [PATCH -next] ata: ahci_mvebu: ahci_mvebu_stop_engine() can be static
Message-Id: <1528268194-106788-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/ata/ahci_mvebu.c:85:5: warning:
 symbol 'ahci_mvebu_stop_engine' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/ata/ahci_mvebu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_mvebu.c b/drivers/ata/ahci_mvebu.c
index 0045dac..72d90b4 100644
--- a/drivers/ata/ahci_mvebu.c
+++ b/drivers/ata/ahci_mvebu.c
@@ -82,7 +82,7 @@ static void ahci_mvebu_regret_option(struct ahci_host_priv *hpriv)
  *
  * Return: 0 on success; Error code otherwise.
  */
-int ahci_mvebu_stop_engine(struct ata_port *ap)
+static int ahci_mvebu_stop_engine(struct ata_port *ap)
 {
 	void __iomem *port_mmio = ahci_port_base(ap);
 	u32 tmp, port_fbs;

