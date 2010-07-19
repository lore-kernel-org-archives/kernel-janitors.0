From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 19 Jul 2010 08:55:58 +0000
Subject: [PATCH] s2io: Remove unnecessary memset of netdev private data
Message-Id: <1279529758-7901-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org

The memory for the private data is allocated using kzalloc in
alloc_etherdev (or alloc_netdev_mq respectively) so there is no need to
set it to 0 again.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/net/s2io.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/net/s2io.c b/drivers/net/s2io.c
index d0af924..aa6cbb0 100644
--- a/drivers/net/s2io.c
+++ b/drivers/net/s2io.c
@@ -7886,7 +7886,6 @@ s2io_init_nic(struct pci_dev *pdev, const struct pci_device_id *pre)
 
 	/*  Private member variable initialized to s2io NIC structure */
 	sp = netdev_priv(dev);
-	memset(sp, 0, sizeof(struct s2io_nic));
 	sp->dev = dev;
 	sp->pdev = pdev;
 	sp->high_dma_flag = dma_flag;
-- 
1.7.0.4

