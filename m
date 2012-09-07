From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Fri, 07 Sep 2012 13:04:22 +0000
Subject: Re: [signal:master 52/57] kernel/signal.c:3119:2: error: implicit declaration of function 'current_u
Message-Id: <20120907130421.GD13973@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120907070813.GB18082@localhost>
In-Reply-To: <20120907070813.GB18082@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 07, 2012 at 03:08:14PM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
> head:   4cc1d72e670ab00f78d9fc529837f7693094bcaf
> commit: 88e560de8dfee50107ef11e4225fe575c5881830 [52/57] blackfin: sigaltstack conversion
> config: blackfin-BF533-EZKIT_defconfig (attached as .config)
> 
> All related error/warning messages:
> 
> kernel/signal.c: In function 'sys_sigaltstack':
> kernel/signal.c:3119:2: error: implicit declaration of function 'current_user_stack_pointer' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors

Bleh...  s/current_user_stack_pointers/current_user_stack_pointer/ in that
commit...  Thanks for catching that braino
