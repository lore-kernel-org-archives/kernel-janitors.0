From: Andreas Mohr <andi@rhlx01.fht-esslingen.de>
Date: Wed, 08 Feb 2006 18:53:12 +0000
Subject: [KJ] Correct imprecise >= comparisons
Message-Id: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============033708115446400733=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============033708115446400733==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello all,

in the kernel source tree, there are several places (less important ones
and high-profile ones such as TCP/IP) which do "incorrect" checks such as:

if (val >= max)
  val = max;

which can instead be expressed as

if (val > max)
  val = max;

in order to cut down on both executed cycles and cache write invalidation.

One question would be whether not executing the branch would lead to
pipeline stalls which could perhaps turn out to be more costly than always
writing the variable. Anyone?

I took care to not modify code which has side effects within its context
(such as a consecutive "else") or did make sense logically the way it was.

Any comments?

I'll do the same thing for <= checks if there are no objections.

Patch against 2.6.16-rc2-mm1.

Signed-off-by: Andreas Mohr <andi@lisas.de>


diff -urN linux-2.6.16-rc2-mm1.orig/arch/i386/kernel/setup.c linux-2.6.16-rc2-mm1/arch/i386/kernel/setup.c
--- linux-2.6.16-rc2-mm1.orig/arch/i386/kernel/setup.c	2006-02-08 18:29:39.000000000 +0100
+++ linux-2.6.16-rc2-mm1/arch/i386/kernel/setup.c	2006-02-08 19:10:12.000000000 +0100
@@ -1051,7 +1051,7 @@
 	/* check max_low_pfn */
 	if (start >= ((max_low_pfn + 1) << PAGE_SHIFT))
 		return 0;
-	if (end >= ((max_low_pfn + 1) << PAGE_SHIFT))
+	if (end > ((max_low_pfn + 1) << PAGE_SHIFT))
 		end = (max_low_pfn + 1) << PAGE_SHIFT;
 	if (start < end)
 		free_bootmem(start, end - start);
diff -urN linux-2.6.16-rc2-mm1.orig/arch/x86_64/kernel/e820.c linux-2.6.16-rc2-mm1/arch/x86_64/kernel/e820.c
--- linux-2.6.16-rc2-mm1.orig/arch/x86_64/kernel/e820.c	2006-02-03 07:03:08.000000000 +0100
+++ linux-2.6.16-rc2-mm1/arch/x86_64/kernel/e820.c	2006-02-08 19:12:50.000000000 +0100
@@ -141,7 +141,7 @@
 			addr = start;
 
 		last = round_down(ei->addr + ei->size, PAGE_SIZE); 
-		if (last >= end)
+		if (last > end)
 			last = end; 
 
 		if (last > addr && last-addr >= PAGE_SIZE)
@@ -211,7 +211,7 @@
 			addr = start;
 
 		last = round_down(ei->addr + ei->size, PAGE_SIZE);
-		if (last >= end)
+		if (last > end)
 			last = end;
 
 		if (last > addr)
diff -urN linux-2.6.16-rc2-mm1.orig/arch/x86_64/mm/numa.c linux-2.6.16-rc2-mm1/arch/x86_64/mm/numa.c
--- linux-2.6.16-rc2-mm1.orig/arch/x86_64/mm/numa.c	2006-02-08 18:29:40.000000000 +0100
+++ linux-2.6.16-rc2-mm1/arch/x86_64/mm/numa.c	2006-02-08 19:13:28.000000000 +0100
@@ -319,7 +319,7 @@
 #ifdef CONFIG_NUMA_EMU
 	if(!strncmp(opt, "fake=", 5)) {
 		numa_fake = simple_strtoul(opt+5,NULL,0); ;
-		if (numa_fake >= MAX_NUMNODES)
+		if (numa_fake > MAX_NUMNODES)
 			numa_fake = MAX_NUMNODES;
 	}
 #endif
diff -urN linux-2.6.16-rc2-mm1.orig/drivers/isdn/hisax/config.c linux-2.6.16-rc2-mm1/drivers/isdn/hisax/config.c
--- linux-2.6.16-rc2-mm1.orig/drivers/isdn/hisax/config.c	2006-02-08 18:29:41.000000000 +0100
+++ linux-2.6.16-rc2-mm1/drivers/isdn/hisax/config.c	2006-02-08 19:02:49.000000000 +0100
@@ -630,7 +630,7 @@
 			       len, HISAX_STATUS_BUFSIZE);
 		}
 		count = cs->status_end - cs->status_read + 1;
-		if (count >= len)
+		if (count > len)
 			count = len;
 		copy_to_user(p, cs->status_read, count);
 		cs->status_read += count;
@@ -716,7 +716,7 @@
 	}
 	count = len;
 	i = cs->status_end - cs->status_write + 1;
-	if (i >= len)
+	if (i > len)
 		i = len;
 	len -= i;
 	memcpy(cs->status_write, p, i);
diff -urN linux-2.6.16-rc2-mm1.orig/drivers/pci/proc.c linux-2.6.16-rc2-mm1/drivers/pci/proc.c
--- linux-2.6.16-rc2-mm1.orig/drivers/pci/proc.c	2006-02-03 07:03:08.000000000 +0100
+++ linux-2.6.16-rc2-mm1/drivers/pci/proc.c	2006-02-08 18:32:26.000000000 +0100
@@ -69,7 +69,7 @@
 
 	if (pos >= size)
 		return 0;
-	if (nbytes >= size)
+	if (nbytes > size)
 		nbytes = size;
 	if (pos + nbytes > size)
 		nbytes = size - pos;
@@ -139,7 +139,7 @@
 
 	if (pos >= size)
 		return 0;
-	if (nbytes >= size)
+	if (nbytes > size)
 		nbytes = size;
 	if (pos + nbytes > size)
 		nbytes = size - pos;
diff -urN linux-2.6.16-rc2-mm1.orig/drivers/pnp/isapnp/proc.c linux-2.6.16-rc2-mm1/drivers/pnp/isapnp/proc.c
--- linux-2.6.16-rc2-mm1.orig/drivers/pnp/isapnp/proc.c	2006-02-03 07:03:08.000000000 +0100
+++ linux-2.6.16-rc2-mm1/drivers/pnp/isapnp/proc.c	2006-02-08 19:08:17.000000000 +0100
@@ -65,7 +65,7 @@
 
 	if (pos >= size)
 		return 0;
-	if (nbytes >= size)
+	if (nbytes > size)
 		nbytes = size;
 	if (pos + nbytes > size)
 		nbytes = size - pos;
diff -urN linux-2.6.16-rc2-mm1.orig/drivers/scsi/BusLogic.c linux-2.6.16-rc2-mm1/drivers/scsi/BusLogic.c
--- linux-2.6.16-rc2-mm1.orig/drivers/scsi/BusLogic.c	2006-02-08 18:29:43.000000000 +0100
+++ linux-2.6.16-rc2-mm1/drivers/scsi/BusLogic.c	2006-02-08 19:07:19.000000000 +0100
@@ -3266,7 +3266,7 @@
 		BusLogic_Error("Message Buffer length %d exceeds size %d\n", HostAdapter, Length, BusLogic_MessageBufferSize);
 	if ((Length -= Offset) <= 0)
 		return 0;
-	if (Length >= BytesAvailable)
+	if (Length > BytesAvailable)
 		Length = BytesAvailable;
 	memcpy(ProcBuffer, HostAdapter->MessageBuffer + Offset, Length);
 	*StartPointer = ProcBuffer;
diff -urN linux-2.6.16-rc2-mm1.orig/drivers/scsi/osst.c linux-2.6.16-rc2-mm1/drivers/scsi/osst.c
--- linux-2.6.16-rc2-mm1.orig/drivers/scsi/osst.c	2006-02-08 18:29:44.000000000 +0100
+++ linux-2.6.16-rc2-mm1/drivers/scsi/osst.c	2006-02-08 19:05:21.000000000 +0100
@@ -4043,7 +4043,7 @@
 		 for (i=0; i<arg; i++)
 			ioctl_result |= osst_write_filemark(STp, &SRpnt);
 		 if (fileno >= 0) fileno += arg;
-		 if (blkno  >= 0) blkno   = 0;
+		 if (blkno  > 0) blkno   = 0;
 		 goto os_bypass;
 
 	 case MTWSM:
diff -urN linux-2.6.16-rc2-mm1.orig/drivers/scsi/sg.c linux-2.6.16-rc2-mm1/drivers/scsi/sg.c
--- linux-2.6.16-rc2-mm1.orig/drivers/scsi/sg.c	2006-02-08 18:29:44.000000000 +0100
+++ linux-2.6.16-rc2-mm1/drivers/scsi/sg.c	2006-02-08 19:03:44.000000000 +0100
@@ -826,7 +826,7 @@
 			return result;
 		if (val < 0)
 			return -EIO;
-		if (val >= MULDIV (INT_MAX, USER_HZ, HZ))
+		if (val > MULDIV (INT_MAX, USER_HZ, HZ))
 		    val = MULDIV (INT_MAX, USER_HZ, HZ);
 		sfp->timeout_user = val;
 		sfp->timeout = MULDIV (val, HZ, USER_HZ);
diff -urN linux-2.6.16-rc2-mm1.orig/drivers/usb/mon/mon_text.c linux-2.6.16-rc2-mm1/drivers/usb/mon/mon_text.c
--- linux-2.6.16-rc2-mm1.orig/drivers/usb/mon/mon_text.c	2006-02-08 18:29:44.000000000 +0100
+++ linux-2.6.16-rc2-mm1/drivers/usb/mon/mon_text.c	2006-02-08 19:01:41.000000000 +0100
@@ -95,7 +95,7 @@
 
 	if (len <= 0)
 		return 'L';
-	if (len >= DATA_MAX)
+	if (len > DATA_MAX)
 		len = DATA_MAX;
 
 	if (usb_pipein(pipe)) {
@@ -338,7 +338,7 @@
 	if ((data_len = ep->length) > 0) {
 		if (ep->data_flag == 0) {
 			cnt += snprintf(pbuf + cnt, limit - cnt, " =");
-			if (data_len >= DATA_MAX)
+			if (data_len > DATA_MAX)
 				data_len = DATA_MAX;
 			for (i = 0; i < data_len; i++) {
 				if (i % 4 == 0) {
diff -urN linux-2.6.16-rc2-mm1.orig/drivers/video/epson1355fb.c linux-2.6.16-rc2-mm1/drivers/video/epson1355fb.c
--- linux-2.6.16-rc2-mm1.orig/drivers/video/epson1355fb.c	2006-02-08 18:29:44.000000000 +0100
+++ linux-2.6.16-rc2-mm1/drivers/video/epson1355fb.c	2006-02-08 18:35:41.000000000 +0100
@@ -417,7 +417,7 @@
 
 	if (p >= info->fix.smem_len)
 		return 0;
-	if (count >= info->fix.smem_len)
+	if (count > info->fix.smem_len)
 		count = info->fix.smem_len;
 	if (count + p > info->fix.smem_len)
 		count = info->fix.smem_len - p;
@@ -451,7 +451,7 @@
 	/* from fbmem.c except for our own copy_*_user */
 	if (p > info->fix.smem_len)
 		return -ENOSPC;
-	if (count >= info->fix.smem_len)
+	if (count > info->fix.smem_len)
 		count = info->fix.smem_len;
 	err = 0;
 	if (count + p > info->fix.smem_len) {
diff -urN linux-2.6.16-rc2-mm1.orig/drivers/video/fbmem.c linux-2.6.16-rc2-mm1/drivers/video/fbmem.c
--- linux-2.6.16-rc2-mm1.orig/drivers/video/fbmem.c	2006-02-08 18:29:44.000000000 +0100
+++ linux-2.6.16-rc2-mm1/drivers/video/fbmem.c	2006-02-08 18:33:35.000000000 +0100
@@ -596,7 +596,7 @@
 	if (p >= total_size)
 		return 0;
 
-	if (count >= total_size)
+	if (count > total_size)
 		count = total_size;
 
 	if (count + p > total_size)
@@ -671,7 +671,7 @@
 	if (p > total_size)
 		return 0;
 
-	if (count >= total_size)
+	if (count > total_size)
 		count = total_size;
 
 	if (count + p > total_size)
diff -urN linux-2.6.16-rc2-mm1.orig/drivers/video/stifb.c linux-2.6.16-rc2-mm1/drivers/video/stifb.c
--- linux-2.6.16-rc2-mm1.orig/drivers/video/stifb.c	2006-02-03 07:03:08.000000000 +0100
+++ linux-2.6.16-rc2-mm1/drivers/video/stifb.c	2006-02-08 18:36:12.000000000 +0100
@@ -924,7 +924,7 @@
 
 	if (p >= info->fix.smem_len)
 	    return 0;
-	if (count >= info->fix.smem_len)
+	if (count > info->fix.smem_len)
 	    count = info->fix.smem_len;
 	if (count + p > info->fix.smem_len)
 		count = info->fix.smem_len - p;
@@ -959,7 +959,7 @@
 
 	if (p > info->fix.smem_len)
 	    return -ENOSPC;
-	if (count >= info->fix.smem_len)
+	if (count > info->fix.smem_len)
 	    count = info->fix.smem_len;
 	err = 0;
 	if (count + p > info->fix.smem_len) {
diff -urN linux-2.6.16-rc2-mm1.orig/drivers/zorro/proc.c linux-2.6.16-rc2-mm1/drivers/zorro/proc.c
--- linux-2.6.16-rc2-mm1.orig/drivers/zorro/proc.c	2006-02-03 07:03:08.000000000 +0100
+++ linux-2.6.16-rc2-mm1/drivers/zorro/proc.c	2006-02-08 19:09:22.000000000 +0100
@@ -55,7 +55,7 @@
 
 	if (pos >= sizeof(struct ConfigDev))
 		return 0;
-	if (nbytes >= sizeof(struct ConfigDev))
+	if (nbytes > sizeof(struct ConfigDev))
 		nbytes = sizeof(struct ConfigDev);
 	if (pos + nbytes > sizeof(struct ConfigDev))
 		nbytes = sizeof(struct ConfigDev) - pos;
diff -urN linux-2.6.16-rc2-mm1.orig/fs/nfs/inode.c linux-2.6.16-rc2-mm1/fs/nfs/inode.c
--- linux-2.6.16-rc2-mm1.orig/fs/nfs/inode.c	2006-02-08 18:29:45.000000000 +0100
+++ linux-2.6.16-rc2-mm1/fs/nfs/inode.c	2006-02-08 19:15:52.000000000 +0100
@@ -224,7 +224,7 @@
 {
 	if (bsize < NFS_MIN_FILE_IO_SIZE)
 		bsize = NFS_DEF_FILE_IO_SIZE;
-	else if (bsize >= NFS_MAX_FILE_IO_SIZE)
+	else if (bsize > NFS_MAX_FILE_IO_SIZE)
 		bsize = NFS_MAX_FILE_IO_SIZE;
 
 	return nfs_block_bits(bsize, nrbitsp);
diff -urN linux-2.6.16-rc2-mm1.orig/fs/nfs/nfs3xdr.c linux-2.6.16-rc2-mm1/fs/nfs/nfs3xdr.c
--- linux-2.6.16-rc2-mm1.orig/fs/nfs/nfs3xdr.c	2006-02-08 18:29:45.000000000 +0100
+++ linux-2.6.16-rc2-mm1/fs/nfs/nfs3xdr.c	2006-02-08 19:19:07.000000000 +0100
@@ -148,7 +148,7 @@
 	int		fmode;
 
 	type = ntohl(*p++);
-	if (type >= NF3BAD)
+	if (type > NF3BAD)
 		type = NF3BAD;
 	fmode = nfs_type2fmt[type].mode;
 	fattr->type = nfs_type2fmt[type].nfs2type;
diff -urN linux-2.6.16-rc2-mm1.orig/fs/sysfs/file.c linux-2.6.16-rc2-mm1/fs/sysfs/file.c
--- linux-2.6.16-rc2-mm1.orig/fs/sysfs/file.c	2006-02-08 18:29:46.000000000 +0100
+++ linux-2.6.16-rc2-mm1/fs/sysfs/file.c	2006-02-08 19:20:41.000000000 +0100
@@ -191,7 +191,7 @@
 	if (!buffer->page)
 		return -ENOMEM;
 
-	if (count >= PAGE_SIZE)
+	if (count > PAGE_SIZE)
 		count = PAGE_SIZE;
 	error = copy_from_user(buffer->page,buf,count);
 	buffer->needs_read_fill = 1;
diff -urN linux-2.6.16-rc2-mm1.orig/fs/ufs/balloc.c linux-2.6.16-rc2-mm1/fs/ufs/balloc.c
--- linux-2.6.16-rc2-mm1.orig/fs/ufs/balloc.c	2006-02-03 07:03:08.000000000 +0100
+++ linux-2.6.16-rc2-mm1/fs/ufs/balloc.c	2006-02-08 19:19:53.000000000 +0100
@@ -743,7 +743,7 @@
 	 */
 	start = blkno + 1;
 	end = start + uspi->s_contigsumsize;
-	if ( end >= ucpi->c_nclusterblks)
+	if ( end > ucpi->c_nclusterblks)
 		end = ucpi->c_nclusterblks;
 	i = ubh_find_next_zero_bit (UCPI_UBH, ucpi->c_clusteroff, end, start);
 	if (i > end)
diff -urN linux-2.6.16-rc2-mm1.orig/ipc/sem.c linux-2.6.16-rc2-mm1/ipc/sem.c
--- linux-2.6.16-rc2-mm1.orig/ipc/sem.c	2006-02-08 18:29:46.000000000 +0100
+++ linux-2.6.16-rc2-mm1/ipc/sem.c	2006-02-08 19:31:04.000000000 +0100
@@ -1090,7 +1090,7 @@
 	}
 	max = 0;
 	for (sop = sops; sop < sops + nsops; sop++) {
-		if (sop->sem_num >= max)
+		if (sop->sem_num > max)
 			max = sop->sem_num;
 		if (sop->sem_flg & SEM_UNDO)
 			undos = 1;
diff -urN linux-2.6.16-rc2-mm1.orig/net/ipv4/ip_output.c linux-2.6.16-rc2-mm1/net/ipv4/ip_output.c
--- linux-2.6.16-rc2-mm1.orig/net/ipv4/ip_output.c	2006-02-03 07:03:08.000000000 +0100
+++ linux-2.6.16-rc2-mm1/net/ipv4/ip_output.c	2006-02-08 19:22:18.000000000 +0100
@@ -985,7 +985,7 @@
 			unsigned int left;
 
 			if (page && (left = PAGE_SIZE - off) > 0) {
-				if (copy >= left)
+				if (copy > left)
 					copy = left;
 				if (page != frag->page) {
 					if (i == MAX_SKB_FRAGS) {
diff -urN linux-2.6.16-rc2-mm1.orig/net/ipv6/ip6_output.c linux-2.6.16-rc2-mm1/net/ipv6/ip6_output.c
--- linux-2.6.16-rc2-mm1.orig/net/ipv6/ip6_output.c	2006-02-03 07:03:08.000000000 +0100
+++ linux-2.6.16-rc2-mm1/net/ipv6/ip6_output.c	2006-02-08 19:25:17.000000000 +0100
@@ -1081,7 +1081,7 @@
 			unsigned int left;
 
 			if (page && (left = PAGE_SIZE - off) > 0) {
-				if (copy >= left)
+				if (copy > left)
 					copy = left;
 				if (page != frag->page) {
 					if (i == MAX_SKB_FRAGS) {
diff -urN linux-2.6.16-rc2-mm1.orig/net/sunrpc/xprt.c linux-2.6.16-rc2-mm1/net/sunrpc/xprt.c
--- linux-2.6.16-rc2-mm1.orig/net/sunrpc/xprt.c	2006-02-03 07:03:08.000000000 +0100
+++ linux-2.6.16-rc2-mm1/net/sunrpc/xprt.c	2006-02-08 19:23:21.000000000 +0100
@@ -456,7 +456,7 @@
 			req->rq_timeout <<= 1;
 		else
 			req->rq_timeout += to->to_increment;
-		if (to->to_maxval && req->rq_timeout >= to->to_maxval)
+		if (to->to_maxval && req->rq_timeout > to->to_maxval)
 			req->rq_timeout = to->to_maxval;
 		req->rq_retries++;
 		pprintk("RPC: %lu retrans\n", jiffies);
diff -urN linux-2.6.16-rc2-mm1.orig/sound/oss/emu10k1/cardwo.c linux-2.6.16-rc2-mm1/sound/oss/emu10k1/cardwo.c
--- linux-2.6.16-rc2-mm1.orig/sound/oss/emu10k1/cardwo.c	2006-02-03 07:03:08.000000000 +0100
+++ linux-2.6.16-rc2-mm1/sound/oss/emu10k1/cardwo.c	2006-02-08 19:26:00.000000000 +0100
@@ -59,7 +59,7 @@
 	else
 		woinst->num_voices = wave_fmt->channels;
 
-	if (wave_fmt->samplingrate >= 0x2ee00)
+	if (wave_fmt->samplingrate > 0x2ee00)
 		wave_fmt->samplingrate = 0x2ee00;
 
 	wave_fmt->passthrough = 0;
diff -urN linux-2.6.16-rc2-mm1.orig/sound/oss/sequencer.c linux-2.6.16-rc2-mm1/sound/oss/sequencer.c
--- linux-2.6.16-rc2-mm1.orig/sound/oss/sequencer.c	2006-02-03 07:03:08.000000000 +0100
+++ linux-2.6.16-rc2-mm1/sound/oss/sequencer.c	2006-02-08 19:28:09.000000000 +0100
@@ -1602,7 +1602,7 @@
 	if (!base_freq)
 		return base_freq;
 
-	if (range >= 8192)
+	if (range > 8192)
 		range = 8192;
 
 	bend = bend * range / 8192;	/* Convert to cents */
diff -urN linux-2.6.16-rc2-mm1.orig/sound/synth/emux/soundfont.c linux-2.6.16-rc2-mm1/sound/synth/emux/soundfont.c
--- linux-2.6.16-rc2-mm1.orig/sound/synth/emux/soundfont.c	2006-02-08 18:29:47.000000000 +0100
+++ linux-2.6.16-rc2-mm1/sound/synth/emux/soundfont.c	2006-02-08 19:29:41.000000000 +0100
@@ -889,7 +889,7 @@
 {
 	int val = (0x7f * 92 - msec) / 92;
 	if (val < 1) val = 1;
-	if (val >= 126) val = 126;
+	if (val > 126) val = 126;
 	return val;
 }
 

--===============033708115446400733==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============033708115446400733==--
