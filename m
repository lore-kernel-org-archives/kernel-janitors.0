From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 23 Feb 2006 22:13:23 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/partitions
Message-Id: <1140732803.12049.11.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58260430789732931=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58260430789732931==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/partitions to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/partitions/check.c.orig	2006-02-23 01:10:37.000000000 +0100
+++ linux-2.6.16-rc4/fs/partitions/check.c	2006-02-23 01:10:53.000000000 +0100
@@ -317,11 +317,10 @@ void add_partition(struct gendisk *disk,
 {
 	struct hd_struct *p;
 
-	p = kmalloc(sizeof(*p), GFP_KERNEL);
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (!p)
 		return;
 	
-	memset(p, 0, sizeof(*p));
 	p->start_sect = start;
 	p->nr_sects = len;
 	p->partno = part;
--- linux-2.6.16-rc4/fs/partitions/efi.c.orig	2006-02-23 01:11:01.000000000 +0100
+++ linux-2.6.16-rc4/fs/partitions/efi.c	2006-02-23 01:11:30.000000000 +0100
@@ -239,10 +239,9 @@ alloc_read_gpt_entries(struct block_devi
                 le32_to_cpu(gpt->sizeof_partition_entry);
 	if (!count)
 		return NULL;
-	pte = kmalloc(count, GFP_KERNEL);
+	pte = kzalloc(count, GFP_KERNEL);
 	if (!pte)
 		return NULL;
-	memset(pte, 0, count);
 
 	if (read_lba(bdev, le64_to_cpu(gpt->partition_entry_lba),
                      (u8 *) pte,
@@ -270,10 +269,9 @@ alloc_read_gpt_header(struct block_devic
 	if (!bdev)
 		return NULL;
 
-	gpt = kmalloc(sizeof (gpt_header), GFP_KERNEL);
+	gpt = kzalloc(sizeof (gpt_header), GFP_KERNEL);
 	if (!gpt)
 		return NULL;
-	memset(gpt, 0, sizeof (gpt_header));
 
 	if (read_lba(bdev, lba, (u8 *) gpt,
 		     sizeof (gpt_header)) < sizeof (gpt_header)) {
@@ -527,9 +525,8 @@ find_valid_gpt(struct block_device *bdev
 	lastlba = last_lba(bdev);
         if (!force_gpt) {
                 /* This will be added to the EFI Spec. per Intel after v1.02. */
-                legacymbr = kmalloc(sizeof (*legacymbr), GFP_KERNEL);
+                legacymbr = kzalloc(sizeof (*legacymbr), GFP_KERNEL);
                 if (legacymbr) {
-                        memset(legacymbr, 0, sizeof (*legacymbr));
                         read_lba(bdev, 0, (u8 *) legacymbr,
                                  sizeof (*legacymbr));
                         good_pmbr = is_pmbr_valid(legacymbr, lastlba);



--===============58260430789732931==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58260430789732931==--
