From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Date: Thu, 26 Jul 2012 13:39:48 +0000
Subject: Re: [s390:for-linus 5/5] arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of fu
Message-Id: <20120726153948.39884318@de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120726102340.GA15269@localhost>
In-Reply-To: <20120726102340.GA15269@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 26 Jul 2012 18:23:40 +0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hi Martin,
> 
> Kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git for-linus
> head:   fb70554e705cb201222a1a7c7b2e94c6522886fa
> commit: fb70554e705cb201222a1a7c7b2e94c6522886fa [5/5] s390/mm: downgrade page table after fork of a 31 bit process
> config: s390-allnoconfig (attached as .config)
> 
> All related error/warning messages:
> 
> In file included from arch/s390/include/asm/elf.h:130:0,
>                  from include/linux/elf.h:7,
>                  from include/linux/module.h:14,
>                  from drivers/s390/cio/airq.c:12:
> arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
> arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors

Hmm, yes. arch_dup_mmap misses a "#ifdef CONFIG_64BIT". I'll fix it. Thanks.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.

