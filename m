From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Fri, 12 Oct 2012 17:36:25 +0000
Subject: Re: [signal:for-next 79/81] init/main.c:794:2: error: implicit declaration of function 'current_pt_r
Message-Id: <20121012173625.GI2616@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121012164020.GC19120@localhost>
In-Reply-To: <20121012164020.GC19120@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Oct 13, 2012 at 12:40:20AM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git for-next
> head:   4fa20776ca79059c34f4660c8bdb0d7c1603e872
> commit: f45a47e7f1d9668458ecd1e88b285c6348c5aa3e [79/81] x86, um: convert to saner kernel_execve() semantics
> config: um-defconfig # make ARCH=um defconfig
> 
> All error/warnings:
> 
> init/main.c: In function 'run_init_process':
> init/main.c:794:2: error: implicit declaration of function 'current_pt_regs' [-Werror=implicit-function-declaration]
> init/main.c:794:2: warning: passing argument 4 of 'do_execve' makes pointer from integer without a cast [enabled by default]
> In file included from include/linux/pid_namespace.h:4:0,
>                  from include/linux/perf_event.h:604,
>                  from include/linux/ftrace_event.h:8,
>                  from include/trace/syscall.h:6,
>                  from include/linux/syscalls.h:78,
>                  from init/main.c:16:
> include/linux/sched.h:2323:12: note: expected 'struct pt_regs *' but argument is of type 'int'
> cc1: some warnings being treated as errors
> --
> kernel/kmod.c: In function '____call_usermodehelper':
> kernel/kmod.c:221:2: error: implicit declaration of function 'current_pt_regs' [-Werror=implicit-function-declaration]
> kernel/kmod.c:221:2: warning: passing argument 4 of 'do_execve' makes pointer from integer without a cast [enabled by default]
> In file included from kernel/kmod.c:22:0:
> include/linux/sched.h:2323:12: note: expected 'struct pt_regs *' but argument is of type 'int'
> cc1: some warnings being treated as errors

Hmm... missing include, pulled indirectly by _very_ torturous ways on the
builds I've done.  I think the sanest way to handle that is explicit
include of ptrace.h in init/main.c, kernel/kmod.c and kernel/kthread.c.
The funny part is, full linux-next will build just fine, thanks to
changes in the current mainline.  Still, that's a bisection hazard we don't
need...  Fixed and pushed.
