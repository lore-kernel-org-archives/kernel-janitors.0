From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Fri, 03 Aug 2012 08:53:49 +0000
Subject: Re: [signal:execve2 6/9] fs/exec.c:2332:39: error: called object '__current_thread_info' is not a fu
Message-Id: <20120803085349.GA23464@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120803070707.GA11844@localhost>
In-Reply-To: <20120803070707.GA11844@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 03, 2012 at 03:07:07PM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> Kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git execve2
> head:   1ade99215ed3c334a544b9e1773602ff0f0251ab
> commit: 803042af6f2aa1e925f3047443a4396f6de3d6f7 [6/9] alpha: optimized current_pt_regs()
> config: alpha-defconfig (attached as .config)

dumb braino, fixed (alpha has current_thread_info() #defined as
__current_thread_info, which is a global register variable;
I've managed to write __current_thread_info()->....)
