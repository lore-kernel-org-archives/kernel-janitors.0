From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 08 Jun 2013 16:17:11 +0000
Subject: build regressions 2013-06-08
Message-Id: <51b35907.RUlbwoavYlo9BBoi%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[sparse]
arch/x86/crypto/sha512_ssse3_glue.c:144:19: sparse: restricted __be64 degrades to integer
arch/x86/crypto/sha512_ssse3_glue.c:144:17: sparse: incorrect type in assignment (different base types)
drivers/input/keyboard/cros_ec_keyb.c:200:31: sparse: bad constant expression
drivers/input/keyboard/cros_ec_keyb.c:212:32: sparse: bad constant expression
drivers/input/keyboard/cros_ec_keyb.c:213:32: sparse: bad constant expression
drivers/input/keyboard/cros_ec_keyb.c:226:46: sparse: cannot size expression
drivers/input/keyboard/cros_ec_keyb.c:228:55: sparse: cannot size expression
drivers/leds/trigger/ledtrig-cpu.c:38:8: sparse: symbol 'cpu_trig' was not declared. Should it be static?
drivers/net/usb/r8152.c:501:16: sparse: cast to restricted __le32
drivers/net/usb/r8152.c:524:16: sparse: cast to restricted __le32
drivers/net/usb/r8152.c:551:15: sparse: cast to restricted __le32
drivers/net/usb/r8152.c:553:13: sparse: incorrect type in assignment (different base types)
drivers/net/usb/r8152.c:573:16: sparse: cast to restricted __le32
drivers/net/usb/r8152.c:600:15: sparse: cast to restricted __le32
drivers/net/usb/r8152.c:602:13: sparse: incorrect type in assignment (different base types)
drivers/net/usb/r8152.c:791:19: sparse: cast to restricted __le32
drivers/net/usb/r8152.c:923:22: sparse: incorrect type in assignment (different base types)
drivers/net/usb/r8152.c:924:22: sparse: incorrect type in assignment (different base types)
drivers/net/usb/r8152.c:956:24: sparse: incorrect type in assignment (different base types)
kernel/auditfilter.c:426:63: sparse: constant 4294967295 is so big it is long
drivers/scsi/fnic/fnic_fcs.c:1198:6: sparse: context imbalance in 'fnic_handle_fip_timer' - different lock contexts for basic block
drivers/scsi/fnic/fnic_fcs.c:1198:6: sparse: context imbalance in 'fnic_handle_fip_timer' - different lock contexts for basic block
drivers/scsi/osd/osd_initiator.c:533:4: sparse: symbol 'sg_out_pad_buffer' was not declared. Should it be static?
drivers/scsi/osd/osd_initiator.c:534:4: sparse: symbol 'sg_in_pad_buffer' was not declared. Should it be static?
drivers/scsi/osd/osd_initiator.c:610:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:610:29: sparse: incorrect type in argument 1 (different base types)
drivers/scsi/osd/osd_initiator.c:610:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:610:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:610:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:610:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:610:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:610:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:610:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:610:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:611:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:611:26: sparse: incorrect type in argument 1 (different base types)
drivers/scsi/osd/osd_initiator.c:611:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:611:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:611:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:611:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:611:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:611:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:611:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:611:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:627:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:627:29: sparse: incorrect type in argument 1 (different base types)
drivers/scsi/osd/osd_initiator.c:627:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:627:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:627:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:627:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:627:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:627:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:627:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:627:29: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:628:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:628:26: sparse: incorrect type in argument 1 (different base types)
drivers/scsi/osd/osd_initiator.c:628:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:628:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:628:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:628:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:628:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:628:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:628:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:628:26: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:720:50: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:1212:50: sparse: incorrect type in assignment (different base types)
drivers/scsi/osd/osd_initiator.c:1312:55: sparse: incorrect type in assignment (different base types)
drivers/scsi/osd/osd_initiator.c:1313:50: sparse: incorrect type in assignment (different base types)
drivers/scsi/osd/osd_initiator.c:1822:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/osd/osd_initiator.c:1823:37: sparse: incorrect type in assignment (different base types)
drivers/scsi/osd/osd_initiator.c:1824:25: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_initiator.c:1824:25: sparse: cast from restricted osd_id
drivers/scsi/osd/osd_uld.c:160:10: sparse: symbol 'g_test_ioctl' was not declared. Should it be static?
drivers/scsi/osd/osd_uld.c:161:12: sparse: symbol 'g_do_test' was not declared. Should it be static?
fs/exofs/inode.c:1088:17: sparse: cast from restricted osd_id
fs/exofs/inode.c:1091:31: sparse: incorrect type in assignment (different base types)
fs/exofs/exofs.h:98:36: sparse: incorrect type in return expression (different base types)
fs/exofs/exofs.h:228:29: sparse: cast from restricted osd_id
fs/exofs/exofs.h:98:36: sparse: incorrect type in return expression (different base types)
fs/exofs/inode.c:1271:17: sparse: cast from restricted osd_id
fs/exofs/inode.c:1271:17: sparse: cast from restricted osd_id
fs/exofs/exofs.h:98:36: sparse: incorrect type in return expression (different base types)
fs/exofs/exofs.h:228:29: sparse: cast from restricted osd_id
fs/exofs/super.c:306:35: sparse: cast to restricted __le32
fs/exofs/super.c:306:35: sparse: cast from restricted __le64
fs/exofs/super.c:386:47: sparse: incorrect type in argument 4 (different base types)
fs/exofs/exofs.h:228:29: sparse: cast from restricted osd_id
fs/exofs/super.c:398:25: sparse: incorrect type in assignment (different base types)
fs/exofs/super.c:464:46: sparse: incorrect type in argument 4 (different base types)
fs/exofs/sys.c:157:41: sparse: incorrect type in initializer (different base types)
fs/exofs/ore_raid.c:24:13: sparse: symbol '_raid_page_alloc' was not declared. Should it be static?
fs/exofs/ore_raid.c:29:6: sparse: symbol '_raid_page_free' was not declared. Should it be static?
fs/nfs/objlayout/objio_osd.c:209:30: sparse: incorrect type in assignment (different base types)
fs/nfs/objlayout/objio_osd.c:210:23: sparse: incorrect type in assignment (different base types)
fs/nfs/objlayout/objlayout.c:628:50: sparse: incorrect type in argument 2 (different base types)
fs/nfs/objlayout/objio_osd.c:209:30: sparse: incorrect type in assignment (different base types)
fs/nfs/objlayout/objio_osd.c:210:23: sparse: incorrect type in assignment (different base types)
fs/nfs/objlayout/objlayout.c:628:50: sparse: incorrect type in argument 2 (different base types)
drivers/scsi/pm8001/pm8001_init.c:379:25: sparse: cast removes address space of expression

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
