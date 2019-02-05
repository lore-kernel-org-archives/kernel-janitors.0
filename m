From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 05 Feb 2019 19:05:45 +0000
Subject: Re: [PATCH][next] mtd: rawnand: meson: fix missing assignment of ret on a call to meson_chip_buffer_
Message-Id: <20190205200545.2952f548@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190129105757.19138-1-colin.king@canonical.com>
In-Reply-To: <20190129105757.19138-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Liang Yang <liang.yang@amlogic.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org

Hi Colin,

Colin King <colin.king@canonical.com> wrote on Tue, 29 Jan 2019
10:57:57 +0000:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> The call to meson_chip_buffer_init is not assigning ret, however, ret
> is being checked for failure. Fix this by adding in the missing assignmen=
t.
>=20
> Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND f=
lash controller")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/nand/raw/meson_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Merged in nand/next with the original commit.


Thanks,
Miqu=C3=A8l
