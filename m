From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 06 Oct 2012 06:10:19 +0000
Subject: Re: arch/arm/mach-at91/setup.c:96:2: error: #endif without #if
Message-Id: <201210060610.19620.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121006025513.GA17498@localhost>
In-Reply-To: <20121006025513.GA17498@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 06 October 2012, Fengguang Wu wrote:
> FYI, kernel build failed on
> 
> commit: 9afdc3db4684b300aca16bffff4a7f108feb3043  Merge branch 'late/fixes' into for-next
> config: arm-at91_dt_defconfig
> 
> All error/warnings:
> 
> arch/arm/mach-at91/setup.c:96:2: error: #endif without #if

Thansk for the report. There is actually a second bug from the same at91 mismerge,
see patch below.

> vim +96 arch/arm/mach-at91/setup.c
> 
> ac09281a (Arnd Bergmann                    2012-04-30  90) static struct map_desc at91_io_desc __initdata __maybe_unused = {
> dca4ba41 (Arnd Bergmann                    2012-09-14  91)      .virtual        = (unsigned long)AT91_VA_BASE_SYS,
> 21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  92)      .pfn            = __phys_to_pfn(AT91_BASE_SYS),
> 21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  93)      .length         = SZ_16K,
> 21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  94)      .type           = MT_DEVICE,
> 21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  95) };
> 2e8e5ad6 (Arnd Bergmann                    2012-04-30 @96) #endif
> 21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  97) 
> 8c3583b6 (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  98) static void __init soc_detect(u32 dbgu_base)
> 21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  99) {

I fixed it already in the for-next branch, but Stephen hasn't built a new kernel since
I uploaded that.

	Arnd

@@ -135,9 +135,7 @@ static int at91_pm_begin(suspend_state_t state)
 static int at91_pm_verify_clocks(void)
 {
        unsigned long scsr;
-#ifdef CONFIG_AT91_PROGRAMMABLE_CLOCKS
        int i;
-#endif
 
        scsr = at91_pmc_read(AT91_PMC_SCSR);
 
