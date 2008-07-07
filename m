From: Nilay Vaish <nilay@cse.iitd.ernet.in>
Date: Mon, 07 Jul 2008 20:41:28 +0000
Subject: [PATCH 2.6.25.10 1/1] usb: adds log levels to printk statements
Message-Id: <alpine.LFD.1.10.0807080412160.21099@kesari.cse.iitd.ernet.in>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Nilay Vaish <nilay@cse.iitd.ac.in>

This patch adds log levels to printk statements to the code under 
drivers/usb directory. All statements have been covered except those in 
files in the gadgets directory and those that print data in loops.

Signed-off-by: Nilay Vaish <nilay@cse.iitd.ac.in>
---
diff -uprN -X /usr/src/linux-2.6.25.10/Documentation/dontdiff a/drivers/usb/host/sl811_cs.c b/drivers/usb/host/sl811_cs.c
--- a/drivers/usb/host/sl811_cs.c	2008-07-03 09:16:47.000000000 +0530
+++ b/drivers/usb/host/sl811_cs.c	2008-07-07 23:11:53.712561184 +0530
@@ -266,7 +266,7 @@ next_entry:
 	if (sl811_hc_init(parent, link->io.BasePort1, link->irq.AssignedIRQ)
 			< 0) {
 cs_failed:
-		printk("sl811_cs_config failed\n");
+		printk(KERN_ERR "sl811_cs_config failed\n");
 		cs_error(link, last_fn, last_ret);
 		sl811_cs_release(link);
 		return  -ENODEV;
diff -uprN -X /usr/src/linux-2.6.25.10/Documentation/dontdiff a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
--- a/drivers/usb/storage/alauda.c	2008-07-03 09:16:47.000000000 +0530
+++ b/drivers/usb/storage/alauda.c	2008-07-07 23:11:53.713561032 +0530
@@ -307,7 +307,7 @@ static int alauda_init_media(struct us_d
 		data[0], data[1], data[2], data[3]);
 	media_info = alauda_card_find_id(data[1]);
 	if (media_info = NULL) {
-		printk("alauda_init_media: Unrecognised media signature: "
+		printk(KERN_ERR "alauda_init_media: Unrecognised media signature: "
 			"%02X %02X %02X %02X\n",
 			data[0], data[1], data[2], data[3]);
 		return USB_STOR_TRANSPORT_ERROR;
@@ -518,7 +518,7 @@ static int alauda_read_map(struct us_dat
 
 		/* check even parity */
 		if (parity[data[6] ^ data[7]]) {
-			printk("alauda_read_map: Bad parity in LBA for block %d"
+			printk(KERN_WARNING "alauda_read_map: Bad parity in LBA for block %d"
 			       " (%02X %02X)\n", i, data[6], data[7]);
 			pba_to_lba[i] = UNUSABLE;
 			continue;
@@ -538,13 +538,13 @@ static int alauda_read_map(struct us_dat
 		 */
 
 		if (lba_offset >= uzonesize) {
-			printk("alauda_read_map: Bad low LBA %d for block %d\n",
+			printk(KERN_WARNING "alauda_read_map: Bad low LBA %d for block %d\n",
 			       lba_real, blocknum);
 			continue;
 		}
 
 		if (lba_to_pba[lba_offset] != UNDEF) {
-			printk("alauda_read_map: LBA %d seen for PBA %d and %d\n",
+			printk(KERN_WARNING "alauda_read_map: LBA %d seen for PBA %d and %d\n",
 			       lba_real, lba_to_pba[lba_offset], blocknum);
 			continue;
 		}
@@ -712,13 +712,13 @@ static int alauda_write_lba(struct us_da
 	if (pba = 1) {
 		/* Maybe it is impossible to write to PBA 1.
 		   Fake success, but don't do anything. */
-		printk("alauda_write_lba: avoid writing to pba 1\n");
+		printk(KERN_NOTICE "alauda_write_lba: avoid writing to pba 1\n");
 		return USB_STOR_TRANSPORT_GOOD;
 	}
 
 	new_pba = alauda_find_unused_pba(&MEDIA_INFO(us), zone);
 	if (!new_pba) {
-		printk("alauda_write_lba: Out of unused blocks\n");
+		printk(KERN_WARNING "alauda_write_lba: Out of unused blocks\n");
 		return USB_STOR_TRANSPORT_ERROR;
 	}
 
@@ -818,7 +818,7 @@ static int alauda_read_data(struct us_da
 	len = min(sectors, blocksize) * (pagesize + 64);
 	buffer = kmalloc(len, GFP_NOIO);
 	if (buffer = NULL) {
-		printk("alauda_read_data: Out of memory\n");
+		printk(KERN_WARNING "alauda_read_data: Out of memory\n");
 		return USB_STOR_TRANSPORT_ERROR;
 	}
 
@@ -911,7 +911,7 @@ static int alauda_write_data(struct us_d
 	len = min(sectors, blocksize) * pagesize;
 	buffer = kmalloc(len, GFP_NOIO);
 	if (buffer = NULL) {
-		printk("alauda_write_data: Out of memory\n");
+		printk(KERN_WARNING "alauda_write_data: Out of memory\n");
 		return USB_STOR_TRANSPORT_ERROR;
 	}
 
@@ -921,7 +921,7 @@ static int alauda_write_data(struct us_d
 	 */
 	blockbuffer = kmalloc((pagesize + 64) * blocksize, GFP_NOIO);
 	if (blockbuffer = NULL) {
-		printk("alauda_write_data: Out of memory\n");
+		printk(KERN_WARNING "alauda_write_data: Out of memory\n");
 		kfree(buffer);
 		return USB_STOR_TRANSPORT_ERROR;
 	}
diff -uprN -X /usr/src/linux-2.6.25.10/Documentation/dontdiff a/drivers/usb/storage/sddr09.c b/drivers/usb/storage/sddr09.c
--- a/drivers/usb/storage/sddr09.c	2008-07-03 09:16:47.000000000 +0530
+++ b/drivers/usb/storage/sddr09.c	2008-07-07 23:11:53.715560728 +0530
@@ -723,7 +723,7 @@ sddr09_read_data(struct us_data *us,
 	len = min(sectors, (unsigned int) info->blocksize) * info->pagesize;
 	buffer = kmalloc(len, GFP_NOIO);
 	if (buffer = NULL) {
-		printk("sddr09_read_data: Out of memory\n");
+		printk(KERN_WARNING "sddr09_read_data: Out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -838,7 +838,7 @@ sddr09_write_lba(struct us_data *us, uns
 	if (pba = UNDEF) {
 		pba = sddr09_find_unused_pba(info, lba);
 		if (!pba) {
-			printk("sddr09_write_lba: Out of unused blocks\n");
+			printk(KERN_WARNING "sddr09_write_lba: Out of unused blocks\n");
 			return -ENOSPC;
 		}
 		info->pba_to_lba[pba] = lba;
@@ -849,7 +849,7 @@ sddr09_write_lba(struct us_data *us, uns
 	if (pba = 1) {
 		/* Maybe it is impossible to write to PBA 1.
 		   Fake success, but don't do anything. */
-		printk("sddr09: avoid writing to pba 1\n");
+		printk(KERN_NOTICE "sddr09: avoid writing to pba 1\n");
 		return 0;
 	}
 
@@ -954,7 +954,7 @@ sddr09_write_data(struct us_data *us,
 	blocklen = (pagelen << info->blockshift);
 	blockbuffer = kmalloc(blocklen, GFP_NOIO);
 	if (!blockbuffer) {
-		printk("sddr09_write_data: Out of memory\n");
+		printk(KERN_WARNING "sddr09_write_data: Out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -965,7 +965,7 @@ sddr09_write_data(struct us_data *us,
 	len = min(sectors, (unsigned int) info->blocksize) * info->pagesize;
 	buffer = kmalloc(len, GFP_NOIO);
 	if (buffer = NULL) {
-		printk("sddr09_write_data: Out of memory\n");
+		printk(KERN_WARNING "sddr09_write_data: Out of memory\n");
 		kfree(blockbuffer);
 		return -ENOMEM;
 	}
@@ -1112,7 +1112,7 @@ sddr09_get_cardinfo(struct us_data *us, 
 
 	if (result) {
 		US_DEBUGP("Result of read_deviceID is %d\n", result);
-		printk("sddr09: could not read card info\n");
+		printk(KERN_ERR "sddr09: could not read card info\n");
 		return NULL;
 	}
 
@@ -1153,7 +1153,7 @@ sddr09_get_cardinfo(struct us_data *us, 
 		sprintf(blurbtxt + strlen(blurbtxt),
 			", WP");
 
-	printk("%s\n", blurbtxt);
+	printk(KERN_INFO "%s\n", blurbtxt);
 
 	return cardinfo;
 }
@@ -1184,7 +1184,7 @@ sddr09_read_map(struct us_data *us) {
 	alloc_len = (alloc_blocks << CONTROL_SHIFT);
 	buffer = kmalloc(alloc_len, GFP_NOIO);
 	if (buffer = NULL) {
-		printk("sddr09_read_map: out of memory\n");
+		printk(KERN_WARNING "sddr09_read_map: out of memory\n");
 		result = -1;
 		goto done;
 	}
@@ -1198,7 +1198,7 @@ sddr09_read_map(struct us_data *us) {
 	info->pba_to_lba = kmalloc(numblocks*sizeof(int), GFP_NOIO);
 
 	if (info->lba_to_pba = NULL || info->pba_to_lba = NULL) {
-		printk("sddr09_read_map: out of memory\n");
+		printk(KERN_WARNING "sddr09_read_map: out of memory\n");
 		result = -1;
 		goto done;
 	}
@@ -1238,7 +1238,7 @@ sddr09_read_map(struct us_data *us) {
 			if (ptr[j] != 0)
 				goto nonz;
 		info->pba_to_lba[i] = UNUSABLE;
-		printk("sddr09: PBA %d has no logical mapping\n", i);
+		printk(KERN_WARNING "sddr09: PBA %d has no logical mapping\n", i);
 		continue;
 
 	nonz:
@@ -1251,7 +1251,7 @@ sddr09_read_map(struct us_data *us) {
 	nonff:
 		/* normal PBAs start with six FFs */
 		if (j < 6) {
-			printk("sddr09: PBA %d has no logical mapping: "
+			printk(KERN_WARNING "sddr09: PBA %d has no logical mapping: "
 			       "reserved area = %02X%02X%02X%02X "
 			       "data status %02X block status %02X\n",
 			       i, ptr[0], ptr[1], ptr[2], ptr[3],
@@ -1261,7 +1261,7 @@ sddr09_read_map(struct us_data *us) {
 		}
 
 		if ((ptr[6] >> 4) != 0x01) {
-			printk("sddr09: PBA %d has invalid address field "
+			printk(KERN_WARNING "sddr09: PBA %d has invalid address field "
 			       "%02X%02X/%02X%02X\n",
 			       i, ptr[6], ptr[7], ptr[11], ptr[12]);
 			info->pba_to_lba[i] = UNUSABLE;
@@ -1270,7 +1270,7 @@ sddr09_read_map(struct us_data *us) {
 
 		/* check even parity */
 		if (parity[ptr[6] ^ ptr[7]]) {
-			printk("sddr09: Bad parity in LBA for block %d"
+			printk(KERN_WARNING "sddr09: Bad parity in LBA for block %d"
 			       " (%02X %02X)\n", i, ptr[6], ptr[7]);
 			info->pba_to_lba[i] = UNUSABLE;
 			continue;
@@ -1289,7 +1289,7 @@ sddr09_read_map(struct us_data *us) {
 		 */
 
 		if (lba >= 1000) {
-			printk("sddr09: Bad low LBA %d for block %d\n",
+			printk(KERN_WARNING "sddr09: Bad low LBA %d for block %d\n",
 			       lba, i);
 			goto possibly_erase;
 		}
@@ -1297,7 +1297,7 @@ sddr09_read_map(struct us_data *us) {
 		lba += 1000*(i/0x400);
 
 		if (info->lba_to_pba[lba] != UNDEF) {
-			printk("sddr09: LBA %d seen for PBA %d and %d\n",
+			printk(KERN_WARNING "sddr09: LBA %d seen for PBA %d and %d\n",
 			       lba, info->lba_to_pba[lba], i);
 			goto possibly_erase;
 		}
diff -uprN -X /usr/src/linux-2.6.25.10/Documentation/dontdiff a/drivers/usb/storage/sddr55.c b/drivers/usb/storage/sddr55.c
--- a/drivers/usb/storage/sddr55.c	2008-07-03 09:16:47.000000000 +0530
+++ b/drivers/usb/storage/sddr55.c	2008-07-08 01:45:05.531192352 +0530
@@ -705,7 +705,7 @@ static int sddr55_read_map(struct us_dat
 		
 		if (info->lba_to_pba[lba + zone * 1000] != NOT_ALLOCATED &&
 		    !info->force_read_only) {
-			printk("sddr55: map inconsistency at LBA %04X\n", lba + zone * 1000);
+			printk(KERN_WARNING "sddr55: map inconsistency at LBA %04X\n", lba + zone * 1000);
 			info->force_read_only = 1;
 		}
 
