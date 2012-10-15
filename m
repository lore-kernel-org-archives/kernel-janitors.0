From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Oct 2012 13:30:12 +0000
Subject: Re: [arm-soc:testing/defconfig-warnings 14/14] arch/arm/boot/compressed/../../../../lib/decompress_u
Message-Id: <201210151330.12940.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121015021801.GB7203@localhost>
In-Reply-To: <20121015021801.GB7203@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 15 October 2012, Fengguang Wu wrote:
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git testing/defconfig-warnings
> head:   b8848fafef862602bfad86686d6da00dce80b9c6
> commit: b8848fafef862602bfad86686d6da00dce80b9c6 [14/14] Merge branches 'warnings/broken', 'warnings/mtd', 'warnings/missing' and 'warnings/randconfig' into HEAD
> config: arm-imx_v6_v7_defconfig # make ARCH=arm imx_v6_v7_defconfig
> 
> All error/warnings:
> 
> In file included from arch/arm/boot/compressed/decompress.c:43:0:
> arch/arm/boot/compressed/../../../../lib/decompress_unlzo.c:34:39: fatal error: lzo/lzo1x_decompress_safe.c: No such file or directory
> compilation terminated.

Ok, the bug is only present in -next, so I must not apply the fix on mainline.
I believe my fix was included in -next as well, so it should all be good now.

	Arnd
