From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 05 Jul 2018 06:59:36 +0000
Subject: Re: [PATCH -next v3] mtd: spinand: fix missing unlock on error
Message-Id: <20180705085936.38f6c374@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530696061-76467-1-git-send-email-weiyongjun1@huawei.com>
 <1530696627-84879-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1530696627-84879-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Wei,

Wei Yongjun <weiyongjun1@huawei.com> wrote on Wed, 4 Jul 2018 09:30:27
+0000:

> Add the missing unlock before return from function
> spinand_mtd_(read|write) in the error handling case.
>=20
> Fixes: c898e0526fb6 ("mtd: nand: Add core infrastructure to support SPI N=
ANDs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Thanks for the two fixes over the spinand work. As this code is not
yet upstream, do you mind if I fold those fixes directly with the
initial patch?

Thanks,
Miqu=C3=A8l
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
