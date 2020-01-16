From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 16 Jan 2020 23:36:23 +0000
Subject: Re: [PATCH -next] mtd: ubi: wl: remove set but not used variable 'prev_e'
Message-Id: <CAFLxGvyqyhCa7gvhRHT6oNML0+XJ-Fyexf4xK=bm7bViusuGFg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191127062002.23746-1-yuehaibing@huawei.com>
In-Reply-To: <20191127062002.23746-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>

On Wed, Nov 27, 2019 at 7:22 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/mtd/ubi/wl.c: In function 'find_wl_entry':
> drivers/mtd/ubi/wl.c:322:27: warning:
>  variable 'prev_e' set but not used [-Wunused-but-set-variable]
>
> It's not used any more now, so remove it.
>
> Fixes: f9c34bb52997 ("ubi: Fix producing anchor PEBs")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/mtd/ubi/wl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied. Thanks!

-- 
Thanks,
//richard
