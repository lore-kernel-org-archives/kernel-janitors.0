From: Dan Carpenter <error27@gmail.com>
Date: Fri, 30 Jul 2010 09:06:04 +0000
Subject: [patch] hp100: unmap memory on error path
Message-Id: <20100730090604.GY26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Stephen Hemminger <shemminger@vyatta.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There was an error path where "mem_ptr_virt" didn't get unmapped.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/hp100.c b/drivers/net/hp100.c
index acbf0d0..ce587f4 100644
--- a/drivers/net/hp100.c
+++ b/drivers/net/hp100.c
@@ -720,9 +720,10 @@ static int __devinit hp100_probe1(struct net_device *dev, int ioaddr,
 		/* Conversion to new PCI API :
 		 * Pages are always aligned and zeroed, no need to it ourself.
 		 * Doc says should be OK for EISA bus as well - Jean II */
-		if ((lp->page_vaddr_algn = pci_alloc_consistent(lp->pci_dev, MAX_RINGSIZE, &page_baddr)) = NULL) {
+		lp->page_vaddr_algn = pci_alloc_consistent(lp->pci_dev, MAX_RINGSIZE, &page_baddr);
+		if (!lp->page_vaddr_algn) {
 			err = -ENOMEM;
-			goto out2;
+			goto out_mem_ptr;
 		}
 		lp->whatever_offset = ((u_long) page_baddr) - ((u_long) lp->page_vaddr_algn);
 
@@ -798,6 +799,7 @@ out3:
 		pci_free_consistent(lp->pci_dev, MAX_RINGSIZE + 0x0f,
 				    lp->page_vaddr_algn,
 				    virt_to_whatever(dev, lp->page_vaddr_algn));
+out_mem_ptr:
 	if (mem_ptr_virt)
 		iounmap(mem_ptr_virt);
 out2:
