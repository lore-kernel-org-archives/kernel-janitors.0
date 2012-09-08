From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 08 Sep 2012 14:54:49 +0000
Subject: Re: [signal:master 62/63] arch/m68k/kernel/entry.S:115: Error: operands mismatch -- statement `movem
Message-Id: <20120908145449.GI13973@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120908135733.GA25549@localhost>
In-Reply-To: <20120908135733.GA25549@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 08, 2012 at 09:57:33PM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
> head:   aad206fddcb7642e6777b1b992645299b7557ded
> commit: 28ba6e34ce54cb7ce2e509369a6f9c47c13083d9 [62/63] m68k: switch to generic sys_execve()/kernel_execve()
> config: m68k-m5475evb_defconfig (attached as .config)
> 
> All related error/warning messages:
> 
> arch/m68k/kernel/entry.S: Assembler messages:
> arch/m68k/kernel/entry.S:115: Error: operands mismatch -- statement `moveml (%sp)+,%d0-%d2' ignored
> arch/m68k/kernel/entry.S:117: Error: operands mismatch -- statement `moveml %d1-%d3,-(%sp)' ignored

On which toolchain?  It had been a valid instruction on all m68k, starting with
68000.  Is that as(1) insisting on %sp@+ form instead of (%sp)+?  But we have
both kinds used in arch/m68k, so if some toolchain version barfs on that, it's
probably rather unhappy elsewhere...
