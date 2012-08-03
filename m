From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Fri, 03 Aug 2012 10:31:09 +0000
Subject: Re: [signal:execve2 2/11] usr/include/linux/binfmts.h:5: included file 'asm-x86/exec.h' is not expor
Message-Id: <20120803103109.GE23464@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 03, 2012 at 06:20:41PM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> Kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git execve2
> head:   760c0f5513e79608f9316997cecf6fcf42f7c386
> commit: 8c1fa890710d4b7d52cbdab27b2a9231aad012eb [2/11] the only place that needs to include asm/exec.h is linux/binfmts.h
> config: x86_64-allmodconfig (attached as .config)
> 
> All errors/warnings:
> 
> usr/include/linux/binfmts.h:5: included file 'asm-x86/exec.h' is not exported
> usr/include/linux/binfmts.h:5: included file 'asm-x86/exec.h' is not exported
> usr/include/linux/kexec.h:49: userspace cannot reference function or variable defined in the kernel
> usr/include/linux/soundcard.h:1054: userspace cannot reference function or variable defined in the kernel
> usr/include/linux/string.h:8: userspace cannot reference function or variable defined in the kernel

IOW, we need to take that include below #ifdef __KERNEL__

Done...
