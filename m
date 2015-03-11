From: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 11 Mar 2015 23:46:30 +0000
Subject: Re: [PATCH 0/7] mtd: various fixes caught by Coverity
Message-Id: <20150311234630.GF32500@ld-irv-0074>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>, Masahiro Yamada <yamada.m@jp.panasonic.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Jarzmik <robert.jarzmik@free.fr>

On Sat, Feb 28, 2015 at 02:02:23AM -0800, Brian Norris wrote:
> Several unrelated MTD fixes inspired by Coverity Scan results. I couldn't test
> all of them, but they're all pretty obvious.
> 
> Brian Norris (7):
>   mtd: docg3: drop dead code
>   mtd: onenand: drop dead code
>   mtd: tests: fix more potential integer overflows
>   mtd: nand: fixup bounds checks for nand_{lock,unlock}()
>   mtd: nand: denali: drop dead code
>   mtd: blkdevs: remove dead code
>   mtd: nand: fully initialize mtd_oob_ops

Pushed to l2-mtd.git, with v2 of patch 1.

Brian
