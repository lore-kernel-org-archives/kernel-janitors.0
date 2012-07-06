From: wfg@linux.intel.com
Date: Fri, 06 Jul 2012 17:52:21 +0000
Subject: [tip:perf/core 86/90] arch/x86/kernel/cpu/perf_event.h:377:43: sparse: dubious one-bit signed bitfie
Message-Id: <20120706175221.GA22130@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Peter,

Should we make the bits "unsigned"?

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
head:   6a67943a18c264d5f3df436da38edb3e59adc905
commit: 3e0091e2b6f8cd59e567f247e345a3a6ad1f6e7e [86/90] perf/x86: Save a few bytes in 'struct x86_pmu'

All sparse warnings:

+ arch/x86/kernel/cpu/perf_event.h:377:43: sparse: dubious one-bit signed bitfield
  arch/x86/kernel/cpu/perf_event.h:378:43: sparse: dubious one-bit signed bitfield
  arch/x86/kernel/cpu/perf_event.h:379:43: sparse: dubious one-bit signed bitfield
  arch/x86/kernel/cpu/perf_event.h:380:43: sparse: dubious one-bit signed bitfield
  arch/x86/kernel/cpu/perf_event.h:381:43: sparse: dubious one-bit signed bitfield

vim +377 arch/x86/kernel/cpu/perf_event.h
   374		/*
   375		 * Intel DebugStore bits
   376		 */
 > 377		int		bts		:1,
   378				bts_active	:1,
   379				pebs		:1,
   380				pebs_active	:1,

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
