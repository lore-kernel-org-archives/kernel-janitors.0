From: Kees Cook <keescook@chromium.org>
Date: Sat, 20 Oct 2012 04:49:13 +0000
Subject: Re: [kees:module-fd-syscall 1/4] kernel/module.c:2434:3: warning: passing argument 2 of 'mod_verify_
Message-Id: <CAGXu5j+p1GVZZaPdCVEm5jCux79nJm8_9YmuvXvSY4jh6-tQHg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50821e1d.dEE58tsKTnbtsR5X%fengguang.wu@intel.com>
In-Reply-To: <50821e1d.dEE58tsKTnbtsR5X%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 19, 2012 at 8:44 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Kees,
>
> FYI, there are new compile warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git module-fd-syscall
> head:   3c560638ca92faf6d258a90f2eb49a8d1095840f
> commit: e5596ccd94451baa6cbf4029de06724f5ae32185 [1/4] module: add syscall to load module from fd
> config: x86_64-allmodconfig # make ARCH=x86_64 allmodconfig
>
> All warnings:
>
> kernel/module.c: In function 'module_sig_check':
> kernel/module.c:2434:3: warning: passing argument 2 of 'mod_verify_sig' makes pointer from integer without a cast [enabled by default]
> In file included from kernel/module.c:63:0:
> kernel/module-internal.h:14:12: note: expected 'long unsigned int *' but argument is of type 'long unsigned int'

You're fast! :) Thanks; fixed. I got distracted and didn't finish
testing this afternoon.

-Kees

-- 
Kees Cook
Chrome OS Security
