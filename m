From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 06 Oct 2012 02:55:13 +0000
Subject: arch/arm/mach-at91/setup.c:96:2: error: #endif without #if
Message-Id: <20121006025513.GA17498@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Arnd,

FYI, kernel build failed on

commit: 9afdc3db4684b300aca16bffff4a7f108feb3043  Merge branch 'late/fixes' into for-next
config: arm-at91_dt_defconfig

All error/warnings:

arch/arm/mach-at91/setup.c:96:2: error: #endif without #if

vim +96 arch/arm/mach-at91/setup.c

ac09281a (Arnd Bergmann                    2012-04-30  90) static struct map_desc at91_io_desc __initdata __maybe_unused = {
dca4ba41 (Arnd Bergmann                    2012-09-14  91) 	.virtual	= (unsigned long)AT91_VA_BASE_SYS,
21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  92) 	.pfn		= __phys_to_pfn(AT91_BASE_SYS),
21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  93) 	.length		= SZ_16K,
21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  94) 	.type		= MT_DEVICE,
21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  95) };
2e8e5ad6 (Arnd Bergmann                    2012-04-30 @96) #endif
21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  97) 
8c3583b6 (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  98) static void __init soc_detect(u32 dbgu_base)
21d08b9d (Jean-Christophe PLAGNIOL-VILLARD 2011-04-23  99) {

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
