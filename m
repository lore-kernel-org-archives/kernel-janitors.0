From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Wed, 04 Aug 2010 04:45:19 +0000
Subject: [PATCH] staging/rt2860: fix bad dma_addr_t conversion
Message-Id: <1280897119.4986.16.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, Gorskin Ilya <revent82@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

DMA addresses are not pointers and shouldn't be assigned to NULL.
This patch was generated against today linux-next.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/rt2860/rt_pci_rbus.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/rt2860/rt_pci_rbus.c b/drivers/staging/rt2860/rt_pci_rbus.c
index 3004be6..244c754 100644
--- a/drivers/staging/rt2860/rt_pci_rbus.c
+++ b/drivers/staging/rt2860/rt_pci_rbus.c
@@ -218,7 +218,7 @@ void *RTMP_AllocateRxPacketBuffer(struct rt_rtmp_adapter *pAd,
 				   PCI_DMA_FROMDEVICE);
 	} else {
 		*VirtualAddress = (void *)NULL;
-		*PhysicalAddress = (dma_addr_t)NULL;
+		*PhysicalAddress = 0;
 	}
 
 	return (void *)pkt;
-- 
1.7.0.4



