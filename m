From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Fri, 03 Aug 2012 09:00:44 +0000
Subject: Re: [signal:execve2 9/9] fs/exec.c:2358:2: error: implicit declaration of function 'ret_from_kernel_
Message-Id: <20120803090044.GB23464@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120803024422.GA9019@localhost>
In-Reply-To: <20120803024422.GA9019@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 03, 2012 at 10:44:22AM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> Kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git execve2
> head:   1ade99215ed3c334a544b9e1773602ff0f0251ab
> commit: 1ade99215ed3c334a544b9e1773602ff0f0251ab [9/9] x86: switch to generic sys_execve and kernel_execve
> config: um-defconfig (attached as .config)
> 
> All related error/warning messages:
> 
> fs/exec.c: In function 'kernel_execve':
> fs/exec.c:2358:2: error: implicit declaration of function 'ret_from_kernel_execve' [-Werror=implicit-function-declaration]
> fs/exec.c:2359:1: warning: control reaches end of non-void function [-Wreturn-type]
> cc1: some warnings being treated as errors

Hopefully sorted out by taking that declaration to binfmts.h (under the obvious ifdef).
