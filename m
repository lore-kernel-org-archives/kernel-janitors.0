From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jun 2018 09:24:42 +0000
Subject: [PATCH net] atm: iphase: fix a 64 bit bug
Message-Id: <20180628092442.uu4ktcqymi65hbuh@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>
Cc: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The code assumes that there is 4 bytes in a pointer and it doesn't
allocate enough memory.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index ff81a576347e..82532c299bb5 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -1618,7 +1618,7 @@ static int rx_init(struct atm_dev *dev)
 	skb_queue_head_init(&iadev->rx_dma_q);  
 	iadev->rx_free_desc_qhead = NULL;   
 
-	iadev->rx_open = kcalloc(4, iadev->num_vc, GFP_KERNEL);
+	iadev->rx_open = kcalloc(iadev->num_vc, sizeof(void *), GFP_KERNEL);
 	if (!iadev->rx_open) {
 		printk(KERN_ERR DEV_LABEL "itf %d couldn't get free page\n",
 		dev->number);  
