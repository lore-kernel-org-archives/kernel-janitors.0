From: KumarAmitMehta <gmate.amit@gmail.com>
Date: Sun, 21 Oct 2012 18:24:36 +0000
Subject: [PATCH] bna: Replace deprecated compilation flag, EXTRA_CFLAGS with ccflags
Message-Id: <1350843876-11278-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

EXTRA_CFLAGS is deprecated and should be replaced with ccflags.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/net/ethernet/brocade/bna/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/brocade/bna/Makefile b/drivers/net/ethernet/brocade/bna/Makefile
index 6027302..5df5308 100644
--- a/drivers/net/ethernet/brocade/bna/Makefile
+++ b/drivers/net/ethernet/brocade/bna/Makefile
@@ -9,4 +9,4 @@ bna-objs := bnad.o bnad_ethtool.o bnad_debugfs.o bna_enet.o bna_tx_rx.o
 bna-objs += bfa_msgq.o bfa_ioc.o bfa_ioc_ct.o bfa_cee.o
 bna-objs += cna_fwimg.o
 
-EXTRA_CFLAGS := -Idrivers/net/bna
+ccflags-y := -Idrivers/net/bna
-- 
1.7.9.5

