From: Will Deacon <will.deacon@arm.com>
Date: Mon, 15 Oct 2012 14:50:40 +0000
Subject: Re: [arm-perf:cacheflush 3/4] arch/arm/kernel/entry-common.S:105: Error: non-constant expression in
Message-Id: <20121015145040.GG10560@mudshark.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121015131149.GA23400@localhost>
In-Reply-To: <20121015131149.GA23400@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 15, 2012 at 02:11:49PM +0100, Fengguang Wu wrote:
> Hi Will,

Hello,

> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git cacheflush
> head:   e0c396a5e4a3abbe8ac6bc19670f39f8e7b7b399
> commit: 9e0ec2d6f8bc8b274b5471d194a03b7dd10e8832 [3/4] ARM: cacheflush: add new iovec-based cache flushing system call
> config: arm-at91_dt_defconfig # make ARCH=arm at91_dt_defconfig
> 
> All error/warnings:
> 
> arch/arm/kernel/entry-common.S: Assembler messages:
> arch/arm/kernel/entry-common.S:105: Error: non-constant expression in ".if" statement

Thanks, this is due to a mismerge with the uapi stuff. I'll rebuild the
branch and push a new version.

Will
