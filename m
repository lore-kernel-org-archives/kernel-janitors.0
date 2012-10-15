From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Mon, 15 Oct 2012 03:20:04 +0000
Subject: Re: [signal:arch-sh 1/2] (.data+0x1bc): undefined reference to `sys_sh_pipe'
Message-Id: <20121015032004.GE2616@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121015023705.GA15472@localhost>
In-Reply-To: <20121015023705.GA15472@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 15, 2012 at 10:37:05AM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git arch-sh
> head:   c366433956b536324357513f03f1fe6264d8ff98
> commit: 4d2fef5f3f0f7cf0ea1a19f63dc8f6637ce41b5c [1/2] sh: switch to generic kernel_thread()/kernel_execve()
> config: sh-allnoconfig # make ARCH=sh allnoconfig

> arch/sh/kernel/built-in.o: In function `sys_call_table':
> (.data+0x1bc): undefined reference to `sys_sh_pipe'
> arch/sh/kernel/built-in.o: In function `sys_call_table':
> (.data+0x3e4): undefined reference to `sys_pread_wrapper'
> arch/sh/kernel/built-in.o: In function `sys_call_table':
> (.data+0x3e8): undefined reference to `sys_pwrite_wrapper'
> arch/sh/kernel/built-in.o: In function `sys_call_table':
> (.data+0x554): undefined reference to `sys_fadvise64_64_wrapper'

Grr...  That
obj-$(CONFIG_SUPERSH32)          += sys_sh32.o
should've been
obj-$(CONFIG_SUPERH32)          += sys_sh32.o

Fixed and pushed.

