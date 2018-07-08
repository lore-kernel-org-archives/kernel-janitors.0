From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 08 Jul 2018 21:46:47 +0000
Subject: Re: [PATCH] mtd: rawnand: gpmi: remove redundant variable payload_virt
Message-Id: <20180708234647.28137d8c@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180703081214.32754-1-colin.king@canonical.com>
In-Reply-To: <20180703081214.32754-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Han Xu <han.xu@nxp.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

Colin King <colin.king@canonical.com> wrote on Tue,  3 Jul 2018
09:12:14 +0100:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Variable payload_virt is being assigned but is never used hence it is
> redundant and can be removed.
>=20
> Cleans up clang warning:
> warning: variable 'payload_virt' set but not used [-Wunused-but-set-varia=
ble]
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to nand/next.

Thanks,
Miqu=C3=A8l
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
