From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Sep 2012 12:45:39 +0000
Subject: Re: [arm-soc:for-next 71/73] drivers/bus/omap_l3_noc.c:31:17: fatal error: soc.h: No such file or di
Message-Id: <201209201245.39433.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120919233046.GB5607@localhost>
In-Reply-To: <20120919233046.GB5607@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 19 September 2012, Fengguang Wu wrote:
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git for-next
> head:   8ebc8820187f3c499a55a0faab82292c3db6df54
> commit: cf3e885b8b87587b304e905201a50aee09de187e [71/73] Merge branch 'testing/__iomem' into for-next
> config: arm-omap2plus_defconfig
> 
> drivers/bus/omap_l3_noc.c:31:17: fatal error: soc.h: No such file or directory
> 

Thanks a lot for the report, I already found the same problem myself
but didn't have the time to fix it up yesterday. Same for the other
one on omap2plus_defconfig.

	Arnd
