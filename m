From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 11 Jun 2013 07:46:46 +0000
Subject: build regressions 2013-06-10
Message-Id: <51b6d5e6.0i6EOvupvB9glNsz%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[sparse]
mm/swap_state.c:397:15: sparse: symbol 'swapin_nr_pages' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/copy/fuc/nva3.fuc.h:1:10: sparse: symbol 'nva3_pcopy_data' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/copy/fuc/nva3.fuc.h:186:10: sparse: symbol 'nva3_pcopy_code' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/copy/fuc/nvc0.fuc.h:1:10: sparse: symbol 'nvc0_pcopy_data' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/copy/fuc/nvc0.fuc.h:174:10: sparse: symbol 'nvc0_pcopy_code' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/crypt/fuc/nv98.fuc.h:1:10: sparse: symbol 'nv98_pcrypt_data' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/crypt/fuc/nv98.fuc.h:153:10: sparse: symbol 'nv98_pcrypt_code' was not declared. Should it be static?
mm/mm_init.c:153:5: sparse: symbol 'vm_committed_as_batch' was not declared. Should it be static?
fs/dcache.c:121:8: sparse: symbol 'nr_dentry_unused' was not declared. Should it be static?
lib/clz_ctz.c:16:12: sparse: symbol '__ctzsi2' was not declared. Should it be static?
lib/clz_ctz.c:22:12: sparse: symbol '__clzsi2' was not declared. Should it be static?
lib/clz_ctz.c:44:12: sparse: symbol '__clzdi2' was not declared. Should it be static?
lib/clz_ctz.c:50:12: sparse: symbol '__ctzdi2' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
