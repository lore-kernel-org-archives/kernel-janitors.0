From: Dan Carpenter <error27@gmail.com>
Date: Tue, 01 Mar 2011 17:53:30 +0000
Subject: Re: minor bug ?
Message-Id: <20110301175329.GV18043@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110301154301.GS18043@bicker>
In-Reply-To: <20110301154301.GS18043@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 01, 2011 at 06:39:53PM +0100, Nicolas Kaiser wrote:
>  find /usr/src/linux/ -name "*.[ch]"| \
>  xargs egrep "^[[:space:]]*struct [^[:space:])]*;"| \
>  sort|uniq -d
> 
> 
> /usr/src/linux/arch/arm/include/asm/elf.h:struct task_struct;
> /usr/src/linux/arch/microblaze/include/asm/prom.h:struct pci_dev;
> /usr/src/linux/arch/parisc/include/asm/dma-mapping.h:struct parisc_device;
> /usr/src/linux/arch/powerpc/include/asm/prom.h:struct pci_dev;
> /usr/src/linux/arch/s390/include/asm/ccwdev.h:struct ccw1;
> /usr/src/linux/arch/s390/kernel/compat_linux.h:struct old_sigaction32;
> /usr/src/linux/arch/x86/include/asm/io_apic.h:struct io_apic_irq_attr;

I just looked through some of these at random.  For this one
removing either struct io_apic_irq_attr will break the compile.  It
depends on how CONFIG_X86_IO_APIC is configured if it will break *your*
compile or not.

Sending cleanup patches that break the compile makes people really
angry, so be careful.

regards,
dan carpenter

