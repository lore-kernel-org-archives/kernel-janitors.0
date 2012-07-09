From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Date: Mon, 09 Jul 2012 11:52:26 +0000
Subject: Re: [tip:perf/core 86/90] arch/x86/kernel/cpu/perf_event.h:377:43: sparse: dubious one-bit signed bi
Message-Id: <1341834746.3462.45.camel@twins>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120706175221.GA22130@localhost>
In-Reply-To: <20120706175221.GA22130@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 2012-07-07 at 01:52 +0800, wfg@linux.intel.com wrote:
> Hi Peter,
> 
> Should we make the bits "unsigned"?
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
> head:   6a67943a18c264d5f3df436da38edb3e59adc905
> commit: 3e0091e2b6f8cd59e567f247e345a3a6ad1f6e7e [86/90] perf/x86: Save a few bytes in 'struct x86_pmu'
> 
> All sparse warnings:
> 
> + arch/x86/kernel/cpu/perf_event.h:377:43: sparse: dubious one-bit signed bitfield
>   arch/x86/kernel/cpu/perf_event.h:378:43: sparse: dubious one-bit signed bitfield
>   arch/x86/kernel/cpu/perf_event.h:379:43: sparse: dubious one-bit signed bitfield
>   arch/x86/kernel/cpu/perf_event.h:380:43: sparse: dubious one-bit signed bitfield
>   arch/x86/kernel/cpu/perf_event.h:381:43: sparse: dubious one-bit signed bitfield
> 
> vim +377 arch/x86/kernel/cpu/perf_event.h
>    374		/*
>    375		 * Intel DebugStore bits
>    376		 */
>  > 377		int		bts		:1,
>    378				bts_active	:1,
>    379				pebs		:1,
>    380				pebs_active	:1,

Ha! yes I guess so. Thanks!

---
Subject: perf,x86: Make bitfield unsigned
From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Date: Mon Jul 09 13:50:23 CEST 2012

 arch/x86/kernel/cpu/perf_event.h:377:43: sparse: dubious one-bit signed bitfield

Cc: Borislav Petkov <bp@amd64.org>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
---
 arch/x86/kernel/cpu/perf_event.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/x86/kernel/cpu/perf_event.h
+++ b/arch/x86/kernel/cpu/perf_event.h
@@ -374,7 +374,7 @@ struct x86_pmu {
 	/*
 	 * Intel DebugStore bits
 	 */
-	int		bts		:1,
+	unsigned int	bts		:1,
 			bts_active	:1,
 			pebs		:1,
 			pebs_active	:1,

