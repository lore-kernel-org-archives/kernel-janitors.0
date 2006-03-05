From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 15:02:22 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/block
Message-Id: <1141570942.13183.17.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61072632744871891=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============61072632744871891==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts drivers/block to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/block/paride/bpck6.c.orig	2006-03-05 11:07:13.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/block/paride/bpck6.c	2006-03-05 11:07:29.000000000 +0100
@@ -224,10 +224,9 @@ static void bpck6_log_adapter( PIA *pi, 
 
 static int bpck6_init_proto(PIA *pi)
 {
-	Interface *p = kmalloc(sizeof(Interface), GFP_KERNEL);
+	Interface *p = kzalloc(sizeof(Interface), GFP_KERNEL);
 
 	if (p) {
-		memset(p, 0, sizeof(Interface));
 		pi->private = (unsigned long)p;
 		return 0;
 	}
--- linux-2.6.16-rc5-mm1/drivers/block/cciss_scsi.c.orig	2006-03-05 11:07:44.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/block/cciss_scsi.c	2006-03-05 11:08:09.000000000 +0100
@@ -1027,12 +1027,11 @@ cciss_update_non_disk_devices(int cntl_n
 	int i;
 
 	c = (ctlr_info_t *) hba[cntl_num];	
-	ld_buff = kmalloc(reportlunsize, GFP_KERNEL);
+	ld_buff = kzalloc(reportlunsize, GFP_KERNEL);
 	if (ld_buff == NULL) {
 		printk(KERN_ERR "cciss: out of memory\n");
 		return;
 	}
-	memset(ld_buff, 0, reportlunsize);
 	inq_buff = kmalloc(OBDR_TAPE_INQ_SIZE, GFP_KERNEL);
         if (inq_buff == NULL) {
                 printk(KERN_ERR "cciss: out of memory\n");
--- linux-2.6.16-rc5-mm1/drivers/block/cciss.c.orig	2006-03-05 11:09:08.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/block/cciss.c	2006-03-05 11:10:40.000000000 +0100
@@ -996,13 +996,11 @@ static int cciss_ioctl(struct inode *ino
 			status = -EINVAL;
 			goto cleanup1;
 		}
-		buff = (unsigned char **) kmalloc(MAXSGENTRIES * 
-				sizeof(char *), GFP_KERNEL);
+		buff = kzalloc(MAXSGENTRIES * sizeof(char *), GFP_KERNEL);
 		if (!buff) {
 			status = -ENOMEM;
 			goto cleanup1;
 		}
-		memset(buff, 0, MAXSGENTRIES);
 		buff_size = (int *) kmalloc(MAXSGENTRIES * sizeof(int), 
 					GFP_KERNEL);
 		if (!buff_size) {
@@ -2941,13 +2939,12 @@ static void cciss_getgeometry(int cntl_n
 	int block_size;
 	int total_size; 
 
-	ld_buff = kmalloc(sizeof(ReportLunData_struct), GFP_KERNEL);
+	ld_buff = kzalloc(sizeof(ReportLunData_struct), GFP_KERNEL);
 	if (ld_buff == NULL)
 	{
 		printk(KERN_ERR "cciss: out of memory\n");
 		return;
 	}
-	memset(ld_buff, 0, sizeof(ReportLunData_struct));
 	size_buff = kmalloc(sizeof( ReadCapdata_struct), GFP_KERNEL);
         if (size_buff == NULL)
         {
@@ -3061,10 +3058,9 @@ static int alloc_cciss_hba(void)
 	for(i=0; i< MAX_CTLR; i++) {
 		if (!hba[i]) {
 			ctlr_info_t *p;
-			p = kmalloc(sizeof(ctlr_info_t), GFP_KERNEL);
+			p = kzalloc(sizeof(ctlr_info_t), GFP_KERNEL);
 			if (!p)
 				goto Enomem;
-			memset(p, 0, sizeof(ctlr_info_t));
 			for (n = 0; n < NWD; n++)
 				p->gendisk[n] = disk[n];
 			hba[i] = p;
--- linux-2.6.16-rc5-mm1/drivers/block/DAC960.c.orig	2006-03-05 11:10:48.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/block/DAC960.c	2006-03-05 11:12:05.000000000 +0100
@@ -312,11 +312,10 @@ static boolean DAC960_CreateAuxiliaryStr
 		CommandsRemaining = CommandAllocationGroupSize;
 	  CommandGroupByteCount =
 		CommandsRemaining * CommandAllocationLength;
-	  AllocationPointer = kmalloc(CommandGroupByteCount, GFP_ATOMIC);
+	  AllocationPointer = kzalloc(CommandGroupByteCount, GFP_ATOMIC);
 	  if (AllocationPointer == NULL)
 		return DAC960_Failure(Controller,
 					"AUXILIARY STRUCTURE CREATION");
-	  memset(AllocationPointer, 0, CommandGroupByteCount);
 	 }
       Command = (DAC960_Command_T *) AllocationPointer;
       AllocationPointer += CommandAllocationLength;
@@ -2710,14 +2709,12 @@ DAC960_DetectController(struct pci_dev *
   void __iomem *BaseAddress;
   int i;
 
-  Controller = (DAC960_Controller_T *)
-	kmalloc(sizeof(DAC960_Controller_T), GFP_ATOMIC);
+  Controller = kzalloc(sizeof(DAC960_Controller_T), GFP_ATOMIC);
   if (Controller == NULL) {
 	DAC960_Error("Unable to allocate Controller structure for "
                        "Controller at\n", NULL);
 	return NULL;
   }
-  memset(Controller, 0, sizeof(DAC960_Controller_T));
   Controller->ControllerNumber = DAC960_ControllerCount;
   DAC960_Controllers[DAC960_ControllerCount++] = Controller;
   Controller->Bus = PCI_Device->bus->number;



--===============61072632744871891==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61072632744871891==--
