From: Yinghai Lu <yinghai@kernel.org>
Date: Wed, 10 Oct 2012 15:59:40 +0000
Subject: Re: [yinghai:for-x86-mm 18/19] arch/x86/mm/init.c:346:3: error: implicit declaration of function 'in
Message-Id: <CAE9FiQWZnynnHZLgP4LMf7MKbdrEwhH-Zpx8APydh4TqK1hT=Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 10, 2012 at 6:51 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Yinghai,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/yinghai/linux-yinghai.git for-x86-mm
> head:   ad37a81fa9ed5367bae4edb91c2b9ac6de9e7317
> commit: 0163563e8d24832eeea2101ebcac7da299f43a02 [18/19] x86, mm: setup page table from top-down
> config: x86_64-allyesdebian (attached as .config)
>
> All error/warnings:
>
> arch/x86/mm/init.c: In function 'init_mem_mapping':
> arch/x86/mm/init.c:346:3: error: implicit declaration of function 'init_all_memory_mapping' [-Werror=implicit-function-declaration]
> arch/x86/mm/init.c: At top level:
> arch/x86/mm/init.c:292:123: warning: 'init_range_memory_mapping' defined but not used [-Wunused-function]
> cc1: some warnings being treated as errors

Thanks, I fixed that typo.

Yinghai
