From: Colin King <colin.king@canonical.com>
Date: Wed, 18 Apr 2018 15:55:05 +0000
Subject: [PATCH] atm: iphase: fix spelling mistake: "Tansmit" -> "Transmit"
Message-Id: <20180418155505.10334-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180328231853.28461-1-colin.king@canonical.com>
In-Reply-To: <20180328231853.28461-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/iphase.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index 44abb8a0a5e5..be076606d30e 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -671,7 +671,7 @@ static void ia_tx_poll (IADEV *iadev) {
           if ((vcc->pop) && (skb1->len != 0))
           {
              vcc->pop(vcc, skb1);
-             IF_EVENT(printk("Tansmit Done - skb 0x%lx return\n",
+             IF_EVENT(printk("Transmit Done - skb 0x%lx return\n",
                                                           (long)skb1);)
           }
           else 
@@ -1665,7 +1665,7 @@ static void tx_intr(struct atm_dev *dev)
 	status = readl(iadev->seg_reg+SEG_INTR_STATUS_REG);  
         if (status & TRANSMIT_DONE){
 
-           IF_EVENT(printk("Tansmit Done Intr logic run\n");)
+           IF_EVENT(printk("Transmit Done Intr logic run\n");)
            spin_lock_irqsave(&iadev->tx_lock, flags);
            ia_tx_poll(iadev);
            spin_unlock_irqrestore(&iadev->tx_lock, flags);
-- 
2.17.0

