From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Tue, 09 Oct 2012 23:45:41 +0000
Subject: Re: [signal:proposed-merge 1/1] fs/exec.c:1712:1: error: expected identifier or '(' before '>>' toke
Message-Id: <20121009234541.GY2616@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121009233733.GE9331@localhost>
In-Reply-To: <20121009233733.GE9331@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 10, 2012 at 07:37:33AM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git proposed-merge
> head:   e7f8028d6cf2f35e3c64f12211e359549b59081f
> commit: e7f8028d6cf2f35e3c64f12211e359549b59081f [1/1] Merge branch 'for-linus' into proposed-merge
> config: x86_64-allyesconfig
> 
> All error/warnings:
> 
> fs/exec.c:1712:1: error: expected identifier or '(' before '>>' token
> 
> vim +1712 fs/exec.c
> 
> 282124d1 Al Viro 2012-09-30  1706  	 * We were successful.  We won't be returning to our caller, but
> 282124d1 Al Viro 2012-09-30  1707  	 * instead to user space by manipulating the kernel stack.
> 282124d1 Al Viro 2012-09-30  1708  	 */
> 282124d1 Al Viro 2012-09-30  1709  	ret_from_kernel_execve(p);
> 282124d1 Al Viro 2012-09-30  1710  }
> 282124d1 Al Viro 2012-09-30  1711  #endif
> e7f8028d Al Viro 2012-10-09 @1712  >>>>>>> for-linus

gyah...  TBH, the only purpose of that thing is to show how merge conflicts
should be resolved.  Probably should've just described it verbally (i.e.
"for everything except arch/um/kernel/exec.c apply both changes, for
arch/um/kernel/exec.c pick the version from my tree as-is; it contains all
commits cherry-picked into uml tree").  Fixed, anyway.  My apologies...
