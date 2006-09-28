From: "Galya Tcharny" <gtcharny@gmail.com>
Date: Thu, 28 Sep 2006 07:58:42 +0000
Subject: [KJ]  [PATCH] Check kmalloc() return value
Message-Id: <933d0f3f0609280058s7bbff814w4237926929367439@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Added checks for kmalloc() return value.

Signed-off-by: Galya Tcharny <gtcharny@gmail.com>

 drivers/net/au1000_eth.c |    3 +++
 drivers/net/s2io.c       |    3 +++
 2 files changed, 6 insertions(+)

diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff
linux-2.6.18-orig/drivers/net/au1000_eth.c
linux-2.6.18/drivers/net/au1000_eth.c
--- linux-2.6.18-orig/drivers/net/au1000_eth.c 2006-09-27
14:51:31.000000000 +0300
+++ linux-2.6.18/drivers/net/au1000_eth.c 2006-09-28 09:24:11.000000000 +0300
@@ -717,6 +717,9 @@ static struct net_device * au1000_probe(
  aup->mii_bus.name = "au1000_eth_mii";
  aup->mii_bus.id = aup->mac_id;
  aup->mii_bus.irq = kmalloc(sizeof(int)*PHY_MAX_ADDR, GFP_KERNEL);
+ if(aup->mii_bus.irq = NULL) {
+  goto err_out;
+ }
  for(i = 0; i < PHY_MAX_ADDR; ++i)
   aup->mii_bus.irq[i] = PHY_POLL;

diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff
linux-2.6.18-orig/drivers/net/s2io.c linux-2.6.18/drivers/net/s2io.c
--- linux-2.6.18-orig/drivers/net/s2io.c 2006-09-27 14:51:33.000000000 +0300
+++ linux-2.6.18/drivers/net/s2io.c 2006-09-28 09:26:32.000000000 +0300
@@ -624,6 +624,9 @@ static int init_shared_mem(struct s2io_n
    rx_blocks->rxds = kmalloc(sizeof(rxd_info_t)*
         rxd_count[nic->rxd_mode],
         GFP_KERNEL);
+   if(rx_blocks->rxds = NULL) {
+    return -ENOMEM;
+   }
    for (l=0; l<rxd_count[nic->rxd_mode];l++) {
     rx_blocks->rxds[l].virt_addr       rx_blocks->block_virt_addr +
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
