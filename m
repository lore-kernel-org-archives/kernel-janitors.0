From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 20 Aug 2013 18:43:59 +0000
Subject: build regressions 2013-08-20
Message-Id: <5213b8ef.cXnVLGv3MXELlsWF%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/staging/apf/xlnk.c:1072:3: error: implicit declaration of function 'dmac_map_area' [-Werror=implicit-function-declaration]
drivers/staging/apf/xlnk.c:1073:3: error: implicit declaration of function 'outer_clean_range' [-Werror=implicit-function-declaration]
drivers/staging/apf/xlnk.c:1077:3: error: implicit declaration of function 'outer_inv_range' [-Werror=implicit-function-declaration]
drivers/staging/apf/xlnk.c:1079:3: error: implicit declaration of function 'dmac_unmap_area' [-Werror=implicit-function-declaration]
ERROR: "copy_from_user_page" undefined!
arch/powerpc/platforms/cell/spufs/inode.c:623:16: error: incompatible types when assigning to type 'kuid_t' from type 'int'
arch/powerpc/platforms/cell/spufs/inode.c:628:16: error: incompatible types when assigning to type 'kgid_t' from type 'int'
arch/s390/pci/pci.c:154:2: error: implicit declaration of function 'airq_iv_end' [-Werror=implicit-function-declaration]
arch/s390/pci/pci.c:155:40: error: dereferencing pointer to incomplete type
arch/s390/pci/pci.c:157:42: error: dereferencing pointer to incomplete type
arch/s390/pci/pci.c:394:3: error: implicit declaration of function 'airq_iv_scan' [-Werror=implicit-function-declaration]
arch/s390/pci/pci.c:412:4: error: implicit declaration of function 'airq_iv_lock' [-Werror=implicit-function-declaration]
arch/s390/pci/pci.c:415:4: error: implicit declaration of function 'airq_iv_unlock' [-Werror=implicit-function-declaration]
arch/s390/pci/pci.c:472:2: error: implicit declaration of function 'airq_iv_alloc_bit' [-Werror=implicit-function-declaration]
arch/s390/pci/pci.c:479:2: error: implicit declaration of function 'airq_iv_create' [-Werror=implicit-function-declaration]
arch/s390/pci/pci.c:479:40: error: 'AIRQ_IV_BITLOCK' undeclared (first use in this function)
arch/s390/pci/pci.c:521:2: error: implicit declaration of function 'airq_iv_release' [-Werror=implicit-function-declaration]
arch/s390/pci/pci.c:523:2: error: implicit declaration of function 'airq_iv_free_bit' [-Werror=implicit-function-declaration]
arch/s390/pci/pci.c:694:49: error: 'AIRQ_IV_ALLOC' undeclared (first use in this function)
arch/s390/pci/pci.c:422:4: error: implicit declaration of function 'airq_iv_get_data' [-Werror=implicit-function-declaration]
arch/s390/pci/pci.c:452:40: error: 'AIRQ_IV_DATA' undeclared (first use in this function)
arch/s390/pci/pci.c:475:3: error: implicit declaration of function 'airq_iv_set_data' [-Werror=implicit-function-declaration]
drivers/i2c/i2c-core.c:1163:2: error: implicit declaration of function 'of_i2c_register_devices' [-Werror=implicit-function-declaration]
xt_TPROXY.c:(.text+0x54357): undefined reference to `udp6_lib_lookup'
xt_TPROXY.c:(.text+0x548a1): undefined reference to `udp6_lib_lookup'
xt_TPROXY.c:(.text+0x549d2): undefined reference to `udp6_lib_lookup'

[warnings]
drivers/staging/apf/xlnk.c:774:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/staging/apf/xlnk.c:113:12: warning: 'xlnk_dump_events' used but never defined [enabled by default]
drivers/staging/apf/xlnk.c:114:12: warning: 'xlnk_get_event_size' used but never defined [enabled by default]
drivers/staging/apf/xlnk.c:838:14: warning: ignoring return value of 'copy_to_user', declared with attribute warn_unused_result [-Wunused-result]
drivers/staging/apf/xlnk.c:883:15: warning: ignoring return value of 'copy_to_user', declared with attribute warn_unused_result [-Wunused-result]
drivers/staging/apf/xlnk.c:915:15: warning: ignoring return value of 'copy_to_user', declared with attribute warn_unused_result [-Wunused-result]
drivers/staging/apf/xilinx-dma-apf.c:569:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/staging/apf/xilinx-dma-apf.c:602:3: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'dma_addr_t' [-Wformat=]
drivers/staging/apf/xilinx-dma-apf.c:619:4: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'dma_addr_t' [-Wformat=]
drivers/staging/apf/xilinx-dma-apf.c:631:3: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'dma_addr_t' [-Wformat=]
drivers/staging/apf/xilinx-dma-apf.c:1171:3: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'dma_addr_t' [-Wformat=]
drivers/md/dm-thin.c:2658:6: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/md/dm-thin.c:2658:6: warning: right shift count >= width of type [enabled by default]
drivers/md/dm-thin.c:2658:6: warning: passing argument 1 of '__div64_32' from incompatible pointer type [enabled by default]
drivers/md/dm-cache-target.c:2622:6: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/md/dm-cache-target.c:2622:6: warning: right shift count >= width of type [enabled by default]
drivers/md/dm-cache-target.c:2622:6: warning: passing argument 1 of '__div64_32' from incompatible pointer type [enabled by default]
warning: (SND_SOC_SH4_SIU && XILINX_DMA_APF) selects DMA_ENGINE which has unmet direct dependencies (DMADEVICES)
warning: (SND_SOC_SH4_SIU && XILINX_DMA_APF) selects DMA_ENGINE which has unmet direct dependencies (DMADEVICES)
warning: (SND_SOC_SH4_SIU && XILINX_DMA_APF) selects DMA_ENGINE which has unmet direct dependencies (DMADEVICES)
drivers/staging/apf/xilinx-dma-apf.c:210:14: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/apf/xilinx-dma-apf.c:1119:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

[sparse]
fs/pstore/platform.c:166:5: sparse: symbol 'pstore_decompress' was not declared. Should it be static?
drivers/staging/apf/xilinx-dma-apf.c:1098:9: sparse: cast removes address space of expression
drivers/staging/apf/xilinx-dma-apf.c:1120:35: sparse: cast removes address space of expression
drivers/staging/apf/xilinx-dma-apf.c:66:22: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:67:22: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:72:20: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:77:13: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:82:13: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:89:13: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:94:27: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:127:15: sparse: memset with byte count of 131072
drivers/staging/apf/xilinx-dma-apf.c:280:28: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:283:58: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:296:20: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:304:13: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:309:43: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:310:43: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:331:20: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:339:13: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:344:43: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:345:43: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:385:21: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:390:13: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:395:13: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:399:13: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:1015:28: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:1016:27: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:1030:19: sparse: dereference of noderef expression
drivers/staging/apf/xilinx-dma-apf.c:1036:13: sparse: dereference of noderef expression
drivers/staging/apf/xlnk.c:735:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got oid const [noderef] <asn:1>*from @@
drivers/staging/apf/xlnk.c:747:9: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:1>*<noident> @@    got uvoid const volatile [noderef] <asn:1>*<noident> @@
drivers/staging/apf/xlnk.c:748:9: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:1>*<noident> @@    got uvoid const volatile [noderef] <asn:1>*<noident> @@
drivers/staging/apf/xlnk.c:796:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got oid const [noderef] <asn:1>*from @@
drivers/staging/apf/xlnk.c:816:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got oid const [noderef] <asn:1>*from @@
drivers/staging/apf/xlnk.c:838:23: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:1>*dst @@    got sn:1>*dst @@
drivers/staging/apf/xlnk.c:859:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got oid const [noderef] <asn:1>*from @@
drivers/staging/apf/xlnk.c:883:31: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:1>*dst @@    got sn:1>*dst @@
drivers/staging/apf/xlnk.c:902:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got oid const [noderef] <asn:1>*from @@
drivers/staging/apf/xlnk.c:915:31: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:1>*dst @@    got sn:1>*dst @@
drivers/staging/apf/xlnk.c:932:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got oid const [noderef] <asn:1>*from @@
drivers/staging/apf/xlnk.c:952:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got oid const [noderef] <asn:1>*from @@
drivers/staging/apf/xlnk.c:975:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got oid const [noderef] <asn:1>*from @@
drivers/staging/apf/xlnk.c:1008:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got oid const [noderef] <asn:1>*from @@
drivers/staging/apf/xlnk.c:1033:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got oid const [noderef] <asn:1>*from @@
drivers/staging/apf/xlnk.c:1051:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got oid const [noderef] <asn:1>*from @@
drivers/staging/apf/xlnk.c:1050:17: sparse: undefined identifier 'dmac_map_area'
drivers/staging/apf/xlnk.c:1051:17: sparse: undefined identifier 'outer_clean_range'
drivers/staging/apf/xlnk.c:1055:17: sparse: undefined identifier 'outer_inv_range'
drivers/staging/apf/xlnk.c:1057:17: sparse: undefined identifier 'dmac_unmap_area'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
