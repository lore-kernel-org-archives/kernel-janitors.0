From: Olof Johansson <olof@lixom.net>
Date: Fri, 21 Sep 2012 06:01:59 +0000
Subject: Re: [arm-soc:next/soc 45/53] arch/arm/mach-omap2/omap_hwmod_33xx_data.c:20:49: fatal error: linux/pl
Message-Id: <CAOesGMjYYYjdZnfoJjr1==yVGTeJoDJd3hJrTpUPpjM9Hhm+Qw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120921042300.GB26280@localhost>
In-Reply-To: <20120921042300.GB26280@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Thu, Sep 20, 2012 at 9:23 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Kevin,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git next/soc
> head:   3aec092eed5d8d2b19a62b0aeed3acea9471099a
> commit: aa817b2e68af8753bb95777255e22164610342c7 [45/53] ARM: OMAP: AM33xx hwmod: fixup SPI after platform_data move
> config: arm-omap2plus_defconfig
>
> All related error/warning messages:
>
> arch/arm/mach-omap2/omap_hwmod_33xx_data.c:20:49: fatal error: linux/platform_data/spi-omap2-mcspi.h: No such file or directory

Thanks for catching this, I think it's my first notification from your
build service. :-)

This was fixed up later in the branch; we chose not to rebuild it
since it changes too much stable history.


-Olof
