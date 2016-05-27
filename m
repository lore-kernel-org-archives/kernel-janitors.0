From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 May 2016 10:34:35 +0000
Subject: [patch] atm: iphase: off by one in rx_pkt()
Message-Id: <20160527103435.GB3255@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>
Cc: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The iadev->rx_open[] array holds "iadev->num_vc" pointers (this code
assumes that pointers are 32 bits).  So the > here should be >= or else
we could end up reading a garbage pointer from one element beyond the
end of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index 7d00f29..f86e318 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -1128,7 +1128,7 @@ static int rx_pkt(struct atm_dev *dev)
 	/* make the ptr point to the corresponding buffer desc entry */  
 	buf_desc_ptr += desc;	  
         if (!desc || (desc > iadev->num_rx_desc) || 
-                      ((buf_desc_ptr->vc_index & 0xffff) > iadev->num_vc)) { 
+                      ((buf_desc_ptr->vc_index & 0xffff) >= iadev->num_vc)) { 
             free_desc(dev, desc);
             IF_ERR(printk("IA: bad descriptor desc = %d \n", desc);)
             return -1;
