From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 08 Sep 2012 06:47:04 +0000
Subject: Re: [signal:master 8/62] arch/arm/include/asm/ptrace.h:260:35: error: 'THREAD_SIZE' undeclared (firs
Message-Id: <20120908064704.GH13973@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120907235029.GB17069@localhost>
In-Reply-To: <20120907235029.GB17069@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 08, 2012 at 07:50:29AM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
> head:   811a6550c2567601b6ea4799a44732f7dbab4807
> commit: 63840b3cbdf5993b776138111a6b3a0cfb745caa [8/62] arm: optimized current_pt_regs()
> config: arm-allnoconfig (attached as .config)

Ho-hum...  That's solved by turning that sucker into a macro, but allnoconfig
*still* doesn't build - we end up with no CONFIG_CPU_... defined, which
leads to very unhappy build.  Anyway, the mess with undefined symbol had
been fixed in my tree (will push shortly), but allnoconfig is a mess I don't
want to touch right now - too convoluted Kconfig crap for my taste...
