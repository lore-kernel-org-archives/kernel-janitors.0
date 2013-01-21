From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 21 Jan 2013 03:37:15 +0000
Subject: build regressions 2013-01-20
Message-Id: <50fcb7eb.2zJqzM4uzqV1Mwp6%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[warnings]
arch/x86/crypto/crc32-pclmul_asm.S:87:2: warning: #warning Using 32bit code support [-Wcpp]

[smatch]
drivers/gpu/drm/nouveau/nv50_display.c:419 evo_wait() warn: inconsistent returns mutex:&dmac->lock: locked (419) unlocked (413)
drivers/gpu/drm/i915/intel_display.c:6776 intel_get_load_detect_pipe() warn: inconsistent returns mutex:&crtc->mutex: locked (6712,6776) unlocked (6731,6763,6771)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
