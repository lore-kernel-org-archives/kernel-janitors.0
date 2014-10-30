From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Oct 2014 00:31:22 +0000
Subject: Re: Where's the current ToDo?
Message-Id: <20141030003122.GK6890@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141026054124.GA30544@rho.novalocal>
In-Reply-To: <20141026054124.GA30544@rho.novalocal>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 29, 2014 at 09:24:21PM -0200, Raphael S Carvalho wrote:
> On Wed, Oct 29, 2014 at 6:26 AM, Dan Carpenter <dan.carpenter@oracle.com>
> wrote:
> 
> > On Sun, Oct 26, 2014 at 12:41:24AM -0500, Jose-Luis Rivas wrote:
> > > Hi,
> > >
> > > I was checking out the ToDo list and AFAICS [0] seems to be pretty much
> > > outdated. Don't know if there's a more up-to-date list of ToDos or I'm
> > > supposed to check them all and see which ones are current. Just asking
> > > since I want to be sure I'm checking at the right place.
> > >
> > > [0] http://kernelnewbies.org/KernelJanitors/Todo/ApiChanges
> > >
> >
> > Sorry we don't have a current TODO list.  These days we normally just
> > tell people to cleanup staging drivers or fix compile warnings and
> > static checker issues.
> >
> Hi Jose, please keep in mind that the tasks Dan stated above are good for
> beginners. As soon as you get used with the Linux way of doing things, you
> should move on to more complex things.

Staging is actually a great way to go from beginner to experienced but
people mostly get bored first.  You just have to pick one driver and
keep focused on it until it is ready for mainline.  If you keep your
eyes open as you work then you will keep adding things to the your TODO
list and you'll keep finding obvious bugs.  You don't even need to
really understand the code at first to spot bugs and fix them.  Then
after a while you will understand the whole driver.

Most people start with boring white space changes and quit, but we've
had some people progress on and become experienced.

Static checker stuff is a pretty traditional KernelJanitors task.  For
example, if someone wanted they could take a look at the list of Smatch
warnings below from today's linux-next.  Of course, you could fix almost
all of these warnings by adding casts but that's a brainless thing and
you won't learn anything.

But if you take your time and consider if the bug can be triggered in
real life and what the effect of the bug is then it's a valuable thing
and you'll learn from it.  For example, some of these would only shift
wrap if someone invented 12 peta cdroms or whatever so it's not going to
happen in real life.  If I recall, the bpf code that generates this
warning is very deliberate?

regards,
dan carpenter

arch/x86/kvm/x86.c:7033 kvm_vcpu_deliver_sipi_vector() warn: should 'vector << 12' be a 64 bit type?
arch/x86/pci/mmconfig_64.c:106 mcfg_ioremap() warn: should '(num_buses) << 20' be a 64 bit type?
drivers/atm/eni.c:1006 put_dma() warn: should '(words & ~1) << 2' be a 64 bit type?
drivers/atm/eni.c:1016 put_dma() warn: should 'words << 2' be a 64 bit type?
drivers/atm/eni.c:973 put_dma() warn: should '(words & ~15) << 2' be a 64 bit type?
drivers/atm/eni.c:984 put_dma() warn: should '(words & ~7) << 2' be a 64 bit type?
drivers/atm/eni.c:995 put_dma() warn: should '(words & ~3) << 2' be a 64 bit type?
drivers/char/agp/amd64-agp.c:159 amd64_configure() warn: should 'tmp << 25' be a 64 bit type?
drivers/char/agp/amd64-agp.c:280 fix_northbridge() warn: should 'nb_base << 25' be a 64 bit type?
drivers/char/agp/intel-gtt.c:224 i810_insert_dcache_entries() warn: should 'i << 12' be a 64 bit type?
drivers/cpufreq/intel_pstate.c:430 byt_set_pstate() warn: should 'pstate << 8' be a 64 bit type?
drivers/cpufreq/intel_pstate.c:519 core_set_pstate() warn: should 'pstate << 8' be a 64 bit type?
drivers/edac/amd64_edac.c:1319 f1x_get_norm_dct_addr() warn: should '(pvt->dct_sel_hi & 4294966272) << 16' be a 64 bit type?
drivers/gpu/drm/nouveau/core/subdev/vm/base.c:63 nouveau_vm_map_at() warn: should 'len << (bits + 12)' be a 64 bit type?
drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c:109 nv50_vm_map() warn: should 'block << (vma->node->type - 3)' be a 64 bit type?
drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c:114 nv50_vm_map() warn: should 'block << (vma->node->type - 3)' be a 64 bit type?
drivers/gpu/drm/nouveau/core/subdev/vm/nvc0.c:113 nvc0_vm_map() warn: should '1 << (vma->node->type - 8)' be a 64 bit type?
drivers/gpu/drm/qxl/qxl_kms.c:99 setup_slot() warn: should 'slot_index << qdev->slot_gen_bits' be a 64 bit type?
drivers/gpu/drm/radeon/r100.c:2780 r100_vram_init_sizes() warn: should '((tom >> 16) - (tom & 65535) + 1) << 16' be a 64 bit type?
drivers/gpu/drm/radeon/r600_cs.c:1281 r600_cs_check_reg() warn: should 'radeon_get_ib_value(p, idx) << 8' be a 64 bit type?
drivers/gpu/drm/radeon/r600_cs.c:1308 r600_cs_check_reg() warn: should 'radeon_get_ib_value(p, idx) << 8' be a 64 bit type?
drivers/gpu/drm/radeon/r600_cs.c:2107 r600_packet3_check() warn: should 'radeon_get_ib_value(p, idx + 1) << 8' be a 64 bit type?
drivers/infiniband/hw/mthca/mthca_cmd.c:693 mthca_map_cmd() warn: should '1 << lg' be a 64 bit type?
drivers/infiniband/hw/qib/qib_iba7322.c:6366 write_7322_initregs() warn: should 'ctxt << (5 * (i % 6))' be a 64 bit type?
drivers/md/dm-raid.c:1673 attempt_restore_of_faulty_devices() warn: should '1 << i' be a 64 bit type?
drivers/media/dvb-frontends/tda10086.c:476 tda10086_get_frontend() warn: should 'tda10086_read_byte(state, 81) << 8' be a 64 bit type?
drivers/media/pci/b2c2/flexcop-pci.c:185 flexcop_pci_isr() warn: should 'fc->read_ibi_reg(fc, 8).dma_0x8.dma_cur_addr << 2' be a 64 bit type?
drivers/media/rc/rc-main.c:1423 rc_register_device() warn: should '1 << rc_map->rc_type' be a 64 bit type?
drivers/message/fusion/mptsas.c:892 mptsas_setup_wide_ports() warn: should '1 << phy_info->phy_id' be a 64 bit type?
drivers/message/fusion/mptsas.c:934 mptsas_setup_wide_ports() warn: should '1 << phy_info_cmp->phy_id' be a 64 bit type?
drivers/mtd/ftl.c:225 build_maps() warn: should '(i + ()) << part->header.EraseUnitSize' be a 64 bit type?
drivers/mtd/ftl.c:354 erase_xfer() warn: should '1 << part->header.EraseUnitSize' be a 64 bit type?
drivers/mtd/lpddr/lpddr_cmds.c:77 lpddr_cmdset() warn: should '1 << lpddr->qinfo->DevSizeShift' be a 64 bit type?
drivers/mtd/nand/diskonchip.c:1131 nftl_partscan() warn: should '(mh->NumEraseUnits - numheaders) << this->bbt_erase_shift' be a 64 bit type?
drivers/mtd/nand/diskonchip.c:1248 inftl_partscan() warn: should 'ip->firstUnit << vshift' be a 64 bit type?
drivers/mtd/nand/diskonchip.c:1249 inftl_partscan() warn: should '(1 + ip->lastUnit - ip->firstUnit) << vshift' be a 64 bit type?
drivers/mtd/nand/diskonchip.c:1259 inftl_partscan() warn: should 'lastvunit << vshift' be a 64 bit type?
drivers/mtd/nand/nand_base.c:3189 nand_flash_detect_onfi() warn: should '1 << (fls(()) - 1)' be a 64 bit type?
drivers/mtd/nand/nand_base.c:3285 nand_flash_detect_jedec() warn: should '1 << (fls(()) - 1)' be a 64 bit type?
drivers/mtd/nand/nand_bbt.c:507 create_bbt() warn: should '1 << this->bbt_erase_shift' be a 64 bit type?
drivers/mtd/nand/nand_bbt.c:791 write_bbt() warn: should '1 << this->bbt_erase_shift' be a 64 bit type?
drivers/mtd/onenand/onenand_base.c:3584 flexonenand_get_size() warn: should 'mtd->eraseregions + i->numblocks << eraseshift' be a 64 bit type?
drivers/mtd/onenand/onenand_base.c:3590 flexonenand_get_size() warn: should '(this->boundary[die] + 1) << (eraseshift - 1)' be a 64 bit type?
drivers/mtd/onenand/onenand_base.c:3598 flexonenand_get_size() warn: should 'mtd->eraseregions + i->numblocks << eraseshift' be a 64 bit type?
drivers/mtd/onenand/onenand_base.c:953 onenand_invalidate_bufferram() warn: should 'this->bufferram[i]->blockpage << this->page_shift' be a 64 bit type?
drivers/mtd/onenand/onenand_bbt.c:117 create_bbt() warn: should '1 << bbm->bbt_erase_shift' be a 64 bit type?
drivers/net/ethernet/mellanox/mlx4/fw.c:1111 mlx4_map_cmd() warn: should '1 << lg' be a 64 bit type?
drivers/net/ethernet/sun/niu.c:2775 vlan_tbl_write() warn: should 'rdc_table << ((port) * 4)' be a 64 bit type?
drivers/net/ethernet/sun/niu.c:4669 niu_txc_port_dma_enable() warn: should '1 << np->tx_rings + i->tx_channel' be a 64 bit type?
drivers/net/ethernet/sun/niu.c:5145 niu_zcp_cfifo_reset() warn: should '1 << (np->port)' be a 64 bit type?
drivers/net/wireless/ath/ath6kl/wmi.c:2773 ath6kl_set_bitrate_mask64() warn: should 'mask->control[band]->legacy << 4' be a 64 bit type?
drivers/pci/pci.c:4316 pci_specified_resource_alignment() warn: should '1 << align_order' be a 64 bit type?
drivers/scsi/osd/osd_initiator.c:2057 __osd_encode_offset() warn: should '1 << shift' be a 64 bit type?
drivers/staging/lustre/lnet/lnet/api-ni.c:600 lnet_res_lh_initialize() warn: should '1 << ibits' be a 64 bit type?
drivers/staging/lustre/lustre/osc/osc_request.c:941 osc_shrink_grant() warn: should 'cli->cl_max_pages_per_rpc << 12' be a 64 bit type?
drivers/staging/lustre/lustre/osc/osc_request.c:957 osc_shrink_grant_to_target() warn: should 'cli->cl_max_pages_per_rpc << 12' be a 64 bit type?
drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c:834 ptlrpc_lprocfs_svc_req_history_start() warn: should '(i) << (64 - (svc)->srv_cpt_bits)' be a 64 bit type?
drivers/xen/gntdev.c:577 gntdev_ioctl_map_grant_ref() warn: should 'map->index << 12' be a 64 bit type?
drivers/xen/gntdev.c:632 gntdev_ioctl_get_offset_for_vaddr() warn: should 'map->index << 12' be a 64 bit type?
drivers/xen/gntdev.c:676 gntdev_ioctl_notify() warn: should 'map->index << 12' be a 64 bit type?
drivers/xen/gntdev.c:677 gntdev_ioctl_notify() warn: should '(map->index + map->count) << 12' be a 64 bit type?
fs/btrfs/ioctl.c:1430 btrfs_defrag_file() warn: should 'ret << 12' be a 64 bit type?
fs/ceph/addr.c:317 start_read() warn: should 'nr_pages << 12' be a 64 bit type?
fs/ext4/inode.c:4619 ext4_getattr() warn: should '(()->i_reserved_data_blocks) << (EXT4_SB(inode->i_sb))->s_cluster_bits' be a 64 bit type?
fs/ext4/mballoc.c:1444 mb_free_blocks() warn: should '(block) << (EXT4_SB(sb))->s_cluster_bits' be a 64 bit type?
fs/ext4/mballoc.c:4338 ext4_mb_release_context() warn: should '(ac->ac_b_ex.fe_len) << (sbi)->s_cluster_bits' be a 64 bit type?
fs/fat/dir.c:1383 fat_add_entries() warn: should 'nr_cluster << sbi->cluster_bits' be a 64 bit type?
fs/fat/dir.c:1384 fat_add_entries() warn: should 'nr_cluster << sbi->cluster_bits' be a 64 bit type?
fs/fat/inode.c:480 fat_calc_dir_size() warn: should '(fclus + 1) << sbi->cluster_bits' be a 64 bit type?
fs/hfsplus/super.c:313 hfsplus_statfs() warn: should 'sbi->total_blocks << sbi->fs_shift' be a 64 bit type?
fs/hfsplus/super.c:314 hfsplus_statfs() warn: should 'sbi->free_blocks << sbi->fs_shift' be a 64 bit type?
fs/jfs/jfs_dtree.c:1007 dtSplitUp() warn: should 'xlen << sbi->l2bsize' be a 64 bit type?
fs/jfs/jfs_dtree.c:1059 dtSplitUp() warn: should '(((pxd)->len)) << sbi->l2bsize' be a 64 bit type?
fs/jfs/resize.c:399 jfs_extendfs() warn: should 'xlen << sbi->l2bsize' be a 64 bit type?
fs/logfs/readwrite.c:841 seek_holedata_loop() warn: should '1 << ((9) * ( - 1))' be a 64 bit type?
fs/nilfs2/inode.c:1087 nilfs_fiemap() warn: should 'n << blkbits' be a 64 bit type?
fs/nilfs2/inode.c:1100 nilfs_fiemap() warn: should 'n << blkbits' be a 64 bit type?
fs/nilfs2/inode.c:1107 nilfs_fiemap() warn: should 'n << blkbits' be a 64 bit type?
fs/ocfs2/dir.c:2813 ocfs2_expand_inline_dir() warn: should 'blocks_wanted << sb->s_blocksize_bits' be a 64 bit type?
fs/omfs/dir.c:438 omfs_readdir() warn: should '(hchain + 2) << 20' be a 64 bit type?
fs/udf/inode.c:1049 udf_prealloc_extents() warn: should 'numalloc << inode->i_sb->s_blocksize_bits' be a 64 bit type?
fs/udf/super.c:709 udf_check_vsd() warn: should 'sbi->s_session << sb->s_blocksize_bits' be a 64 bit type?
fs/ufs/balloc.c:819 ufs_bitmap_search() warn: should '(start + length - loc) << 3' be a 64 bit type?
fs/ufs/truncate.c:87 ufs_trunc_direct() warn: should '12 << uspi->s_fpbshift' be a 64 bit type?
fs/xfs/xfs_aops.c:1812 xfs_vm_set_page_dirty() warn: should '1 << inode->i_blkbits' be a 64 bit type?
fs/xfs/xfs_aops.c:939 xfs_aops_discard_page() warn: should '1 << inode->i_blkbits' be a 64 bit type?
include/linux/netdevice.h:3557 net_gso_ok() warn: should 'gso_type << 16' be a 64 bit type?
kernel/bpf/core.c:324 __bpf_prog_run() warn: should 'regs[insn->dst_reg] << insn->imm' be a 64 bit type?
kernel/bpf/core.c:324 __bpf_prog_run() warn: should 'regs[insn->dst_reg] << regs[insn->src_reg]' be a 64 bit type?
