From: Jonathan Austin <jonathan.austin@arm.com>
Date: Mon, 01 Oct 2012 16:20:11 +0000
Subject: Re: [arm-perf:delay 3/3] ERROR: "read_current_timer" [fs/ext4/ext4.ko] undefined!
Message-Id: <5069C2BB.4000207@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121001114030.GB16393@localhost>
In-Reply-To: <20121001114030.GB16393@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

Thanks for the report,

On 01/10/12 12:40, Fengguang Wu wrote:

> Hi Jonathan,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git delay
> head:   d9ed51a6b84c5724fd047a4715449356fffca83f
> commit: d9ed51a6b84c5724fd047a4715449356fffca83f [3/3] ARM: delay: add registration mechanism for delay timer sources
> config: arm-s3c2410_defconfig
> 
> All error/warnings:
> 
> ERROR: "read_current_timer" [fs/ext4/ext4.ko] undefined!

I've fixed this and sent a patch (included below) to Will for his delay branch,

Jonny

-------8<---------

From: Jonathan Austin <jonathan.austin@arm.com>
Date: Mon, 1 Oct 2012 16:48:59 +0100
Subject: [PATCH] ARM: delay: export read_current_timer to fix get_cycles

On ARM, get_cycles() is implemented in terms of read_current_timer(), but
the latter is not exported to modules, resulting in failure to link:

  ERROR: "read_current_timer" [fs/ext4/ext4.ko] undefined!

This patch exports the symbol as required.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Jonathan Austin <jonathan.austin@arm.com>
---
 arch/arm/kernel/armksyms.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/kernel/armksyms.c b/arch/arm/kernel/armksyms.c
index 60d3b73..6a37f8d 100644
--- a/arch/arm/kernel/armksyms.c
+++ b/arch/arm/kernel/armksyms.c
@@ -50,6 +50,7 @@ extern void fpundefinstr(void);
 
        /* platform dependent support */
 EXPORT_SYMBOL(arm_delay_ops);
+EXPORT_SYMBOL(read_current_timer);
 
        /* networking */
 EXPORT_SYMBOL(csum_partial);
-- 
1.7.1



