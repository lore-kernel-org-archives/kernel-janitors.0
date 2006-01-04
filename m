From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 04 Jan 2006 16:05:26 +0000
Subject: [KJ] [PATCH] drivers/block: Use ARRAY_SIZE macro
Message-Id: <20060104160526.GA1243@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89067915901319883=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89067915901319883==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]) and remove a
duplicate of ARRAY_SIZE. Some trailing whitespaces are also removed.

drivers/block/acsi* has been left out as it's marked BROKEN.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 drivers/block/DAC960.c   |    2 +-
 drivers/block/amiflop.c  |    2 +-
 drivers/block/ataflop.c  |    2 +-
 drivers/block/cciss.c    |    4 ++--
 drivers/block/cpqarray.c |    4 ++--
 drivers/block/floppy.c   |    9 ++++-----
 drivers/block/xd.c       |    6 +++---
 7 files changed, 14 insertions(+), 15 deletions(-)

diff -X dontdiff -urpN linux-2.6.15/drivers/block/amiflop.c linux-2.6.15~array_size/drivers/block/amiflop.c
--- linux-2.6.15/drivers/block/amiflop.c	2006-01-03 14:41:54.000000000 +0100
+++ linux-2.6.15~array_size/drivers/block/amiflop.c	2006-01-03 15:16:09.000000000 +0100
@@ -131,7 +131,7 @@ static struct fd_drive_type drive_types[
 { FD_DD_5,	"DD 5.25", 40, 2, 14716, 13630, 1, 40, 81, 6, 30, 2},
 { FD_NODRIVE, "No Drive", 0, 0,     0,     0, 0,  0,  0,  0,  0, 0}
 };
-static int num_dr_types = sizeof(drive_types) / sizeof(drive_types[0]);
+static int num_dr_types = ARRAY_SIZE(drive_types);
 
 static int amiga_read(int), dos_read(int);
 static void amiga_write(int), dos_write(int);
diff -X dontdiff -urpN linux-2.6.15/drivers/block/ataflop.c linux-2.6.15~array_size/drivers/block/ataflop.c
--- linux-2.6.15/drivers/block/ataflop.c	2005-10-28 08:56:26.000000000 +0200
+++ linux-2.6.15~array_size/drivers/block/ataflop.c	2006-01-03 15:16:09.000000000 +0100
@@ -181,7 +181,7 @@ static struct {
 	{  6, TYPE_HD },	/* 31: H1640    <- was H1600 == h1600 for PC */
 };
 
-#define NUM_DISK_MINORS (sizeof(minor2disktype)/sizeof(*minor2disktype))
+#define NUM_DISK_MINORS ARRAY_SIZE(minor2disktype)
 
 /*
  * Maximum disk size (in kilobytes). This default is used whenever the
diff -X dontdiff -urpN linux-2.6.15/drivers/block/cciss.c linux-2.6.15~array_size/drivers/block/cciss.c
--- linux-2.6.15/drivers/block/cciss.c	2006-01-03 14:41:54.000000000 +0100
+++ linux-2.6.15~array_size/drivers/block/cciss.c	2006-01-04 16:39:05.000000000 +0100
@@ -103,7 +103,7 @@ static const struct pci_device_id cciss_
 };
 MODULE_DEVICE_TABLE(pci, cciss_pci_device_id);
 
-#define NR_PRODUCTS (sizeof(products)/sizeof(struct board_type))
+#define NR_PRODUCTS ARRAY_SIZE(products)
 
 /*  board_id = Subsystem Device ID & Vendor ID
  *  product = Marketing Name for the board
@@ -2775,7 +2775,7 @@ static int cciss_pci_init(ctlr_info_t *c
 	c->board_id = board_id;
 
 #ifdef CCISS_DEBUG
-	print_cfg_table(c->cfgtable); 
+	print_cfg_table(c->cfgtable);
 #endif /* CCISS_DEBUG */
 
 	for(i=0; i<NR_PRODUCTS; i++) {
diff -X dontdiff -urpN linux-2.6.15/drivers/block/cpqarray.c linux-2.6.15~array_size/drivers/block/cpqarray.c
--- linux-2.6.15/drivers/block/cpqarray.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15~array_size/drivers/block/cpqarray.c	2006-01-04 16:40:27.000000000 +0100
@@ -72,11 +72,11 @@ static ctlr_info_t *hba[MAX_CTLR];
 
 static int eisa[8];
 
-#define NR_PRODUCTS (sizeof(products)/sizeof(struct board_type))
+#define NR_PRODUCTS ARRAY_SIZE(products)
 
 /*  board_id = Subsystem Device ID & Vendor ID
  *  product = Marketing Name for the board
- *  access = Address of the struct of function pointers 
+ *  access = Address of the struct of function pointers
  */
 static struct board_type products[] = {
 	{ 0x0040110E, "IDA",			&smart1_access },
diff -X dontdiff -urpN linux-2.6.15/drivers/block/DAC960.c linux-2.6.15~array_size/drivers/block/DAC960.c
--- linux-2.6.15/drivers/block/DAC960.c	2006-01-03 14:41:54.000000000 +0100
+++ linux-2.6.15~array_size/drivers/block/DAC960.c	2006-01-03 15:16:09.000000000 +0100
@@ -3767,7 +3767,7 @@ static void DAC960_V1_ProcessCompletedCo
 	      if (SenseKey == DAC960_SenseKey_VendorSpecific &&
 		  AdditionalSenseCode == 0x80 &&
 		  AdditionalSenseCodeQualifier <
-		  sizeof(DAC960_EventMessages) / sizeof(char *))
+		  ARRAY_SIZE(DAC960_EventMessages))
 		DAC960_Critical("Physical Device %d:%d %s\n", Controller,
 				EventLogEntry->Channel,
 				EventLogEntry->TargetID,
diff -X dontdiff -urpN linux-2.6.15/drivers/block/floppy.c linux-2.6.15~array_size/drivers/block/floppy.c
--- linux-2.6.15/drivers/block/floppy.c	2006-01-03 14:41:54.000000000 +0100
+++ linux-2.6.15~array_size/drivers/block/floppy.c	2006-01-03 15:16:09.000000000 +0100
@@ -479,7 +479,6 @@ static struct floppy_struct floppy_type[
 	{ 3200,20,2,80,0,0x1C,0x00,0xCF,0x2C,"H1600" }, /* 31 1.6MB 3.5"    */
 };
 
-#define	NUMBER(x)	(sizeof(x) / sizeof(*(x)))
 #define SECTSIZE (_FD_SECTSIZE(*floppy))
 
 /* Auto-detection: Disk type used until the next media change occurs. */
@@ -3645,7 +3644,7 @@ static void __init config_types(void)
 		const char *name = NULL;
 		static char temparea[32];
 
-		if (type < NUMBER(default_drive_params)) {
+		if (type < ARRAY_SIZE(default_drive_params)) {
 			params = &default_drive_params[type].params;
 			if (type) {
 				name = default_drive_params[type].name;
@@ -3960,7 +3959,7 @@ static void __init register_devfs_entrie
 {
 	int base_minor = (drive < 4) ? drive : (124 + drive);
 
-	if (UDP->cmos < NUMBER(default_drive_params)) {
+	if (UDP->cmos < ARRAY_SIZE(default_drive_params)) {
 		int i = 0;
 		do {
 			int minor = base_minor + (table_sup[UDP->cmos][i] << 2);
@@ -4218,7 +4217,7 @@ static struct kobject *floppy_find(dev_t
 	    !(allowed_drive_mask & (1 << drive)) ||
 	    fdc_state[FDC(drive)].version == FDC_NONE)
 		return NULL;
-	if (((*part >> 2) & 0x1f) >= NUMBER(floppy_type))
+	if (((*part >> 2) & 0x1f) >= ARRAY_SIZE(floppy_type))
 		return NULL;
 	*part = 0;
 	return get_disk(disks[drive]);
@@ -4570,7 +4569,7 @@ static void unregister_devfs_entries(int
 {
 	int i;
 
-	if (UDP->cmos < NUMBER(default_drive_params)) {
+	if (UDP->cmos < ARRAY_SIZE(default_drive_params)) {
 		i = 0;
 		do {
 			devfs_remove("floppy/%d%s", drive,
diff -X dontdiff -urpN linux-2.6.15/drivers/block/xd.c linux-2.6.15~array_size/drivers/block/xd.c
--- linux-2.6.15/drivers/block/xd.c	2005-10-28 08:56:26.000000000 +0200
+++ linux-2.6.15~array_size/drivers/block/xd.c	2006-01-03 15:16:09.000000000 +0100
@@ -276,11 +276,11 @@ static u_char __init xd_detect (u_char *
 		return(1);
 	}
 
-	for (i = 0; i < (sizeof(xd_bases) / sizeof(xd_bases[0])); i++) {
+	for (i = 0; i < ARRAY_SIZE(xd_bases); i++) {
 		void __iomem *p = ioremap(xd_bases[i], 0x2000);
 		if (!p)
 			continue;
-		for (j = 1; j < (sizeof(xd_sigs) / sizeof(xd_sigs[0])); j++) {
+		for (j = 1; j < ARRAY_SIZE(xd_sigs); j++) {
 			const char *s = xd_sigs[j].string;
 			if (check_signature(p + xd_sigs[j].offset, s, strlen(s))) {
 				*controller = j;
@@ -1017,7 +1017,7 @@ static void __init do_xd_setup (int *int
 		case 2: if ((integers[2] > 0) && (integers[2] < 16))
 				xd_irq = integers[2];
 		case 1: xd_override = 1;
-			if ((integers[1] >= 0) && (integers[1] < (sizeof(xd_sigs) / sizeof(xd_sigs[0]))))
+			if ((integers[1] >= 0) && (integers[1] < ARRAY_SIZE(xd_sigs)))
 				xd_type = integers[1];
 		case 0: break;
 		default:printk("xd: too many parameters for xd\n");

--===============89067915901319883==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89067915901319883==--
