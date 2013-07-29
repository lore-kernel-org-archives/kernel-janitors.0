From: Kevin Curtis <Kevin.Curtis@farsite.com>
Date: Mon, 29 Jul 2013 12:58:00 +0000
Subject: RE: Updated FarSync driver
Message-Id: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD635@SOLO.hq.farsitecommunications.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
In-Reply-To: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,
    Thanks for the comments so far.  I'll start by working out how to spilt the patch up and then work on the individual comments.


Regards

Kevin

-----Original Message-----
From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
Sent: 29 July 2013 12:43
To: Kevin Curtis
Cc: kernel-janitors@vger.kernel.org; Dermot Smith
Subject: Re: Updated FarSync driver

Oh, in my previous email I forgot to say that the patches should go to netdev with Dave Miller CC'd.

@@ -20,18 +20,29 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/version.h>
-#include <linux/pci.h>
+#include <linux/fs.h>
 #include <linux/sched.h>
-#include <linux/slab.h>
+#include <linux/proc_fs.h>
+#include <linux/pci.h>

There is no reason to shift the pci.h include around.  Don't do that.

+#define FST_DRIVER_TYPE "WAN"
+
+

Don't put two blank lines in a row.

+module_param(fst_iocinfo_version, int, S_IRUGO);

I don't understand what this is for.  Probably it doesn't need to be configurable.

Btw, here we are moving the module_param definitions around and mostly they are unchanged.  When you are breaking the patch into lots of patches that can be one of the early ones:

[patch 3/xx] farsight: move some definitions around

Moving the definitions in a separate patch is easy to review and it makes the next patch (where you add in a few more definitions), it makes that patch much smaller and easier to review as well.

+typedef struct class class_t;
+#define CLASS_DEVICE_CREATE(class, dev, device, fmt, rest) 
+device_create(class, device, dev, NULL, fmt, rest)
 

checkpatch will complain about the class_t typedef, that's not how typedefs are used in the kernel.  Also it's too generic a name.
Also don't do that #define just call device_create() directly.

/*      Card shared memory layout
  *      ============  */
-#pragma pack(1)
+#pragma pack(2)
 

Don't use #pragmas in the kernel.  Use the __packed macro to define packed structs.

struct foo {
	char a;
	int b;
} __packed;

+typedef struct fst_fifo {
+	u16 fifo_length;
+	u16 read_idx;
+	u16 write_idx;
+	short overflow_idx;
+	u8 data[4];
+} FIFO, *PFIFO;

Typedef.  "FIFO" and "PFIFO" are terrible names and way too generic.
Use "struct fst_fifo" throughout.

+/*      Printing short cuts
+ */
+#define printk_err(fmt,A...)    printk ( KERN_ERR     FST_NAME ": " fmt, ## A )
+#define printk_warn(fmt,A...)   printk ( KERN_WARNING FST_NAME ": " fmt, ## A )
+#define printk_info(fmt,A...)   printk ( KERN_INFO    FST_NAME ": " fmt, ## A )
+

This seems like a compat layer.  Checkpatch will hopefully complain about this.

/*
  *      PCI ID lookup table
  */
 static DEFINE_PCI_DEVICE_TABLE(fst_pci_dev_id) = {
-	{PCI_VENDOR_ID_FARSITE, PCI_DEVICE_ID_FARSITE_T2P, PCI_ANY_ID, 
-	 PCI_ANY_ID, 0, 0, FST_TYPE_T2P},
-
-	{PCI_VENDOR_ID_FARSITE, PCI_DEVICE_ID_FARSITE_T4P, PCI_ANY_ID, 
-	 PCI_ANY_ID, 0, 0, FST_TYPE_T4P},
-
-	{PCI_VENDOR_ID_FARSITE, PCI_DEVICE_ID_FARSITE_T1U, PCI_ANY_ID, 
-	 PCI_ANY_ID, 0, 0, FST_TYPE_T1U},
-
-	{PCI_VENDOR_ID_FARSITE, PCI_DEVICE_ID_FARSITE_T2U, PCI_ANY_ID, 
-	 PCI_ANY_ID, 0, 0, FST_TYPE_T2U},
-
-	{PCI_VENDOR_ID_FARSITE, PCI_DEVICE_ID_FARSITE_T4U, PCI_ANY_ID, 
-	 PCI_ANY_ID, 0, 0, FST_TYPE_T4U},
-
-	{PCI_VENDOR_ID_FARSITE, PCI_DEVICE_ID_FARSITE_TE1, PCI_ANY_ID, 
-	 PCI_ANY_ID, 0, 0, FST_TYPE_TE1},
+	{
+#ifdef FSC_TXP_SUPPORT
+	PCI_VENDOR_ID_FARSITE, PCI_DEVICE_ID_FARSITE_T2P, PCI_ANY_ID,
+	PCI_ANY_ID, 0, 0, FST_TYPE_T2P}, {
+	PCI_VENDOR_ID_FARSITE, PCI_DEVICE_ID_FARSITE_T4P, PCI_ANY_ID,
+	PCI_ANY_ID, 0, 0, FST_TYPE_T4P}, {
+#endif

The original formatting was way better here.

Anyway, I feel like I have given you a lot to work on.

The good news is that this patch is mostly about adding a new driver and that can be done in one patch.

I saw later on this driver creates a /proc file.  That should probably sysfs file instead.  We don't add /proc files these days.

regards,
dan carpenter

