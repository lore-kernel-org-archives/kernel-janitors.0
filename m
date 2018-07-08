From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 08 Jul 2018 21:49:39 +0000
Subject: Re: [PATCH -next] mtd: spinand: Fix error return code in spinand_init()
Message-Id: <20180708234939.6beb9a0d@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530693298-14271-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1530693298-14271-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Peter Pan <peterpandong@micron.com>, Frieder Schrempf <frieder.schrempf@exceet.de>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Wei,

Wei Yongjun <weiyongjun1@huawei.com> wrote on Wed, 4 Jul 2018 08:34:58
+0000:

> Fix to return error code -ENOMEM from the kzalloc() error handling
> case instead of 0, as done elsewhere in this function.
>=20
> Fixes: c898e0526fb6 ("mtd: nand: Add core infrastructure to support SPI N=
ANDs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mtd/nand/spi/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)


Merged with the original commit.

Thanks,
Miqu=C3=A8l
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
