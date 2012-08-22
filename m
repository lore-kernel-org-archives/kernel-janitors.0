From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Aug 2012 17:33:56 +0000
Subject: Re: [arm-soc:testing:defconfig-warnings 46/47] drivers/input/touchscreen/egalax_ts.c:184:2: error: i
Message-Id: <201208221733.56607.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120822164411.GB31413@localhost>
In-Reply-To: <20120822164411.GB31413@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 22 August 2012, Fengguang Wu wrote:
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git testing/defconfig-warnings
> head:   74c41fb6f52268470b4552ca543515be210c71fb
> commit: 3dfcda60868329af1bb3cc867ee7c7ebedef5176 [46/47] input: egalax: use DT to get gpio line
> config: m68k-allmodconfig (attached as .config)
> 
> All related error/warning messages:
> 
> drivers/input/touchscreen/egalax_ts.c: In function 'egalax_ts_probe':
> drivers/input/touchscreen/egalax_ts.c:184:2: error: implicit declaration of function 'of_get_gpio' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> 

Ah, I was missing an #include <of_gpio.h>, fixed now.

Thanks for the report!

	Arnd
