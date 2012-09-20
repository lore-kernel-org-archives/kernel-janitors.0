From: Kees Cook <keescook@chromium.org>
Date: Thu, 20 Sep 2012 00:15:46 +0000
Subject: Re: [kees:nx-emu 1/2] arch/x86/kernel/traps.c:145:3: warning: passing argument 1 of 'get_gate_vma' f
Message-Id: <CAGXu5jJE8cONaoxSdT5pAgSvCssZWgjoZX8f7vkjJ8Ap1CcwDw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120920001022.GA9337@localhost>
In-Reply-To: <20120920001022.GA9337@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Er, while this is technically Ingo's code, I've been maintaining it in
my tree for a few years now. I wasn't expecting anyone else to be
running live tests on it, though. Are you just building all the trees
on kernel.org?

-Kees

On Wed, Sep 19, 2012 at 5:10 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
>
> Hi Ingo,
>
> FYI, there are new compile warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git nx-emu
> head:   ba8b1415b80d18a464d91cf39a08c5ab60c65b30
> commit: 60e9398e64beabb73af6fb0a15cc0bd52aeedbc6 [1/2] i386: NX emulation
> config: i386-randconfig-b041 (attached as .config)
>
> All error/warnings:
>
> arch/x86/kernel/traps.c: In function 'check_lazy_exec_limit':
> arch/x86/kernel/traps.c:145:3: warning: passing argument 1 of 'get_gate_vma' from incompatible pointer type [enabled by default]
> In file included from arch/x86/kernel/traps.c:34:0:
> include/linux/mm.h:1579:31: note: expected 'struct mm_struct *' but argument is of type 'struct task_struct *'
> --
> mm/util.c: In function '__vma_link_list':
> mm/util.c:243:3: error: implicit declaration of function 'arch_add_exec_range' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> --
> mm/mprotect.c: In function 'mprotect_fixup':
> mm/mprotect.c:156:29: warning: unused variable 'old_end' [-Wunused-variable]
>
> vim +145 arch/x86/kernel/traps.c
>    135          if (current->mm = NULL)
>    136                  return 0;
>    137
>    138          limit = -1UL;
>    139          if (current->mm->context.exec_limit != -1UL) {
>    140                  limit = PAGE_SIZE;
>    141                  spin_lock(&current->mm->page_table_lock);
>    142                  for (vma = current->mm->mmap; vma; vma = vma->vm_next)
>    143                          if ((vma->vm_flags & VM_EXEC) && (vma->vm_end > limit))
>    144                                  limit = vma->vm_end;
>  > 145                  vma = get_gate_vma(current);
>    146                  if (vma && (vma->vm_flags & VM_EXEC) && (vma->vm_end > limit))
>    147                          limit = vma->vm_end;
>    148                  spin_unlock(&current->mm->page_table_lock);
>    149                  if (limit >= TASK_SIZE)
>    150                          limit = -1UL;
>    151                  current->mm->context.exec_limit = limit;
>    152          }
>    153          set_user_cs(&current->mm->context.user_cs, limit);
>    154
>    155          desc1 = &current->mm->context.user_cs;
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu, Yuanhan Liu                              Intel Corporation



-- 
Kees Cook
Chrome OS Security
