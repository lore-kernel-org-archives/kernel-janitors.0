From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 18 Jul 2013 23:23:15 +0000
Subject: build regressions 2013-07-18
Message-Id: <51e878e3.gJ6hzPeKkiAWBEfZ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
block/blk-mq.c:273:4: error: implicit declaration of function '__smp_call_function_single' [-Werror=implicit-function-declaration]
az6027.c:(.text+0x2a5e7e): undefined reference to `stb0899_attach'
cxusb.c:(.text+0x1defff): undefined reference to `dib7000p_get_i2c_master'
cxusb.c:(.text+0x1df0f2): undefined reference to `dib7000p_set_wbd_ref'
cxusb.c:(.text+0x1df119): undefined reference to `dib7000p_set_gpio'
cxusb.c:(.text+0x1df9b0): undefined reference to `dib7000p_i2c_enumeration'
drivers/block/null_blk.c:255:3: error: implicit declaration of function '__smp_call_function_single' [-Werror=implicit-function-declaration]
security/integrity/ima/ima_init.c:102:2: error: implicit declaration of function 'ima_init_template' [-Werror=implicit-function-declaration]
security/integrity/ima/ima_template.c:94:3: error: implicit declaration of function 'template_desc_init_fields' [-Werror=implicit-function-declaration]

[warnings]
block/blk-mq.c:317: warning: 'ipi_end_io' defined but not used
Warning(mm/filemap.c:1421): No description found for parameter 'iter'
Warning(mm/filemap.c:1421): Excess function parameter 'iov_iter' description in 'generic_file_read_iter'

[sparse]
block/blk-mq.c:30:16: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got  [noderef] <asn:3>*__vpp_verify @@
block/blk-mq.c:1095:44: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got  [noderef] <asn:3>*__vpp_verify @@
block/blk-mq.c:1140:13: sparse: incorrect type in assignment (different address spaces) @@    expected struct blk_mq_ctx *ctx @@    got struct blk_mq_ctxstruct blk_mq_ctx *ctx @@
block/blk-mq.c:1191:9: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got  [noderef] <asn:3>*__vpp_verify @@
block/blk-mq.c:1191:9: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got  [noderef] <asn:3>*__vpp_verify @@
block/blk-mq.c:1234:22: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:3>*__pdata @@    got  [noderef] <asn:3>*__pdata @@
drivers/block/null_blk.c:56:8: sparse: symbol 'completion_queues' was not declared. Should it be static?
drivers/block/null_blk.c:353:22: sparse: symbol 'null_queue_map_per_node' was not declared. Should it be static?
drivers/block/null_blk.c:320:17: sparse: context imbalance in 'null_request_fn' - unexpected unlock
block/blk-flush.c:276:9: sparse: context imbalance in 'flush_end_io' - different lock contexts for basic block
block/blk-mq.c:123:6: sparse: symbol 'blk_mq_freeze_queue' was not declared. Should it be static?
block/blk-mq.c:149:6: sparse: symbol 'blk_mq_unfreeze_queue' was not declared. Should it be static?
drivers/gpu/drm/radeon/radeon_drv.c:170:5: sparse: symbol 'radeon_aspm' was not declared. Should it be static?
drivers/gpu/drm/radeon/rs780_dpm.c:966:6: sparse: symbol 'rs780_dpm_debugfs_print_current_performance_level' was not declared. Should it be static?

[coccinelle]
security/integrity/ima/ima_template.c:62:41-47: ERROR: application of sizeof to pointer

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
