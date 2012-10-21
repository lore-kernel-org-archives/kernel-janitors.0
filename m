From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sun, 21 Oct 2012 21:36:45 +0000
Subject: Re: [signal:for-benh 4/4] kernel/fork.c:1537:17: warning: unused variable 'regs'
Message-Id: <20121021213645.GW2616@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 22, 2012 at 05:19:41AM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git for-benh
> head:   db72ef193372fdaf2b607434ae55dc345655ffaa
> commit: db72ef193372fdaf2b607434ae55dc345655ffaa [4/4] don't bother with idle_regs()
> config: x86_64-allyesdebian (attached as .config)
> 
> All warnings:
> 
> kernel/fork.c: In function 'fork_idle':
> kernel/fork.c:1537:17: warning: unused variable 'regs' [-Wunused-variable]

I know; that's just a quick and dirty way to get ppc copy_process() step
on the kernel-thread path for idle threads.  Longer term I want to kill
fork_idle() completely, along with the regs argument for copy_thread().
