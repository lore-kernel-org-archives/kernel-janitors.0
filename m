From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 03 Oct 2012 14:15:10 +0000
Subject: Re: arch/x86/include/asm/mc146818rtc.h:44:2: error: implicit declaration of function 'this_cpu_read'
Message-Id: <201210031415.11146.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002141200.GA14146@localhost>
In-Reply-To: <20121002141200.GA14146@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 02 October 2012, Fengguang Wu wrote:
> Hi Arnd,
> 
> FYI, kernel build failed on
> 
> commit: 72e2c3166db31bbb25654be3985ea662fa141d8e  warnings in include/linux/mc146818rtc.h
> config: i386-allmodconfig

Thanks for the report. I've looked at the situation again and come up with a better
fix now to replace my original patch:

commit 6f2bcb731779d5709558fa044a4ac67a384102e1
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Oct 3 13:13:27 2012 +0000

    ARM: footbridge: remove RTC_IRQ definition
    
    Since commit bd8abc9a32c "ARM: mc146818rtc: remove unnecessary include of
    mach/irqs.h", building footbridge_defconfig results in this warning:
    
    In file included from include/linux/mc146818rtc.h:16:0,
                     from arch/arm/mach-footbridge/isa-rtc.c:21:
    arch/arm/include/asm/mc146818rtc.h:10:0: warning: "RTC_IRQ" redefined [enabled by default]
    arch/arm/mach-footbridge/include/mach/irqs.h:93:0: note: this is the location of the previous definition
    
    The above commit was intentionally made to catch errors like this,
    where code relies on the RTC_IRQ definition. The only driver using
    it is the legacy PC-style drivers/char/rtc.c driver.
    However, the ARM architecture has been using the RTC_LIB framework
    since at least 2006, and that doesn't use it.
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Cc: Rob Herring <rob.herring@calxeda.com>
    Cc: Alessandro Zummo <a.zummo@towertech.it>
    Cc: rtc-linux@googlegroups.com
    Cc: Russell King <linux@arm.linux.org.uk>

diff --git a/arch/arm/mach-footbridge/include/mach/irqs.h b/arch/arm/mach-footbridge/include/mach/irqs.h
index 400551e..61c714c 100644
--- a/arch/arm/mach-footbridge/include/mach/irqs.h
+++ b/arch/arm/mach-footbridge/include/mach/irqs.h
@@ -89,8 +89,6 @@
 #define IRQ_NETWINDER_VGA	_ISA_IRQ(11)
 #define IRQ_NETWINDER_SOUND	_ISA_IRQ(12)
 
-#undef RTC_IRQ
-#define RTC_IRQ		IRQ_ISA_RTC_ALARM
 #define I8042_KBD_IRQ	IRQ_ISA_KEYBOARD
 #define I8042_AUX_IRQ	(machine_is_netwinder() ? IRQ_NETWINDER_PS2MOUSE : IRQ_ISA_PS2MOUSE)
 #define IRQ_FLOPPYDISK	IRQ_ISA_FLOPPY
