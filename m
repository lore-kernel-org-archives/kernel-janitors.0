From: Eric Anschuetz <ericanschuetz@yahoo.com>
Date: Sat, 13 Mar 2010 00:51:29 +0000
Subject: [PATCH 1/2] Staging: rar: fixed various style issues in
Message-Id: <1268441489.4388.1.camel@Acer-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From e328efd2312d1c010e242c848b23ff1195028686 Mon Sep 17 00:00:00 2001
From: Eric Anschuetz <gh4ever@Acer-laptop.(none)>
Date: Sun, 7 Mar 2010 16:03:22 -0500
Subject: [PATCH 1/2] Staging: rar: fixed various style issues in rar_driver.c
 This is a patch to the rar_driver.c file that fixes indentation and space issues found by the checkpatch.pl tool.
 Signed-off-by: Eric Anschuetz <ericanschuetz@yahoo.com>

---
 drivers/staging/rar/rar_driver.c |   62 +++++++++++++++++++-------------------
 1 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rar/rar_driver.c b/drivers/staging/rar/rar_driver.c
index d85d189..640b06f 100644
--- a/drivers/staging/rar/rar_driver.c
+++ b/drivers/staging/rar/rar_driver.c
@@ -86,9 +86,9 @@ static struct pci_driver rar_pci_driver = {
 
 /* This function is used to retrieved RAR info using the IPC message
    bus interface */
-static int memrar_get_rar_addr(struct pci_dev* pdev,
-	                      int offset,
-	                      u32 *addr)
+static int memrar_get_rar_addr(struct pci_dev *pdev,
+				int offset,
+				u32 *addr)
 {
 	/*
 	 * ==== The Lincroft Message Bus Interface ====
@@ -140,23 +140,23 @@ static int memrar_get_rar_addr(struct pci_dev* pdev,
 	       | (offset << 8)
 	       | (LNC_MESSAGE_BYTE_WRITE_ENABLES << 4);
 
-	printk(KERN_WARNING "rar- offset to LNC MSG is %x\n",offset);
+	printk(KERN_WARNING "rar- offset to LNC MSG is %x\n", offset);
 
 	if (addr = 0)
 		return -EINVAL;
 
 	/* Send the control message */
 	result = pci_write_config_dword(pdev,
-	                          LNC_MCR_OFFSET,
-	                          message);
+				LNC_MCR_OFFSET,
+				message);
 
 	printk(KERN_WARNING "rar- result from send ctl register is %x\n"
-	  ,result);
+	  , result);
 
 	if (!result)
 		result = pci_read_config_dword(pdev,
-		                              LNC_MDR_OFFSET,
-				              addr);
+						LNC_MDR_OFFSET,
+						addr);
 
 	printk(KERN_WARNING "rar- result from read data register is %x\n",
 	  result);
@@ -170,9 +170,9 @@ static int memrar_get_rar_addr(struct pci_dev* pdev,
 		return 0;
 }
 
-static int memrar_set_rar_addr(struct pci_dev* pdev,
-	                      int offset,
-	                      u32 addr)
+static int memrar_set_rar_addr(struct pci_dev *pdev,
+				int offset,
+				u32 addr)
 {
 	/*
 	 * ==== The Lincroft Message Bus Interface ====
@@ -225,23 +225,23 @@ static int memrar_set_rar_addr(struct pci_dev* pdev,
 	       | (offset << 8)
 	       | (LNC_MESSAGE_BYTE_WRITE_ENABLES << 4);
 
-	printk(KERN_WARNING "rar- offset to LNC MSG is %x\n",offset);
+	printk(KERN_WARNING "rar- offset to LNC MSG is %x\n", offset);
 
 	if (addr = 0)
 		return -EINVAL;
 
 	/* Send the control message */
 	result = pci_write_config_dword(pdev,
-	                          LNC_MDR_OFFSET,
-	                          addr);
+				LNC_MDR_OFFSET,
+				addr);
 
 	printk(KERN_WARNING "rar- result from send ctl register is %x\n"
-	  ,result);
+	  , result);
 
 	if (!result)
 		result = pci_write_config_dword(pdev,
-		                              LNC_MCR_OFFSET,
-				              message);
+						LNC_MCR_OFFSET,
+						message);
 
 	printk(KERN_WARNING "rar- result from write data register is %x\n",
 	  result);
@@ -284,15 +284,15 @@ static int memrar_init_rar_params(struct pci_dev *pdev)
 	/* struct pci_dev *pdev = pci_get_bus_and_slot(0, PCI_DEVFN(0,0)); */
 
 	if (pdev = NULL)
-	       return -ENODEV;
+		return -ENODEV;
 
 	for (i = offsets; i != end; ++i, ++n) {
-	       if (memrar_get_rar_addr (pdev,
-		                       (*i).low,
-		                       &(rar_addr[n].low)) != 0
-		   || memrar_get_rar_addr (pdev,
-		                          (*i).high,
-		                          &(rar_addr[n].high)) != 0) {
+		if (memrar_get_rar_addr(pdev,
+					(*i).low,
+					&(rar_addr[n].low)) != 0
+			|| memrar_get_rar_addr(pdev,
+					(*i).high,
+					&(rar_addr[n].high)) != 0) {
 		       result = -1;
 		       break;
 	       }
@@ -302,7 +302,7 @@ static int memrar_init_rar_params(struct pci_dev *pdev)
 	/* pci_dev_put(pdev); */
 
 	if (result = 0) {
-	if(1) {
+	if (1) {
 	       size_t z;
 	       for (z = 0; z != MRST_NUM_RAR; ++z) {
 			printk(KERN_WARNING "rar - BRAR[%Zd] physical address low\n"
@@ -347,7 +347,7 @@ static int __devinit rar_probe(struct pci_dev *pdev, const struct pci_device_id
 
 	/* Initialize the RAR parameters, which have to be retrieved */
 	/* via the message bus service */
-	error=memrar_init_rar_params(rar_dev);
+	error = memrar_init_rar_params(rar_dev);
 
 	if (error) {
 		DEBUG_PRINT_0(RAR_DEBUG_LEVEL_EXTENDED,
@@ -396,10 +396,10 @@ MODULE_LICENSE("GPL");
  * The function returns a 0 upon success or a -1 if there is no RAR
  * facility on this system.
  */
-int get_rar_address(int rar_index,struct RAR_address_struct *addresses)
+int get_rar_address(int rar_index, struct RAR_address_struct *addresses)
 {
 	if (registered && (rar_index < 3) && (rar_index >= 0)) {
-		*addresses=rar_addr[rar_index];
+		*addresses = rar_addr[rar_index];
 		/* strip off lock bit information  */
 		addresses->low = addresses->low & 0xfffffff0;
 		addresses->high = addresses->high & 0xfffffff0;
@@ -431,10 +431,10 @@ int lock_rar(int rar_index)
 	int result;
 if (registered && (rar_index < 3) && (rar_index >= 0)) {
 	/* first make sure that lock bits are clear (this does lock) */
-	working_addr=rar_addr[rar_index].low & 0xfffffff0;
+	working_addr = rar_addr[rar_index].low & 0xfffffff0;
 
 	/* now send that value to the register using the IPC */
-        result=memrar_set_rar_addr(rar_dev,rar_index,working_addr);
+	result = memrar_set_rar_addr(rar_dev, rar_index, working_addr);
 	return result;
 	}
 
-- 
1.6.3.3




