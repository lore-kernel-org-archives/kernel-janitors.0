From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 08 Mar 2005 17:26:23 +0000
Subject: [KJ] Re: [UPDATE PATCH] drivers/message/fusion/mptbase.c: Use the
Message-Id: <20050308172623.GA3272@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============099598401144213256=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============099598401144213256==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 08, 2005 at 03:41:53PM +0000, Matthew Wilcox wrote:
> On Tue, Mar 08, 2005 at 03:45:58PM +0100, Tobias Klauser wrote:
> 
> You missed this line:
> 
>         u64              mask = 0xffffffffffffffffULL;
> 
> In fact, looks to me like you can remove the variable and just use the
> DMA_64BIT_MASK constant.

Thanks for noticing. Here's an updated patch:

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/message/fusion/mptbase.c	2005-03-02 12:50:40.000000000 +0100
+++ linux-2.6.11/drivers/message/fusion/mptbase.c	2005-03-08 18:18:28.000000000 +0100
@@ -1084,7 +1084,6 @@ mptbase_probe(struct pci_dev *pdev, cons
 	u32		 psize;
 	int		 ii;
 	int		 r = -ENODEV;
-	u64		 mask = 0xffffffffffffffffULL;
 	u8		 revision;
 	u8		 pcixcmd;
 	static int	 mpt_ids = 0;
@@ -1097,15 +1096,15 @@ mptbase_probe(struct pci_dev *pdev, cons
 	
 	dinitprintk((KERN_WARNING MYNAM ": mpt_adapter_install\n"));
 	
-	if (!pci_set_dma_mask(pdev, mask)) {
+	if (!pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
 		dprintk((KERN_INFO MYNAM
 			": 64 BIT PCI BUS DMA ADDRESSING SUPPORTED\n"));
-	} else if (pci_set_dma_mask(pdev, (u64) 0xffffffff)) {
+	} else if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING MYNAM ": 32 BIT PCI BUS DMA ADDRESSING NOT SUPPORTED\n");
 		return r;
 	}
 
-	if (!pci_set_consistent_dma_mask(pdev, mask))
+	if (!pci_set_consistent_dma_mask(pdev, DMA_64BIT_MASK))
 		dprintk((KERN_INFO MYNAM
 			": Using 64 bit consistent mask\n"));
 	else

--===============099598401144213256==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============099598401144213256==--
