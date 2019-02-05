From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 05 Feb 2019 19:05:22 +0000
Subject: Re: [PATCH][next] mtd: rawnand: meson:: make several functions static
Message-Id: <20190205200522.7e2748bb@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190129124429.19829-1-colin.king@canonical.com>
In-Reply-To: <20190129124429.19829-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Liang Yang <liang.yang@amlogic.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org

Hi Colin,

Colin King <colin.king@canonical.com> wrote on Tue, 29 Jan 2019
12:44:29 +0000:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> There are several functions that are local to the source and do
> not need to be in global scope, so make them static.
>=20
> Cleans up sparse warnings.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Merged in nand/next with the original commit.


Thanks,
Miqu=C3=A8l
