From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:04:19 +0000
Subject: [PATCH 12/19] drivers/net: use for_each_pci_dev()
Message-Id: <1278173061-11813-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Ramkrishna Vepa <ram.vepa@neterion.com>, Rastapur Santosh <santosh.rastapur@neterion.com>, Sivakumar Subramani <sivakumar.subramani@neterion.com>, Sreenivasa Honnur <sreenivasa.honnur@neterion.com>, "David S. Miller" <davem@davemloft.net>, Joe Perches <joe@perches.com>, Jiri Pirko <jpirko@redhat.com>, Neil Horman <nhorman@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/s2io.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/s2io.c b/drivers/net/s2io.c
index 22371f1..5c2bd50 100644
--- a/drivers/net/s2io.c
+++ b/drivers/net/s2io.c
@@ -1094,7 +1094,7 @@ static int s2io_verify_pci_mode(struct s2io_nic *nic)
 static int s2io_on_nec_bridge(struct pci_dev *s2io_pdev)
 {
 	struct pci_dev *tdev = NULL;
-	while ((tdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, tdev)) != NULL) {
+	for_each_pci_dev(tdev) {
 		if (tdev->vendor = NEC_VENID && tdev->device = NEC_DEVID) {
 			if (tdev->bus = s2io_pdev->bus->parent) {
 				pci_dev_put(tdev);
-- 
1.7.0.4

