From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 08 Sep 2012 14:59:45 +0000
Subject: Re: [signal:master 15/63] (.text+0x315d2): undefined reference to `compat_sys_execve'
Message-Id: <20120908145945.GJ13973@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120908123447.GC24182@localhost>
In-Reply-To: <20120908123447.GC24182@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 08, 2012 at 08:34:47PM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
> head:   aad206fddcb7642e6777b1b992645299b7557ded
> commit: 97977a049b19339b1906e1862ed65ad469c01168 [15/63] s390: fold execve_tail() into start_thread(), convert to generic sys_execve()
> config: s390-allmodconfig (attached as .config)
> 
> All related error/warning messages:
> 
> arch/s390/built-in.o: In function `sys32_execve_wrapper':
> (.text+0x315d2): undefined reference to `compat_sys_execve'

Heh...  bisect hazard caused by bug earlier in the series - compat_sys_execve()
in fs/exec.c was put under the wrong ifdef (__ARCH_WANT_KERNEL_EXECVE instead
of s/KERNEL/SYS/), but since we usually add both at the same commit, it
only shows up here, with __ARCH_WANT_KERNEL_EXECVE defined for s390 only
by the next commit.  Trivially fixed, of course
