From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Dec 2015 18:13:55 +0000
Subject: [PATCH 5/5] block-LDM: Fine-tuning for the source code formatting
Message-Id: <567AE463.4080702@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567A6CDB.4030703@users.sourceforge.net>
 <alpine.DEB.2.10.1512231140090.4367@hadrien>
 <567AE1C6.9020108@users.sourceforge.net>
In-Reply-To: <567AE1C6.9020108@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ntfs-dev@lists.sourceforge.net, linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Richard Russon <ldm@flatcap.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Dec 2015 17:23:25 +0100

1. Remove some space characters and add a few according to the Linux coding
   style convention.

2. Reformat a bit of source code also for one switch statement.

3. Apply a few more recommendations from the script "checkpatch.pl".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 block/partitions/ldm.c | 405 ++++++++++++++++++++++++++-----------------------
 1 file changed, 213 insertions(+), 192 deletions(-)

diff --git a/block/partitions/ldm.c b/block/partitions/ldm.c
index 6fc9150..3ebe033 100644
--- a/block/partitions/ldm.c
+++ b/block/partitions/ldm.c
@@ -42,12 +42,12 @@
 #ifndef CONFIG_LDM_DEBUG
 #define ldm_debug(...)	do {} while (0)
 #else
-#define ldm_debug(f, a...) _ldm_printk (KERN_DEBUG, __func__, f, ##a)
+#define ldm_debug(f, a...) _ldm_printk(KERN_DEBUG, __func__, f, ##a)
 #endif
 
-#define ldm_crit(f, a...)  _ldm_printk (KERN_CRIT,  __func__, f, ##a)
-#define ldm_error(f, a...) _ldm_printk (KERN_ERR,   __func__, f, ##a)
-#define ldm_info(f, a...)  _ldm_printk (KERN_INFO,  __func__, f, ##a)
+#define ldm_crit(f, a...)  _ldm_printk(KERN_CRIT,  __func__, f, ##a)
+#define ldm_error(f, a...) _ldm_printk(KERN_ERR,   __func__, f, ##a)
+#define ldm_info(f, a...)  _ldm_printk(KERN_INFO,  __func__, f, ##a)
 
 static __printf(3, 4)
 void _ldm_printk(const char *level, const char *function, const char *fmt, ...)
@@ -55,7 +55,7 @@ void _ldm_printk(const char *level, const char *function, const char *fmt, ...)
 	struct va_format vaf;
 	va_list args;
 
-	va_start (args, fmt);
+	va_start(args, fmt);
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
@@ -74,7 +74,7 @@ void _ldm_printk(const char *level, const char *function, const char *fmt, ...)
  * Return:  0-255  Success, the byte was parsed correctly
  *          -1     Error, an invalid character was supplied
  */
-static int ldm_parse_hexbyte (const u8 *src)
+static int ldm_parse_hexbyte(const u8 *src)
 {
 	unsigned int x;		/* For correct wrapping */
 	int h;
@@ -102,7 +102,7 @@ static int ldm_parse_hexbyte (const u8 *src)
  * Return:  'true'   @dest contains binary GUID
  *          'false'  @dest contents are undefined
  */
-static bool ldm_parse_guid (const u8 *src, u8 *dest)
+static bool ldm_parse_guid(const u8 *src, u8 *dest)
 {
 	static const int size[] = { 4, 2, 2, 2, 6 };
 	int i, j, v;
@@ -112,10 +112,11 @@ static bool ldm_parse_guid (const u8 *src, u8 *dest)
 		return false;
 
 	for (j = 0; j < 5; j++, src++)
-		for (i = 0; i < size[j]; i++, src+=2, *dest++ = v)
-			if ((v = ldm_parse_hexbyte (src)) < 0)
+		for (i = 0; i < size[j]; i++, src += 2, *dest++ = v) {
+			v = ldm_parse_hexbyte(src);
+			if (v < 0)
 				return false;
-
+		}
 	return true;
 }
 
@@ -189,36 +190,36 @@ static bool ldm_parse_privhead(const u8 *data, struct privhead *ph)
  * Return:  'true'   @toc contains the TOCBLOCK data
  *          'false'  @toc contents are undefined
  */
-static bool ldm_parse_tocblock (const u8 *data, struct tocblock *toc)
+static bool ldm_parse_tocblock(const u8 *data, struct tocblock *toc)
 {
-	BUG_ON (!data || !toc);
+	BUG_ON(!data || !toc);
 
 	if (MAGIC_TOCBLOCK != get_unaligned_be64(data)) {
-		ldm_crit ("Cannot find TOCBLOCK, database may be corrupt.");
+		ldm_crit("Cannot find TOCBLOCK, database may be corrupt.");
 		return false;
 	}
-	strncpy (toc->bitmap1_name, data + 0x24, sizeof (toc->bitmap1_name));
+	strncpy(toc->bitmap1_name, data + 0x24, sizeof(toc->bitmap1_name));
 	toc->bitmap1_name[sizeof (toc->bitmap1_name) - 1] = 0;
 	toc->bitmap1_start = get_unaligned_be64(data + 0x2E);
 	toc->bitmap1_size  = get_unaligned_be64(data + 0x36);
 
-	if (strncmp (toc->bitmap1_name, TOC_BITMAP1,
-			sizeof (toc->bitmap1_name)) != 0) {
-		ldm_crit ("TOCBLOCK's first bitmap is '%s', should be '%s'.",
+	if (strncmp(toc->bitmap1_name, TOC_BITMAP1,
+			sizeof(toc->bitmap1_name)) != 0) {
+		ldm_crit("TOCBLOCK's first bitmap is '%s', should be '%s'.",
 				TOC_BITMAP1, toc->bitmap1_name);
 		return false;
 	}
-	strncpy (toc->bitmap2_name, data + 0x46, sizeof (toc->bitmap2_name));
-	toc->bitmap2_name[sizeof (toc->bitmap2_name) - 1] = 0;
+	strncpy(toc->bitmap2_name, data + 0x46, sizeof(toc->bitmap2_name));
+	toc->bitmap2_name[sizeof(toc->bitmap2_name) - 1] = 0;
 	toc->bitmap2_start = get_unaligned_be64(data + 0x50);
 	toc->bitmap2_size  = get_unaligned_be64(data + 0x58);
-	if (strncmp (toc->bitmap2_name, TOC_BITMAP2,
-			sizeof (toc->bitmap2_name)) != 0) {
-		ldm_crit ("TOCBLOCK's second bitmap is '%s', should be '%s'.",
+	if (strncmp(toc->bitmap2_name, TOC_BITMAP2,
+			sizeof(toc->bitmap2_name)) != 0) {
+		ldm_crit("TOCBLOCK's second bitmap is '%s', should be '%s'.",
 				TOC_BITMAP2, toc->bitmap2_name);
 		return false;
 	}
-	ldm_debug ("Parsed TOCBLOCK successfully.");
+	ldm_debug("Parsed TOCBLOCK successfully.");
 	return true;
 }
 
@@ -235,33 +236,33 @@ static bool ldm_parse_tocblock (const u8 *data, struct tocblock *toc)
  * Return:  'true'   @vm contains VMDB info
  *          'false'  @vm contents are undefined
  */
-static bool ldm_parse_vmdb (const u8 *data, struct vmdb *vm)
+static bool ldm_parse_vmdb(const u8 *data, struct vmdb *vm)
 {
-	BUG_ON (!data || !vm);
+	BUG_ON(!data || !vm);
 
 	if (MAGIC_VMDB != get_unaligned_be32(data)) {
-		ldm_crit ("Cannot find the VMDB, database may be corrupt.");
+		ldm_crit("Cannot find the VMDB, database may be corrupt.");
 		return false;
 	}
 
 	vm->ver_major = get_unaligned_be16(data + 0x12);
 	vm->ver_minor = get_unaligned_be16(data + 0x14);
 	if ((vm->ver_major != 4) || (vm->ver_minor != 10)) {
-		ldm_error ("Expected VMDB version %d.%d, got %d.%d. "
+		ldm_error("Expected VMDB version %d.%d, got %d.%d. "
 			"Aborting.", 4, 10, vm->ver_major, vm->ver_minor);
 		return false;
 	}
 
 	vm->vblk_size     = get_unaligned_be32(data + 0x08);
 	if (vm->vblk_size = 0) {
-		ldm_error ("Illegal VBLK size");
+		ldm_error("Illegal VBLK size");
 		return false;
 	}
 
 	vm->vblk_offset   = get_unaligned_be32(data + 0x0C);
 	vm->last_vblk_seq = get_unaligned_be32(data + 0x04);
 
-	ldm_debug ("Parsed VMDB successfully.");
+	ldm_debug("Parsed VMDB successfully.");
 	return true;
 }
 
@@ -275,10 +276,10 @@ static bool ldm_parse_vmdb (const u8 *data, struct vmdb *vm)
  * Return:  'true'   Identical
  *          'false'  Different
  */
-static bool ldm_compare_privheads (const struct privhead *ph1,
+static bool ldm_compare_privheads(const struct privhead *ph1,
 				   const struct privhead *ph2)
 {
-	BUG_ON (!ph1 || !ph2);
+	BUG_ON(!ph1 || !ph2);
 
 	return ((ph1->ver_major          = ph2->ver_major)		&&
 		(ph1->ver_minor          = ph2->ver_minor)		&&
@@ -286,7 +287,7 @@ static bool ldm_compare_privheads (const struct privhead *ph1,
 		(ph1->logical_disk_size  = ph2->logical_disk_size)	&&
 		(ph1->config_start       = ph2->config_start)		&&
 		(ph1->config_size        = ph2->config_size)		&&
-		!memcmp (ph1->disk_id, ph2->disk_id, GUID_SIZE));
+		!memcmp(ph1->disk_id, ph2->disk_id, GUID_SIZE));
 }
 
 /**
@@ -299,19 +300,19 @@ static bool ldm_compare_privheads (const struct privhead *ph1,
  * Return:  'true'   Identical
  *          'false'  Different
  */
-static bool ldm_compare_tocblocks (const struct tocblock *toc1,
+static bool ldm_compare_tocblocks(const struct tocblock *toc1,
 				   const struct tocblock *toc2)
 {
-	BUG_ON (!toc1 || !toc2);
+	BUG_ON(!toc1 || !toc2);
 
 	return ((toc1->bitmap1_start = toc2->bitmap1_start)	&&
 		(toc1->bitmap1_size  = toc2->bitmap1_size)	&&
 		(toc1->bitmap2_start = toc2->bitmap2_start)	&&
 		(toc1->bitmap2_size  = toc2->bitmap2_size)	&&
-		!strncmp (toc1->bitmap1_name, toc2->bitmap1_name,
-			sizeof (toc1->bitmap1_name))		&&
-		!strncmp (toc1->bitmap2_name, toc2->bitmap2_name,
-			sizeof (toc1->bitmap2_name)));
+		!strncmp(toc1->bitmap1_name, toc2->bitmap1_name,
+			sizeof(toc1->bitmap1_name))		&&
+		!strncmp(toc1->bitmap2_name, toc2->bitmap2_name,
+			sizeof(toc1->bitmap2_name)));
 }
 
 /**
@@ -339,12 +340,12 @@ static bool ldm_validate_privheads(struct parsed_partitions *state,
 	long num_sects;
 	int i;
 
-	BUG_ON (!state || !ph1);
+	BUG_ON(!state || !ph1);
 
-	ph[1] = kmalloc (sizeof (*ph[1]), GFP_KERNEL);
+	ph[1] = kmalloc(sizeof(*ph[1]), GFP_KERNEL);
 	if (!ph[1])
 		return false;
-	ph[2] = kmalloc (sizeof (*ph[2]), GFP_KERNEL);
+	ph[2] = kmalloc(sizeof(*ph[2]), GFP_KERNEL);
 	if (!ph[2]) {
 		result = false;
 		goto free_a_head;
@@ -358,18 +359,23 @@ static bool ldm_validate_privheads(struct parsed_partitions *state,
 		data = read_part_sector(state, ph[0]->config_start + off[i],
 					&sect);
 		if (!data) {
-			ldm_crit ("Disk read failed.");
+			ldm_crit("Disk read failed.");
 			result = false;
 			goto free_another_head;
 		}
-		result = ldm_parse_privhead (data, ph[i]);
+		result = ldm_parse_privhead(data, ph[i]);
 		put_dev_sector (sect);
 		if (!result) {
-			ldm_error ("Cannot find PRIVHEAD %d.", i+1); /* Log again */
+			/* Log again */
+			ldm_error("Cannot find PRIVHEAD %d.", i + 1);
 			if (i < 2)
 				goto free_another_head;	/* Already logged */
 			else
-				break;	/* FIXME ignore for now, 3rd PH can fail on odd-sized disks */
+				/*
+				 * FIXME: ignore for now,
+				 *        3rd PH can fail on odd-sized disks
+				 */
+				break;
 		}
 	}
 
@@ -377,19 +383,19 @@ static bool ldm_validate_privheads(struct parsed_partitions *state,
 
 	if ((ph[0]->config_start > num_sects) ||
 	   ((ph[0]->config_start + ph[0]->config_size) > num_sects)) {
-		ldm_crit ("Database extends beyond the end of the disk.");
+		ldm_crit("Database extends beyond the end of the disk.");
 		goto free_another_head;
 	}
 
 	if ((ph[0]->logical_disk_start > ph[0]->config_start) ||
 	   ((ph[0]->logical_disk_start + ph[0]->logical_disk_size)
 		    > ph[0]->config_start)) {
-		ldm_crit ("Disk and database overlap.");
+		ldm_crit("Disk and database overlap.");
 		goto free_another_head;
 	}
 
-	if (!ldm_compare_privheads (ph[0], ph[1])) {
-		ldm_crit ("Primary and backup PRIVHEADs don't match.");
+	if (!ldm_compare_privheads(ph[0], ph[1])) {
+		ldm_crit("Primary and backup PRIVHEADs don't match.");
 		goto free_another_head;
 	}
 	/* FIXME ignore this for now
@@ -397,7 +403,7 @@ static bool ldm_validate_privheads(struct parsed_partitions *state,
 		ldm_crit ("Primary and backup PRIVHEADs don't match.");
 		goto free_another_head;
 	}*/
-	ldm_debug ("Validated PRIVHEADs successfully.");
+	ldm_debug("Validated PRIVHEADs successfully.");
 	result = true;
 free_another_head:
 	kfree(ph[2]);
@@ -501,42 +507,42 @@ static bool ldm_validate_vmdb(struct parsed_partitions *state,
 	struct vmdb *vm;
 	struct tocblock *toc;
 
-	BUG_ON (!state || !ldb);
+	BUG_ON(!state || !ldb);
 
 	vm  = &ldb->vm;
 	toc = &ldb->toc;
 
 	data = read_part_sector(state, base + OFF_VMDB, &sect);
 	if (!data) {
-		ldm_crit ("Disk read failed.");
+		ldm_crit("Disk read failed.");
 		return false;
 	}
 
-	if (!ldm_parse_vmdb (data, vm))
+	if (!ldm_parse_vmdb(data, vm))
 		goto out;				/* Already logged */
 
 	/* Are there uncommitted transactions? */
 	if (get_unaligned_be16(data + 0x10) != 0x01) {
-		ldm_crit ("Database is not in a consistent state.  Aborting.");
+		ldm_crit("Database is not in a consistent state.  Aborting.");
 		goto out;
 	}
 
 	if (vm->vblk_offset != 512)
-		ldm_info ("VBLKs start at offset 0x%04x.", vm->vblk_offset);
+		ldm_info("VBLKs start at offset 0x%04x.", vm->vblk_offset);
 
 	/*
 	 * The last_vblkd_seq can be before the end of the vmdb, just make sure
 	 * it is not out of bounds.
 	 */
 	if ((vm->vblk_size * vm->last_vblk_seq) > (toc->bitmap1_size << 9)) {
-		ldm_crit ("VMDB exceeds allowed size specified by TOCBLOCK.  "
+		ldm_crit("VMDB exceeds allowed size specified by TOCBLOCK.  "
 				"Database is corrupt.  Aborting.");
 		goto out;
 	}
 
 	result = true;
 out:
-	put_dev_sector (sect);
+	put_dev_sector(sect);
 	return result;
 }
 
@@ -569,11 +575,11 @@ static bool ldm_validate_partition_table(struct parsed_partitions *state)
 
 	data = read_part_sector(state, 0, &sect);
 	if (!data) {
-		ldm_info ("Disk read failed.");
+		ldm_info("Disk read failed.");
 		return false;
 	}
 
-	if (*(__le16*) (data + 0x01FE) != cpu_to_le16 (MSDOS_LABEL_MAGIC))
+	if (*(__le16 *) (data + 0x01FE) != cpu_to_le16(MSDOS_LABEL_MAGIC))
 		goto out;
 
 	p = (struct partition*)(data + 0x01BE);
@@ -584,10 +590,10 @@ static bool ldm_validate_partition_table(struct parsed_partitions *state)
 		}
 
 	if (result)
-		ldm_debug ("Found W2K dynamic disk partition type.");
+		ldm_debug("Found W2K dynamic disk partition type.");
 
 out:
-	put_dev_sector (sect);
+	put_dev_sector(sect);
 	return result;
 }
 
@@ -603,15 +609,16 @@ out:
  * Return:  Pointer, A matching vblk was found
  *          NULL,    No match, or an error
  */
-static struct vblk * ldm_get_disk_objid (const struct ldmdb *ldb)
+static struct vblk *ldm_get_disk_objid(const struct ldmdb *ldb)
 {
 	struct list_head *item;
 
-	BUG_ON (!ldb);
+	BUG_ON(!ldb);
 
-	list_for_each (item, &ldb->v_disk) {
-		struct vblk *v = list_entry (item, struct vblk, list);
-		if (!memcmp (v->vblk.disk.disk_id, ldb->ph.disk_id, GUID_SIZE))
+	list_for_each(item, &ldb->v_disk) {
+		struct vblk *v = list_entry(item, struct vblk, list);
+
+		if (!memcmp(v->vblk.disk.disk_id, ldb->ph.disk_id, GUID_SIZE))
 			return v;
 	}
 
@@ -635,7 +642,7 @@ static struct vblk * ldm_get_disk_objid (const struct ldmdb *ldb)
  * Return:  'true'   Partition created
  *          'false'  Error, probably a range checking problem
  */
-static bool ldm_create_data_partitions (struct parsed_partitions *pp,
+static bool ldm_create_data_partitions(struct parsed_partitions *pp,
 					const struct ldmdb *ldb)
 {
 	struct list_head *item;
@@ -644,25 +651,25 @@ static bool ldm_create_data_partitions (struct parsed_partitions *pp,
 	struct vblk_part *part;
 	int part_num = 1;
 
-	BUG_ON (!pp || !ldb);
+	BUG_ON(!pp || !ldb);
 
-	disk = ldm_get_disk_objid (ldb);
+	disk = ldm_get_disk_objid(ldb);
 	if (!disk) {
-		ldm_crit ("Can't find the ID of this disk in the database.");
+		ldm_crit("Can't find the ID of this disk in the database.");
 		return false;
 	}
 
 	strlcat(pp->pp_buf, " [LDM]", PAGE_SIZE);
 
 	/* Create the data partitions */
-	list_for_each (item, &ldb->v_part) {
-		vb = list_entry (item, struct vblk, list);
+	list_for_each(item, &ldb->v_part) {
+		vb = list_entry(item, struct vblk, list);
 		part = &vb->vblk.part;
 
 		if (part->disk_id != disk->obj_id)
 			continue;
 
-		put_partition (pp, part_num, ldb->ph.logical_disk_start +
+		put_partition(pp, part_num, ldb->ph.logical_disk_start +
 				part->start, part->size);
 		part_num++;
 	}
@@ -722,12 +729,12 @@ static int ldm_relative(const u8 *buffer, int buflen, int base, int offset)
  * Return:  n A number
  *          0 Zero, or an error occurred
  */
-static u64 ldm_get_vnum (const u8 *block)
+static u64 ldm_get_vnum(const u8 *block)
 {
 	u64 tmp = 0;
 	u8 length;
 
-	BUG_ON (!block);
+	BUG_ON(!block);
 
 	length = *block++;
 
@@ -735,7 +742,7 @@ static u64 ldm_get_vnum (const u8 *block)
 		while (length--)
 			tmp = (tmp << 8) | *block++;
 	else
-		ldm_error ("Illegal length %d.", length);
+		ldm_error("Illegal length %d.", length);
 
 	return tmp;
 }
@@ -757,18 +764,18 @@ static u64 ldm_get_vnum (const u8 *block)
  *          n, String length in characters (excluding NULL)
  *          buflen-1, String was truncated.
  */
-static int ldm_get_vstr (const u8 *block, u8 *buffer, int buflen)
+static int ldm_get_vstr(const u8 *block, u8 *buffer, int buflen)
 {
 	int length;
 
-	BUG_ON (!block || !buffer);
+	BUG_ON(!block || !buffer);
 
 	length = block[0];
 	if (length >= buflen) {
-		ldm_error ("Truncating string %d -> %d.", length, buflen);
+		ldm_error("Truncating string %d -> %d.", length, buflen);
 		length = buflen - 1;
 	}
-	memcpy (buffer, block + 1, length);
+	memcpy(buffer, block + 1, length);
 	buffer[length] = 0;
 	return length;
 }
@@ -785,22 +792,22 @@ static int ldm_get_vstr (const u8 *block, u8 *buffer, int buflen)
  * Return:  'true'   @vb contains a Component VBLK
  *          'false'  @vb contents are not defined
  */
-static bool ldm_parse_cmp3 (const u8 *buffer, int buflen, struct vblk *vb)
+static bool ldm_parse_cmp3(const u8 *buffer, int buflen, struct vblk *vb)
 {
 	int r_objid, r_name, r_vstate, r_child, r_parent, r_stripe, r_cols, len;
 	struct vblk_comp *comp;
 
-	BUG_ON (!buffer || !vb);
+	BUG_ON(!buffer || !vb);
 
-	r_objid  = ldm_relative (buffer, buflen, 0x18, 0);
-	r_name   = ldm_relative (buffer, buflen, 0x18, r_objid);
-	r_vstate = ldm_relative (buffer, buflen, 0x18, r_name);
-	r_child  = ldm_relative (buffer, buflen, 0x1D, r_vstate);
-	r_parent = ldm_relative (buffer, buflen, 0x2D, r_child);
+	r_objid  = ldm_relative(buffer, buflen, 0x18, 0);
+	r_name   = ldm_relative(buffer, buflen, 0x18, r_objid);
+	r_vstate = ldm_relative(buffer, buflen, 0x18, r_name);
+	r_child  = ldm_relative(buffer, buflen, 0x1D, r_vstate);
+	r_parent = ldm_relative(buffer, buflen, 0x2D, r_child);
 
 	if (buffer[0x12] & VBLK_FLAG_COMP_STRIPE) {
-		r_stripe = ldm_relative (buffer, buflen, 0x2E, r_parent);
-		r_cols   = ldm_relative (buffer, buflen, 0x2E, r_stripe);
+		r_stripe = ldm_relative(buffer, buflen, 0x2E, r_parent);
+		r_cols   = ldm_relative(buffer, buflen, 0x2E, r_stripe);
 		len = r_cols;
 	} else {
 		r_stripe = 0;
@@ -815,12 +822,12 @@ static bool ldm_parse_cmp3 (const u8 *buffer, int buflen, struct vblk *vb)
 		return false;
 
 	comp = &vb->vblk.comp;
-	ldm_get_vstr (buffer + 0x18 + r_name, comp->state,
-		sizeof (comp->state));
+	ldm_get_vstr(buffer + 0x18 + r_name, comp->state,
+		sizeof(comp->state));
 	comp->type      = buffer[0x18 + r_vstate];
-	comp->children  = ldm_get_vnum (buffer + 0x1D + r_vstate);
-	comp->parent_id = ldm_get_vnum (buffer + 0x2D + r_child);
-	comp->chunksize = r_stripe ? ldm_get_vnum (buffer+r_parent+0x2E) : 0;
+	comp->children  = ldm_get_vnum(buffer + 0x1D + r_vstate);
+	comp->parent_id = ldm_get_vnum(buffer + 0x2D + r_child);
+	comp->chunksize = r_stripe ? ldm_get_vnum(buffer + r_parent + 0x2E) : 0;
 
 	return true;
 }
@@ -836,20 +843,20 @@ static bool ldm_parse_cmp3 (const u8 *buffer, int buflen, struct vblk *vb)
  * Return:  'true'   @vb contains a Disk Group VBLK
  *          'false'  @vb contents are not defined
  */
-static int ldm_parse_dgr3 (const u8 *buffer, int buflen, struct vblk *vb)
+static int ldm_parse_dgr3(const u8 *buffer, int buflen, struct vblk *vb)
 {
 	int r_objid, r_name, r_diskid, r_id1, r_id2, len;
 	struct vblk_dgrp *dgrp;
 
-	BUG_ON (!buffer || !vb);
+	BUG_ON(!buffer || !vb);
 
-	r_objid  = ldm_relative (buffer, buflen, 0x18, 0);
-	r_name   = ldm_relative (buffer, buflen, 0x18, r_objid);
-	r_diskid = ldm_relative (buffer, buflen, 0x18, r_name);
+	r_objid  = ldm_relative(buffer, buflen, 0x18, 0);
+	r_name   = ldm_relative(buffer, buflen, 0x18, r_objid);
+	r_diskid = ldm_relative(buffer, buflen, 0x18, r_name);
 
 	if (buffer[0x12] & VBLK_FLAG_DGR3_IDS) {
-		r_id1 = ldm_relative (buffer, buflen, 0x24, r_diskid);
-		r_id2 = ldm_relative (buffer, buflen, 0x24, r_id1);
+		r_id1 = ldm_relative(buffer, buflen, 0x24, r_diskid);
+		r_id2 = ldm_relative(buffer, buflen, 0x24, r_id1);
 		len = r_id2;
 	} else {
 		r_id1 = 0;
@@ -864,8 +871,8 @@ static int ldm_parse_dgr3 (const u8 *buffer, int buflen, struct vblk *vb)
 		return false;
 
 	dgrp = &vb->vblk.dgrp;
-	ldm_get_vstr (buffer + 0x18 + r_name, dgrp->disk_id,
-		sizeof (dgrp->disk_id));
+	ldm_get_vstr(buffer + 0x18 + r_name, dgrp->disk_id,
+		sizeof(dgrp->disk_id));
 	return true;
 }
 
@@ -886,14 +893,14 @@ static bool ldm_parse_dgr4 (const u8 *buffer, int buflen, struct vblk *vb)
 	int r_objid, r_name, r_id1, r_id2, len;
 	struct vblk_dgrp *dgrp;
 
-	BUG_ON (!buffer || !vb);
+	BUG_ON(!buffer || !vb);
 
-	r_objid  = ldm_relative (buffer, buflen, 0x18, 0);
-	r_name   = ldm_relative (buffer, buflen, 0x18, r_objid);
+	r_objid = ldm_relative(buffer, buflen, 0x18, 0);
+	r_name  = ldm_relative(buffer, buflen, 0x18, r_objid);
 
 	if (buffer[0x12] & VBLK_FLAG_DGR4_IDS) {
-		r_id1 = ldm_relative (buffer, buflen, 0x44, r_name);
-		r_id2 = ldm_relative (buffer, buflen, 0x44, r_id1);
+		r_id1 = ldm_relative(buffer, buflen, 0x44, r_name);
+		r_id2 = ldm_relative(buffer, buflen, 0x44, r_id1);
 		len = r_id2;
 	} else {
 		r_id1 = 0;
@@ -909,7 +916,7 @@ static bool ldm_parse_dgr4 (const u8 *buffer, int buflen, struct vblk *vb)
 
 	dgrp = &vb->vblk.dgrp;
 
-	ldm_get_vstr (buffer + 0x18 + r_objid, buf, sizeof (buf));
+	ldm_get_vstr(buffer + 0x18 + r_objid, buf, sizeof(buf));
 	return true;
 }
 
@@ -924,17 +931,17 @@ static bool ldm_parse_dgr4 (const u8 *buffer, int buflen, struct vblk *vb)
  * Return:  'true'   @vb contains a Disk VBLK
  *          'false'  @vb contents are not defined
  */
-static bool ldm_parse_dsk3 (const u8 *buffer, int buflen, struct vblk *vb)
+static bool ldm_parse_dsk3(const u8 *buffer, int buflen, struct vblk *vb)
 {
 	int r_objid, r_name, r_diskid, r_altname, len;
 	struct vblk_disk *disk;
 
-	BUG_ON (!buffer || !vb);
+	BUG_ON(!buffer || !vb);
 
-	r_objid   = ldm_relative (buffer, buflen, 0x18, 0);
-	r_name    = ldm_relative (buffer, buflen, 0x18, r_objid);
-	r_diskid  = ldm_relative (buffer, buflen, 0x18, r_name);
-	r_altname = ldm_relative (buffer, buflen, 0x18, r_diskid);
+	r_objid   = ldm_relative(buffer, buflen, 0x18, 0);
+	r_name    = ldm_relative(buffer, buflen, 0x18, r_objid);
+	r_diskid  = ldm_relative(buffer, buflen, 0x18, r_name);
+	r_altname = ldm_relative(buffer, buflen, 0x18, r_diskid);
 	len = r_altname;
 	if (len < 0)
 		return false;
@@ -944,9 +951,9 @@ static bool ldm_parse_dsk3 (const u8 *buffer, int buflen, struct vblk *vb)
 		return false;
 
 	disk = &vb->vblk.disk;
-	ldm_get_vstr (buffer + 0x18 + r_diskid, disk->alt_name,
-		sizeof (disk->alt_name));
-	if (!ldm_parse_guid (buffer + 0x19 + r_name, disk->disk_id))
+	ldm_get_vstr(buffer + 0x18 + r_diskid, disk->alt_name,
+		sizeof(disk->alt_name));
+	if (!ldm_parse_guid(buffer + 0x19 + r_name, disk->disk_id))
 		return false;
 
 	return true;
@@ -963,15 +970,15 @@ static bool ldm_parse_dsk3 (const u8 *buffer, int buflen, struct vblk *vb)
  * Return:  'true'   @vb contains a Disk VBLK
  *          'false'  @vb contents are not defined
  */
-static bool ldm_parse_dsk4 (const u8 *buffer, int buflen, struct vblk *vb)
+static bool ldm_parse_dsk4(const u8 *buffer, int buflen, struct vblk *vb)
 {
 	int r_objid, r_name, len;
 	struct vblk_disk *disk;
 
-	BUG_ON (!buffer || !vb);
+	BUG_ON(!buffer || !vb);
 
-	r_objid = ldm_relative (buffer, buflen, 0x18, 0);
-	r_name  = ldm_relative (buffer, buflen, 0x18, r_objid);
+	r_objid = ldm_relative(buffer, buflen, 0x18, 0);
+	r_name  = ldm_relative(buffer, buflen, 0x18, r_objid);
 	len     = r_name;
 	if (len < 0)
 		return false;
@@ -981,7 +988,7 @@ static bool ldm_parse_dsk4 (const u8 *buffer, int buflen, struct vblk *vb)
 		return false;
 
 	disk = &vb->vblk.disk;
-	memcpy (disk->disk_id, buffer + 0x18 + r_name, GUID_SIZE);
+	memcpy(disk->disk_id, buffer + 0x18 + r_name, GUID_SIZE);
 	return true;
 }
 
@@ -1181,39 +1188,53 @@ static bool ldm_parse_vol5(const u8 *buffer, int buflen, struct vblk *vb)
  * Return:  'true'   @vb contains a VBLK
  *          'false'  @vb contents are not defined
  */
-static bool ldm_parse_vblk (const u8 *buf, int len, struct vblk *vb)
+static bool ldm_parse_vblk(const u8 *buf, int len, struct vblk *vb)
 {
 	bool result = false;
 	int r_objid;
 
-	BUG_ON (!buf || !vb);
+	BUG_ON(!buf || !vb);
 
-	r_objid = ldm_relative (buf, len, 0x18, 0);
+	r_objid = ldm_relative(buf, len, 0x18, 0);
 	if (r_objid < 0) {
-		ldm_error ("VBLK header is corrupt.");
+		ldm_error("VBLK header is corrupt.");
 		return false;
 	}
 
 	vb->flags  = buf[0x12];
 	vb->type   = buf[0x13];
-	vb->obj_id = ldm_get_vnum (buf + 0x18);
-	ldm_get_vstr (buf+0x18+r_objid, vb->name, sizeof (vb->name));
+	vb->obj_id = ldm_get_vnum(buf + 0x18);
+	ldm_get_vstr(buf + 0x18 + r_objid, vb->name, sizeof(vb->name));
 
 	switch (vb->type) {
-		case VBLK_CMP3:  result = ldm_parse_cmp3 (buf, len, vb); break;
-		case VBLK_DSK3:  result = ldm_parse_dsk3 (buf, len, vb); break;
-		case VBLK_DSK4:  result = ldm_parse_dsk4 (buf, len, vb); break;
-		case VBLK_DGR3:  result = ldm_parse_dgr3 (buf, len, vb); break;
-		case VBLK_DGR4:  result = ldm_parse_dgr4 (buf, len, vb); break;
-		case VBLK_PRT3:  result = ldm_parse_prt3 (buf, len, vb); break;
-		case VBLK_VOL5:  result = ldm_parse_vol5 (buf, len, vb); break;
+	case VBLK_CMP3:
+		result = ldm_parse_cmp3(buf, len, vb);
+		break;
+	case VBLK_DSK3:
+		result = ldm_parse_dsk3(buf, len, vb);
+		break;
+	case VBLK_DSK4:
+		result = ldm_parse_dsk4(buf, len, vb);
+		break;
+	case VBLK_DGR3:
+		result = ldm_parse_dgr3(buf, len, vb);
+		break;
+	case VBLK_DGR4:
+		result = ldm_parse_dgr4(buf, len, vb);
+		break;
+	case VBLK_PRT3:
+		result = ldm_parse_prt3(buf, len, vb);
+		break;
+	case VBLK_VOL5:
+		result = ldm_parse_vol5(buf, len, vb);
+		break;
 	}
 
 	if (result)
-		ldm_debug ("Parsed VBLK 0x%llx (type: 0x%02x) ok.",
+		ldm_debug("Parsed VBLK 0x%llx (type: 0x%02x) ok.",
 			 (unsigned long long) vb->obj_id, vb->type);
 	else
-		ldm_error ("Failed to parse VBLK 0x%llx (type: 0x%02x).",
+		ldm_error("Failed to parse VBLK 0x%llx (type: 0x%02x).",
 			(unsigned long long) vb->obj_id, vb->type);
 
 	return result;
@@ -1238,13 +1259,13 @@ static bool ldm_ldmdb_add (u8 *data, int len, struct ldmdb *ldb)
 	struct vblk *vb;
 	struct list_head *item;
 
-	BUG_ON (!data || !ldb);
+	BUG_ON(!data || !ldb);
 
-	vb = kmalloc (sizeof (*vb), GFP_KERNEL);
+	vb = kmalloc(sizeof(*vb), GFP_KERNEL);
 	if (!vb)
 		return false;
 
-	if (!ldm_parse_vblk (data, len, vb)) {
+	if (!ldm_parse_vblk(data, len, vb)) {
 		kfree(vb);
 		return false;			/* Already logged */
 	}
@@ -1253,29 +1274,29 @@ static bool ldm_ldmdb_add (u8 *data, int len, struct ldmdb *ldb)
 	switch (vb->type) {
 	case VBLK_DGR3:
 	case VBLK_DGR4:
-		list_add (&vb->list, &ldb->v_dgrp);
+		list_add(&vb->list, &ldb->v_dgrp);
 		break;
 	case VBLK_DSK3:
 	case VBLK_DSK4:
-		list_add (&vb->list, &ldb->v_disk);
+		list_add(&vb->list, &ldb->v_disk);
 		break;
 	case VBLK_VOL5:
-		list_add (&vb->list, &ldb->v_volu);
+		list_add(&vb->list, &ldb->v_volu);
 		break;
 	case VBLK_CMP3:
-		list_add (&vb->list, &ldb->v_comp);
+		list_add(&vb->list, &ldb->v_comp);
 		break;
 	case VBLK_PRT3:
 		/* Sort by the partition's start sector. */
-		list_for_each (item, &ldb->v_part) {
-			struct vblk *v = list_entry (item, struct vblk, list);
+		list_for_each(item, &ldb->v_part) {
+			struct vblk *v = list_entry(item, struct vblk, list);
 			if ((v->vblk.part.disk_id = vb->vblk.part.disk_id) &&
 			    (v->vblk.part.start > vb->vblk.part.start)) {
-				list_add_tail (&vb->list, &v->list);
+				list_add_tail(&vb->list, &v->list);
 				return true;
 			}
 		}
-		list_add_tail (&vb->list, &ldb->v_part);
+		list_add_tail(&vb->list, &ldb->v_part);
 		break;
 	}
 	return true;
@@ -1293,13 +1314,13 @@ static bool ldm_ldmdb_add (u8 *data, int len, struct ldmdb *ldb)
  * Return:  'true'   Success, the VBLK was added to the list
  *          'false'  Error, a problem occurred
  */
-static bool ldm_frag_add (const u8 *data, int size, struct list_head *frags)
+static bool ldm_frag_add(const u8 *data, int size, struct list_head *frags)
 {
 	struct frag *f;
 	struct list_head *item;
 	int rec, num, group;
 
-	BUG_ON (!data || !frags);
+	BUG_ON(!data || !frags);
 
 	if (size < 2 * VBLK_SIZE_HEAD) {
 		ldm_error("Value of size is to small.");
@@ -1310,7 +1331,7 @@ static bool ldm_frag_add (const u8 *data, int size, struct list_head *frags)
 	rec   = get_unaligned_be16(data + 0x0C);
 	num   = get_unaligned_be16(data + 0x0E);
 	if ((num < 1) || (num > 4)) {
-		ldm_error ("A VBLK claims to have %d parts.", num);
+		ldm_error("A VBLK claims to have %d parts.", num);
 		return false;
 	}
 	if (rec >= num) {
@@ -1318,13 +1339,13 @@ static bool ldm_frag_add (const u8 *data, int size, struct list_head *frags)
 		return false;
 	}
 
-	list_for_each (item, frags) {
-		f = list_entry (item, struct frag, list);
+	list_for_each(item, frags) {
+		f = list_entry(item, struct frag, list);
 		if (f->group = group)
 			goto found;
 	}
 
-	f = kmalloc (sizeof (*f) + size*num, GFP_KERNEL);
+	f = kmalloc(sizeof(*f) + size*num, GFP_KERNEL);
 	if (!f)
 		return false;
 
@@ -1340,7 +1361,7 @@ found:
 		return false;
 	}
 	if (f->map & (1 << rec)) {
-		ldm_error ("Duplicate VBLK, part %d.", rec);
+		ldm_error("Duplicate VBLK, part %d.", rec);
 		f->map &= 0x7F;			/* Mark the group as broken */
 		return false;
 	}
@@ -1361,14 +1382,14 @@ found:
  *
  * Return:  none
  */
-static void ldm_frag_free (struct list_head *list)
+static void ldm_frag_free(struct list_head *list)
 {
 	struct list_head *item, *tmp;
 
-	BUG_ON (!list);
+	BUG_ON(!list);
 
-	list_for_each_safe (item, tmp, list)
-		kfree (list_entry (item, struct frag, list));
+	list_for_each_safe(item, tmp, list)
+		kfree(list_entry(item, struct frag, list));
 }
 
 /**
@@ -1382,23 +1403,23 @@ static void ldm_frag_free (struct list_head *list)
  * Return:  'true'   All the fragments we added successfully
  *          'false'  One or more of the fragments we invalid
  */
-static bool ldm_frag_commit (struct list_head *frags, struct ldmdb *ldb)
+static bool ldm_frag_commit(struct list_head *frags, struct ldmdb *ldb)
 {
 	struct frag *f;
 	struct list_head *item;
 
-	BUG_ON (!frags || !ldb);
+	BUG_ON(!frags || !ldb);
 
-	list_for_each (item, frags) {
-		f = list_entry (item, struct frag, list);
+	list_for_each(item, frags) {
+		f = list_entry(item, struct frag, list);
 
 		if (f->map != 0xFF) {
-			ldm_error ("VBLK group %d is incomplete (0x%02x).",
+			ldm_error("VBLK group %d is incomplete (0x%02x).",
 				f->group, f->map);
 			return false;
 		}
 
-		if (!ldm_ldmdb_add (f->data, f->num*ldb->vm.vblk_size, ldb))
+		if (!ldm_ldmdb_add(f->data, f->num*ldb->vm.vblk_size, ldb))
 			return false;		/* Already logged */
 	}
 	return true;
@@ -1435,35 +1456,35 @@ static bool ldm_get_vblks(struct parsed_partitions *state, unsigned long base,
 	for (s = skip; s < finish; s++) {		/* For each sector */
 		data = read_part_sector(state, base + OFF_VMDB + s, &sect);
 		if (!data) {
-			ldm_crit ("Disk read failed.");
+			ldm_crit("Disk read failed.");
 			goto out;
 		}
 
 		for (v = 0; v < perbuf; v++, data+=size) {  /* For each vblk */
 			if (MAGIC_VBLK != get_unaligned_be32(data)) {
-				ldm_error ("Expected to find a VBLK.");
+				ldm_error("Expected to find a VBLK.");
 				goto out;
 			}
 
 			recs = get_unaligned_be16(data + 0x0E);	/* Number of records */
 			if (recs = 1) {
-				if (!ldm_ldmdb_add (data, size, ldb))
+				if (!ldm_ldmdb_add(data, size, ldb))
 					goto out;	/* Already logged */
 			} else if (recs > 1) {
-				if (!ldm_frag_add (data, size, &frags))
+				if (!ldm_frag_add(data, size, &frags))
 					goto out;	/* Already logged */
 			}
 			/* else Record is not in use, ignore it. */
 		}
-		put_dev_sector (sect);
+		put_dev_sector(sect);
 		data = NULL;
 	}
 
-	result = ldm_frag_commit (&frags, ldb);	/* Failures, already logged */
+	result = ldm_frag_commit(&frags, ldb);	/* Failures, already logged */
 out:
 	if (data)
-		put_dev_sector (sect);
-	ldm_frag_free (&frags);
+		put_dev_sector(sect);
+	ldm_frag_free(&frags);
 
 	return result;
 }
@@ -1476,14 +1497,14 @@ out:
  *
  * Return:  none
  */
-static void ldm_free_vblks (struct list_head *lh)
+static void ldm_free_vblks(struct list_head *lh)
 {
 	struct list_head *item, *tmp;
 
-	BUG_ON (!lh);
+	BUG_ON(!lh);
 
-	list_for_each_safe (item, tmp, lh)
-		kfree (list_entry (item, struct vblk, list));
+	list_for_each_safe(item, tmp, lh)
+		kfree(list_entry(item, struct vblk, list));
 }
 
 
@@ -1516,7 +1537,7 @@ int ldm_partition(struct parsed_partitions *state)
 	if (!ldm_validate_partition_table(state))
 		return 0;
 
-	ldb = kmalloc (sizeof (*ldb), GFP_KERNEL);
+	ldb = kmalloc(sizeof(*ldb), GFP_KERNEL);
 	if (!ldb)
 		return -1;
 
@@ -1533,31 +1554,31 @@ int ldm_partition(struct parsed_partitions *state)
 	    	goto out;		/* Already logged */
 
 	/* Initialize vblk lists in ldmdb struct */
-	INIT_LIST_HEAD (&ldb->v_dgrp);
-	INIT_LIST_HEAD (&ldb->v_disk);
-	INIT_LIST_HEAD (&ldb->v_volu);
-	INIT_LIST_HEAD (&ldb->v_comp);
-	INIT_LIST_HEAD (&ldb->v_part);
+	INIT_LIST_HEAD(&ldb->v_dgrp);
+	INIT_LIST_HEAD(&ldb->v_disk);
+	INIT_LIST_HEAD(&ldb->v_volu);
+	INIT_LIST_HEAD(&ldb->v_comp);
+	INIT_LIST_HEAD(&ldb->v_part);
 
 	if (!ldm_get_vblks(state, base, ldb)) {
-		ldm_crit ("Failed to read the VBLKs from the database.");
+		ldm_crit("Failed to read the VBLKs from the database.");
 		goto cleanup;
 	}
 
 	/* Finally, create the data partition devices. */
 	if (ldm_create_data_partitions(state, ldb)) {
-		ldm_debug ("Parsed LDM database successfully.");
+		ldm_debug("Parsed LDM database successfully.");
 		result = 1;
 	}
 	/* else Already logged */
 
 cleanup:
-	ldm_free_vblks (&ldb->v_dgrp);
-	ldm_free_vblks (&ldb->v_disk);
-	ldm_free_vblks (&ldb->v_volu);
-	ldm_free_vblks (&ldb->v_comp);
-	ldm_free_vblks (&ldb->v_part);
+	ldm_free_vblks(&ldb->v_dgrp);
+	ldm_free_vblks(&ldb->v_disk);
+	ldm_free_vblks(&ldb->v_volu);
+	ldm_free_vblks(&ldb->v_comp);
+	ldm_free_vblks(&ldb->v_part);
 out:
-	kfree (ldb);
+	kfree(ldb);
 	return result;
 }
-- 
2.6.3

