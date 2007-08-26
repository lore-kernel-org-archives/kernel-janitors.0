From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 26 Aug 2007 16:02:22 +0000
Subject: Re: possible power-of-2 cleanup
Message-Id: <Pine.LNX.4.64.0708261200440.6389@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0708260714110.24759@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0708260714110.24759@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 26 Aug 2007, vignesh babu wrote:

> Robert,
>   Im on it...I have submitted a few more patches in the past week or
> so and a few were accepted...will update on the wiki soon.
> Vignesh

just FYI, i ran my detection script on the entire tree and came up
with these possibilities for power of 2 cleanup -- i'm assuming you've
probably seen and processed some of them.  as for the rest of them,
have fun.  :-)


=== Places that might represent a call to is_power_of_2() ...

	x & (x - 1):

./fs/ext2/super.c:		    (sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
./fs/ext4/super.c:		    sbi->s_desc_size & (sbi->s_desc_size - 1)) {
./fs/ntfs/logfile.c:			logfile_log_page_size & (logfile_log_page_size - 1)) {
./fs/ntfs/inode.c:	if (ni->itype.index.block_size & (ni->itype.index.block_size - 1)) {
./fs/xfs/xfs_inode.c:	if ((v & (v - 1)) = 0)
./fs/hfs/mdb.c:	while (size & (size - 1))
./fs/nfs/internal.h:	if ((bsize & (bsize - 1)) || nrbitsp) {
./include/asm-arm/div64.h:	    (__LINUX_ARM_ARCH__ < 4 && (__b & (__b - 1)) != 0)) {	\
./include/asm-arm/div64.h:	} else if ((__b & (__b - 1)) = 0) {				\
./include/linux/log2.h:	return (n != 0 && ((n & (n - 1)) = 0));
./include/linux/bitops.h:	if (count & (count - 1))
./include/asm-sparc64/vio.h:	BUILD_BUG_ON(ring_size & (ring_size - 1));
./include/sound/pcm_params.h:		if (mask->bits[i] & (mask->bits[i] - 1))
./kernel/kfifo.c:	if (size & (size - 1)) {
./arch/sparc64/math-emu/math.c:		if((eflag & (eflag - 1)) != 0) {
./arch/blackfin/kernel/irqchip.c:	other_ints = pending & (pending - 1);
./arch/powerpc/mm/ppc_mmu_32.c:	if (n_hpteg & (n_hpteg - 1)) {
./arch/powerpc/lib/rheap.c:	if ((alignment & (alignment - 1)) != 0)
./arch/powerpc/lib/rheap.c:	if ((alignment & (alignment - 1)) != 0)
./arch/powerpc/lib/rheap.c:	if (size <= 0 || (alignment & (alignment - 1)) != 0)
./arch/sparc/math-emu/math.c:		if ((eflag & (eflag - 1)) != 0) {
./arch/sparc/mm/srmmu.c:	if (size & (size-1)) {
./arch/ppc/mm/ppc_mmu.c:	if (n_hpteg & (n_hpteg - 1)) {
./mm/bootmem.c:	BUG_ON(align & (align-1));
./mm/slab.c:		if (!(error & (error - 1))) {
./mm/slub.c:		(KMALLOC_MIN_SIZE & (KMALLOC_MIN_SIZE - 1)));
./drivers/s390/block/dasd_int.h:	if (bsize < 512 || bsize > 4096 || (bsize & (bsize - 1)) != 0)
./drivers/s390/cio/cio.c:	if ((sch->lpm & (sch->lpm - 1)) != 0)
./drivers/s390/cio/device_fsm.c:	if ((sch->lpm & (sch->lpm - 1)) != 0)
./drivers/char/drm/drm_bufs.c:	if (size & (size - 1))
./drivers/md/dm-stripe.c:	if (!chunk_size || (chunk_size & (chunk_size - 1)) ||
./drivers/md/dm-snap.c:	while (n & (n - 1))
./drivers/md/dm-snap.c:	if (chunk_size & (chunk_size - 1)) {
./drivers/md/dm-raid1.c:	return !(size % (PAGE_SIZE >> 9) || (size & (size - 1)) ||
./drivers/block/rd.c:			(rd_blocksize & (rd_blocksize-1))) {
./drivers/pcmcia/tcic.c:	base = base & (base-1);
./drivers/pcmcia/tcic.c:    scan = (mask & (mask-1));
./drivers/pcmcia/tcic.c:    if (((scan & (scan-1)) = 0) && (poll_interval = 0))
./drivers/pcmcia/i82365.c:	tmp = tmp & (tmp-1);
./drivers/pcmcia/i82365.c:	if ((tmp & (tmp-1)) = 0)
./drivers/pci/pci.c:	if (mmrbc < 512 || mmrbc > 4096 || (mmrbc & (mmrbc-1)))
./drivers/pci/pci.c:	if (rq < 128 || rq > 4096 || (rq & (rq-1)))
./drivers/usb/storage/sddr09.c:		parity[i] = (parity[i&(i-1)] ^ 1);
./drivers/usb/storage/alauda.c:		parity[i] = (parity[i&(i-1)] ^ 1);
./drivers/video/vesafb.c:			while (temp_size & (temp_size - 1))
./drivers/scsi/libiscsi.c:	if (cmds_max < 2 || (cmds_max & (cmds_max - 1)) ||
./drivers/scsi/esp_scsi.c:		if (!bits || (bits & (bits - 1)))
./drivers/scsi/iscsi_tcp.c:		if (session->max_r2t & (session->max_r2t - 1))
./drivers/scsi/NCR53C9x.c:	if(it & (it - 1))
./drivers/net/chelsio/cxgb2.c:		if (cmd->advertising & (cmd->advertising - 1))
./drivers/net/3c503.c:    if (   (iobase_reg  & (iobase_reg - 1))
./drivers/net/3c503.c:	|| (membase_reg & (membase_reg - 1))) {
./drivers/net/pcmcia/pcnet_cs.c:    while ((window_size & (window_size - 1)) != 0)
./drivers/net/cxgb3/t3_hw.c:		mask = gpi - (gpi & (gpi - 1));
./drivers/rtc/rtc-s3c.c:		if ((arg & (arg-1)) != 0 || arg < 1) {
./net/core/neighbour.c:	BUG_ON(new_entries & (new_entries - 1));
./net/decnet/dn_route.c:		while(dn_rt_hash_mask & (dn_rt_hash_mask - 1))

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
