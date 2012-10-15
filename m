From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Oct 2012 13:32:10 +0000
Subject: Re: [arm-soc:testing/defconfig-warnings 14/14] arch/arm/boot/compressed/../../../../lib/decompress_u
Message-Id: <201210151332.10568.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121015021801.GB7203@localhost>
In-Reply-To: <20121015021801.GB7203@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 15 October 2012, Arnd Bergmann wrote:
> > 
> > In file included from arch/arm/boot/compressed/decompress.c:43:0:
> > arch/arm/boot/compressed/../../../../lib/decompress_unlzo.c:34:39: fatal error: lzo/lzo1x_decompress_safe.c: No such file or directory
> > compilation terminated.
> 
> Ok, the bug is only present in -next, so I must not apply the fix on mainline.
> I believe my fix was included in -next as well, so it should all be good now.
> 

No, that was wrong. The fix is part of -next now, but the bug is still
present in -rc1. I'll just trust that it will make it into -rc2.

	Arnd
