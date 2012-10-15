From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Mon, 15 Oct 2012 03:08:30 +0000
Subject: Re: [signal:arch-blackfin 1/2] arch/blackfin/kernel/process.c:170:7: error: request for member 'pc'
Message-Id: <20121015030830.GC2616@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121015022521.GF7203@localhost>
In-Reply-To: <20121015022521.GF7203@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 15, 2012 at 10:25:21AM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git arch-blackfin
> head:   9b34bed403644c57e9beefc36a0b353255c696f1
> commit: 1ac0bc7b1705368131dc176f4a094994ea45e478 [1/2] blackfin: convert kernel_thread() and kernel_execve() to generic ones
> config: blackfin-BF533-EZKIT_defconfig # make ARCH=blackfin BF533-EZKIT_defconfig

Stray debris, left over from moving kernel_thread() pt_regs initialization
into copy_thread().  That one should've been simply removed.  Done and
pushed...
