From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 01 Apr 2007 12:24:17 +0000
Subject: [KJ] why isn't DEFINE_SIMPLE_ATTRIBUTE more widely used?
Message-Id: <Pine.LNX.4.64.0704010821300.10373@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  just for fun, as i was poking around debugfs, i was curious what
other parts of the kernel took advantage of the
DEFINE_SIMPLE_ATTRIBUTE macro defined in linux/fs.h:

$ grep -rw DEFINE_SIMPLE_ATTRIBUTE *
arch/powerpc/platforms/cell/spufs/file.c:DEFINE_SIMPLE_ATTRIBUTE(spufs_signal1_type, spufs_signal1_type_get,
arch/powerpc/platforms/cell/spufs/file.c:DEFINE_SIMPLE_ATTRIBUTE(spufs_signal2_type, spufs_signal2_type_get,
arch/powerpc/platforms/cell/spufs/file.c:DEFINE_SIMPLE_ATTRIBUTE(spufs_npc_ops, spufs_npc_get, spufs_npc_set,
arch/powerpc/platforms/cell/spufs/file.c:DEFINE_SIMPLE_ATTRIBUTE(spufs_decr_ops, spufs_decr_get, spufs_decr_set,
arch/powerpc/platforms/cell/spufs/file.c:DEFINE_SIMPLE_ATTRIBUTE(spufs_decr_status_ops, spufs_decr_status_get,
arch/powerpc/platforms/cell/spufs/file.c:DEFINE_SIMPLE_ATTRIBUTE(spufs_event_mask_ops, spufs_event_mask_get,
arch/powerpc/platforms/cell/spufs/file.c:DEFINE_SIMPLE_ATTRIBUTE(spufs_event_status_ops, spufs_event_status_get,
arch/powerpc/platforms/cell/spufs/file.c:DEFINE_SIMPLE_ATTRIBUTE(spufs_srr0_ops, spufs_srr0_get, spufs_srr0_set,
arch/powerpc/platforms/cell/spufs/file.c:DEFINE_SIMPLE_ATTRIBUTE(spufs_id_ops, spufs_id_get, NULL, "0x%llx\n")
arch/powerpc/platforms/cell/spufs/file.c:DEFINE_SIMPLE_ATTRIBUTE(spufs_object_id_ops, spufs_object_id_get,
arch/powerpc/platforms/cell/spufs/file.c:DEFINE_SIMPLE_ATTRIBUTE(spufs_lslr_ops, spufs_lslr_get, NULL, "0x%llx\n")
fs/debugfs/file.c:DEFINE_SIMPLE_ATTRIBUTE(fops_u8, debugfs_u8_get, debugfs_u8_set, "%llu\n");
fs/debugfs/file.c:DEFINE_SIMPLE_ATTRIBUTE(fops_u16, debugfs_u16_get, debugfs_u16_set, "%llu\n");
fs/debugfs/file.c:DEFINE_SIMPLE_ATTRIBUTE(fops_u32, debugfs_u32_get, debugfs_u32_set, "%llu\n");
include/linux/fs.h:#define DEFINE_SIMPLE_ATTRIBUTE(__fops, __get, __set, __fmt)         \
lib/fault-inject.c:DEFINE_SIMPLE_ATTRIBUTE(fops_ul, debugfs_ul_get, debugfs_ul_set, "%llu\n");
lib/fault-inject.c:DEFINE_SIMPLE_ATTRIBUTE(fops_ul_MAX_STACK_TRACE_DEPTH, debugfs_ul_get,
lib/fault-inject.c:DEFINE_SIMPLE_ATTRIBUTE(fops_atomic_t, debugfs_atomic_t_get,

  that's it?  i would have thought something that basic and handy
would be more popular.  not an error of any kind, just a curiosity.
might there be places in the source tree that could be
rewritten/simplified to take advantage of this?

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
