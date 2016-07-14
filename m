From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Jul 2016 10:47:01 +0000
Subject: [patch] parisc: delete some unused functions from firmware.c
Message-Id: <20160714104700.GH18175@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, kernel-janitors@vger.kernel.org

The pdc_pat_io_pci_cfg_read() is problematic because it's missing some
break statements so it copies 4 bytes regardless of whether you asked
for only 1 or 2.  But since neither this nor the write function are
used, it means we can just delete the code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/parisc/include/asm/pdcpat.h b/arch/parisc/include/asm/pdcpat.h
index 47539f1..c89d8c0 100644
--- a/arch/parisc/include/asm/pdcpat.h
+++ b/arch/parisc/include/asm/pdcpat.h
@@ -293,11 +293,6 @@ extern int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, void *hpa);
 
 extern int pdc_pat_pd_get_addr_map(unsigned long *actual_len, void *mem_addr, unsigned long count, unsigned long offset);
 
-
-extern int pdc_pat_io_pci_cfg_read(unsigned long pci_addr, int pci_size, u32 *val); 
-extern int pdc_pat_io_pci_cfg_write(unsigned long pci_addr, int pci_size, u32 val); 
-
-
 /* Flag to indicate this is a PAT box...don't use this unless you
 ** really have to...it might go away some day.
 */
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 2239590..12545a2 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1338,51 +1338,6 @@ int pdc_pat_pd_get_addr_map(unsigned long *actual_len, void *mem_addr,
 	return retval;
 }
 
-/**
- * pdc_pat_io_pci_cfg_read - Read PCI configuration space.
- * @pci_addr: PCI configuration space address for which the read request is being made.
- * @pci_size: Size of read in bytes. Valid values are 1, 2, and 4. 
- * @mem_addr: Pointer to return memory buffer.
- *
- */
-int pdc_pat_io_pci_cfg_read(unsigned long pci_addr, int pci_size, u32 *mem_addr)
-{
-	int retval;
-	unsigned long flags;
-
-	spin_lock_irqsave(&pdc_lock, flags);
-	retval = mem_pdc_call(PDC_PAT_IO, PDC_PAT_IO_PCI_CONFIG_READ,
-					__pa(pdc_result), pci_addr, pci_size);
-	switch(pci_size) {
-		case 1: *(u8 *) mem_addr =  (u8)  pdc_result[0];
-		case 2: *(u16 *)mem_addr =  (u16) pdc_result[0];
-		case 4: *(u32 *)mem_addr =  (u32) pdc_result[0];
-	}
-	spin_unlock_irqrestore(&pdc_lock, flags);
-
-	return retval;
-}
-
-/**
- * pdc_pat_io_pci_cfg_write - Retrieve information about memory address ranges.
- * @pci_addr: PCI configuration space address for which the write  request is being made.
- * @pci_size: Size of write in bytes. Valid values are 1, 2, and 4. 
- * @value: Pointer to 1, 2, or 4 byte value in low order end of argument to be 
- *         written to PCI Config space.
- *
- */
-int pdc_pat_io_pci_cfg_write(unsigned long pci_addr, int pci_size, u32 val)
-{
-	int retval;
-	unsigned long flags;
-
-	spin_lock_irqsave(&pdc_lock, flags);
-	retval = mem_pdc_call(PDC_PAT_IO, PDC_PAT_IO_PCI_CONFIG_WRITE,
-				pci_addr, pci_size, val);
-	spin_unlock_irqrestore(&pdc_lock, flags);
-
-	return retval;
-}
 #endif /* CONFIG_64BIT */
 
 
