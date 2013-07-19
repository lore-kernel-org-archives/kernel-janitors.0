From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 19 Jul 2013 17:35:58 +0000
Subject: build regressions 2013-07-19
Message-Id: <51e978fe.9yBcQmtrEkc8Mow9%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/scsi/scsi-mq.c:140:3: error: implicit declaration of function '__smp_call_function_single' [-Werror=implicit-function-declaration]
hest.c:(.init.text+0x6004): undefined reference to `mce_disable_bank'
cs42l52.c:(.text+0x42776): undefined reference to `devm_input_allocate_device'
wm8962.c:(.text+0x786c5): undefined reference to `devm_input_allocate_device'
ERROR: "crc32_le" [drivers/pcmcia/pcmcia.ko] undefined!
drivers/video/xilinxfb.c:478:2: error: too many arguments to function 'platform_get_drvdata'
ERROR: ".blk_mq_alloc_request" [drivers/scsi/scsi_mod.ko] undefined!
docproc: kernel/printk.c: No such file or directory
lib/spinlock_refcount.c:143:6: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:143:39: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:143:39: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:147:7: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:147:24: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:149:26: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:149:26: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:149:26: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:149:43: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:149:26: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:150:14: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:149:26: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:149:26: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:149:26: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:149:26: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:149:26: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:150:33: error: 'struct lockref' has no member named 'lock_count'
lib/spinlock_refcount.c:172:6: error: redefinition of 'lockref_get'
lib/spinlock_refcount.c:187:5: error: redefinition of 'lockref_get_not_zero'
lib/spinlock_refcount.c:198:5: error: redefinition of 'lockref_put'

[warnings]
drivers/scsi/sd.c:582: warning: 'sd_prot_op' defined but not used
drivers/scsi/scsi.c:856:7: warning: unused variable 'old_good_bytes' [-Wunused-variable]
drivers/scsi/scsi.c:826:22: warning: unused variable 'drv' [-Wunused-variable]
drivers/target/loopback/tcm_loop.c:82:23: warning: unused variable 'tl_cmd' [-Wunused-variable]
drivers/scsi/virtio_scsi.c:688:2: warning: #warning FIXME: Need to pass nr_hw_queues into scsi-mq [-Wcpp]
lib/spinlock_refcount.c:149:4: warning: right shift count >= width of type [enabled by default]

[sparse]
drivers/memstick/core/ms_block.c:796:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] block_address @@    got resunsigned short [unsigned] block_address @@
drivers/memstick/core/ms_block.c:834:47: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] block_address @@    got resunsigned short [unsigned] block_address @@
drivers/memstick/core/ms_block.c:907:47: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] block_address @@    got resunsigned short [unsigned] block_address @@
drivers/memstick/core/ms_block.c:954:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] block_address @@    got resunsigned short [unsigned] block_address @@
drivers/memstick/core/ms_block.c:1039:47: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] block_address @@    got resunsigned short [unsigned] block_address @@
drivers/memstick/core/ms_block.c:1043:54: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] logical_address @@    got resunsigned short [unsigned] logical_address @@
drivers/memstick/core/ms_block.c:1166:30: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1166:30: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1166:30: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1166:30: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1167:37: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1167:37: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1167:37: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1167:37: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1169:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1169:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1169:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1169:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1169:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1169:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1171:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1171:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1171:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1171:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1171:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1171:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1173:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1173:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1173:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1173:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1173:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1173:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1175:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1175:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1175:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1175:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1175:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1175:19: sparse: cast to restricted __be32
drivers/memstick/core/ms_block.c:1176:30: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1176:30: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1176:30: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1176:30: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1177:36: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1177:36: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1177:36: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1177:36: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1179:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1179:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1179:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1179:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1180:29: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1180:29: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1180:29: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1180:29: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1182:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1182:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1182:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1182:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1183:38: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1183:38: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1183:38: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1183:38: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1185:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1185:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1185:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1185:19: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1186:37: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1186:37: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1186:37: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1186:37: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1187:39: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1187:39: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1187:39: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1187:39: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1228:21: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1228:21: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1228:21: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1228:21: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1309:33: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1309:33: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1309:33: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1309:33: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1411:23: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1411:23: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1411:23: sparse: cast to restricted __be16
drivers/memstick/core/ms_block.c:1411:23: sparse: cast to restricted __be16
ipc/shm.c:819:9: sparse: context imbalance in 'shmctl_down' - different lock contexts for basic block
ipc/shm.c:1186:9: sparse: context imbalance in 'do_shmat' - different lock contexts for basic block
fs/ext4/extents.c:537:34: sparse: Using plain integer as NULL pointer
drivers/scsi/scsi-mq.c:17:8: sparse: symbol 'ipi_cq' was not declared. Should it be static?
drivers/scsi/scsi-mq.c:114:6: sparse: symbol 'scsi_mq_end_io' was not declared. Should it be static?
drivers/scsi/scsi-mq.c:129:6: sparse: symbol 'scsi_mq_end_ipi' was not declared. Should it be static?
drivers/scsi/scsi-mq.c:172:6: sparse: symbol 'scsi_mq_free_sc_map' was not declared. Should it be static?
drivers/scsi/scsi-mq.c:295:6: sparse: symbol 'scsi_mq_exit' was not declared. Should it be static?
drivers/scsi/virtio_scsi.c:688:2: sparse: FIXME: Need to pass nr_hw_queues into scsi-mq
kernel/printk/printk.c:215:1: sparse: symbol 'log_wait' was not declared. Should it be static?
kernel/printk/printk.c:1254:1: sparse: symbol 'SyS_syslog' was not declared. Should it be static?
fs/dcache.c:518:13: sparse: undefined identifier 'lockref_put_or_lock'
lib/spinlock_refcount.c:143:20: sparse: no member 'lock_count' in struct lockref

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
