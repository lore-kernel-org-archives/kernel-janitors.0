From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 30 Nov 2017 15:35:57 +0000
Subject: Re: [bug report] x86/unwinder/orc: Don't bail on stack overflow
Message-Id: <CALCETrW+QyxV_wWD_X9+bodTCmCp1CGNHt4NdisB_KEBL6Hxpg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171130073321.dlpgmiwrxa33xw7k@mwanda>
In-Reply-To: <20171130073321.dlpgmiwrxa33xw7k@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 29, 2017 at 11:33 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> Hello Andy Lutomirski,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch 5bfc3af43208: "x86/unwinder/orc: Don't bail on stack
> overflow" from Nov 26, 2017, leads to the following Smatch complaint:
>
>     arch/x86/kernel/unwind_orc.c:539 __unwind_start()
>      error: we previously assumed 'regs' could be null (see line 505)

Hi Ingo, Thomas-

Since I think you're still trying to maintain a clean patch series,
can you fix the obvious bug in your tree?  The line:

+               void *next_page = (void *)PAGE_ALIGN((unsigned long)regs->sp);

Should be:

+               void *next_page = (void *)PAGE_ALIGN((unsigned long)state->sp);

Thanks,
Andy

>
> arch/x86/kernel/unwind_orc.c
>    504
>    505          if (regs) {
>                     ^^^^
> Here the old code assumed "regs" could be NULL.
>
>    506                  if (user_mode(regs))
>    507                          goto done;
>    508
>    509                  state->ip = regs->ip;
>    510                  state->sp = kernel_stack_pointer(regs);
>    511                  state->bp = regs->bp;
>    512                  state->regs = regs;
>    513                  state->full_regs = true;
>    514                  state->signal = true;
>    515
>    516          } else if (task = current) {
>    517                  asm volatile("lea (%%rip), %0\n\t"
>    518                               "mov %%rsp, %1\n\t"
>    519                               "mov %%rbp, %2\n\t"
>    520                               : "=r" (state->ip), "=r" (state->sp),
>    521                                 "=r" (state->bp));
>    522
>    523          } else {
>    524                  struct inactive_task_frame *frame = (void *)task->thread.sp;
>    525
>    526                  state->sp = task->thread.sp;
>    527                  state->bp = READ_ONCE_NOCHECK(frame->bp);
>    528                  state->ip = READ_ONCE_NOCHECK(frame->ret_addr);
>    529          }
>    530
>    531          if (get_stack_info((unsigned long *)state->sp, state->task,
>    532                             &state->stack_info, &state->stack_mask)) {
>
> Possibly get_stack_info() implies that regs is non-NULL?
>
>    533                  /*
>    534                   * We weren't on a valid stack.  It's possible that
>    535                   * we overflowed a valid stack into a guard page.
>    536                   * See if the next page up is valid so that we can
>    537                   * generate some kind of backtrace if this happens.
>    538                   */
>    539                  void *next_page = (void *)PAGE_ALIGN((unsigned long)regs->sp);
>                                                                             ^^^^^^^^
> Unchecked dereference.
>
>    540                  if (get_stack_info(next_page, state->task, &state->stack_info,
>    541                                     &state->stack_mask))
>
> regards,
> dan carpenter
