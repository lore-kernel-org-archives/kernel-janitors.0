From: Silvan Jegen <s.jegen@gmail.com>
Date: Sun, 15 Feb 2015 12:11:04 +0000
Subject: [PATCH 1/2] [media] mantis: Move jump label to activate dead code
Message-Id: <1424002265-16865-2-git-send-email-s.jegen@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1424002265-16865-1-git-send-email-s.jegen@gmail.com>
In-Reply-To: <1424002265-16865-1-git-send-email-s.jegen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org
Cc: Silvan Jegen <s.jegen@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Due to a misplaced goto label mantis_uart_exit is never called.  Adjusting
the label position (while correcting its numbering) changes this.

This issue was found using the smatch static checker.

Signed-off-by: Silvan Jegen <s.jegen@gmail.com>
---
 drivers/media/pci/mantis/mantis_cards.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/mantis/mantis_cards.c b/drivers/media/pci/mantis/mantis_cards.c
index 801fc55..e566061 100644
--- a/drivers/media/pci/mantis/mantis_cards.c
+++ b/drivers/media/pci/mantis/mantis_cards.c
@@ -215,10 +215,11 @@ static int mantis_pci_probe(struct pci_dev *pdev,
 		dprintk(MANTIS_ERROR, 1, "ERROR: Mantis DVB initialization failed <%d>", err);
 		goto fail4;
 	}
+
 	err = mantis_uart_init(mantis);
 	if (err < 0) {
 		dprintk(MANTIS_ERROR, 1, "ERROR: Mantis UART initialization failed <%d>", err);
-		goto fail6;
+		goto fail5;
 	}
 
 	devs++;
@@ -226,10 +227,10 @@ static int mantis_pci_probe(struct pci_dev *pdev,
 	return err;
 
 
+fail5:
 	dprintk(MANTIS_ERROR, 1, "ERROR: Mantis UART exit! <%d>", err);
 	mantis_uart_exit(mantis);
 
-fail6:
 fail4:
 	dprintk(MANTIS_ERROR, 1, "ERROR: Mantis DMA exit! <%d>", err);
 	mantis_dma_exit(mantis);
-- 
2.2.2

