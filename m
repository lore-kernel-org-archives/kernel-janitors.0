From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu, 02 Aug 2012 12:42:47 +0000
Subject: Re: [uml:for-linus-3.6-rc1 9/13] arch/um/kernel/ptrace.c:178:32: warning: ignoring return value of '
Message-Id: <20120802124247.GK6481@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120802033621.GA11442@localhost>
In-Reply-To: <20120802033621.GA11442@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 02, 2012 at 11:36:21AM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> There are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git for-linus-3.6-rc1
> head:   b070989aeb47ccdfe56d95e046bd317baa47f4fa
> commit: 1bfa2317b21750f739b59ab6df2c8efb12875045 [9/13] um: split syscall_trace(), pass pt_regs to it
> config: um-defconfig (attached as .config)
> 
> All error/warnings:
> 
> arch/um/kernel/ptrace.c: In function 'syscall_trace_enter':
> arch/um/kernel/ptrace.c:178:32: warning: ignoring return value of 'tracehook_report_syscall_entry', declared with attribute warn_unused_result [-Wunused-result]
> 
> vim +178 arch/um/kernel/ptrace.c
>    175		if (!test_thread_flag(TIF_SYSCALL_TRACE))
>    176			return;
>    177	
>  > 178		tracehook_report_syscall_entry(regs);
>    179	}

That's OK - it just needs a followup that will propagate the return value to caller
of syscall_trace_enter() (i.e. handle_syscall()) and make it skip the actual
syscall if tracehook_report_syscall_entry() has returned non-zero.  We didn't
have that functionality (= skipping the syscall if tracer resumes the tracee
from the first PTRACE_SYSCALL with PTRACE_CONT/PTRACE_SYSCALL simulating
the delivery of fatal signal), so it's not a regression.  Just the stuff that
hadn't been hooked up yet.
