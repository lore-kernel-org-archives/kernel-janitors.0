From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2016 09:56:55 +0000
Subject: Re: [patch 1/3] spi: armada-3700: Signedness bug in probe
Message-Id: <20161216095655.GB8244@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161216082443.GA7031@elgon.mountain>
 <e1c6a534-6b6c-a83f-390f-b65654ff2bcf@free-electrons.com>
In-Reply-To: <e1c6a534-6b6c-a83f-390f-b65654ff2bcf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Romain Perier <romain.perier@free-electrons.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 16, 2016 at 10:36:29AM +0100, Romain Perier wrote:
> Hello,
>=20
> Le 16/12/2016 =E0 10:33, Dan Carpenter a =E9crit :
> >We need "irq" to be an int because platform_get_irq() returns negative
> >error codes.
> >
> >Fixes: 5762ab71eb24 ("spi: Add support for Armada 3700 SPI Controller")
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> >diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700=
.c
> >index e89da0af45d2..5c7508dc6f0b 100644
> >--- a/drivers/spi/spi-armada-3700.c
> >+++ b/drivers/spi/spi-armada-3700.c
> >@@ -108,7 +108,7 @@ struct a3700_spi {
> > 	struct spi_master *master;
> > 	void __iomem *base;
> > 	struct clk *clk;
> >-	unsigned int irq;
> >+	int irq;
> > 	unsigned int flags;
> > 	bool xmit_data;
> > 	const u8 *tx_buf;
> >
>=20
> It is already fixed, see https://git.kernel.org/cgit/linux/kernel/git/nex=
t/linux-next.git/commit/?id=F6f0083cca66e673cca6fa26b52b107b5570081d
>=20

Ah good.

> And no we cannot just replace the type of the irq field like this
> because devm_request_irq/request_irq require an unsigned int as
> "irq" parameter.

That's immaterial, my patch works fine.  There are other place that use
a signed IRQ like the irq handler and platform_get_irq() which I
mentioned in my patch description.  It's never going to be perfectly
consistent.

But this is actually important that you thought it mattered.  Is there
something that prints a warning?  These irq signedness bugs are some of
the most common recurring bugs I see so it would help to figure out
why people are doing this...

regards,
dan carpenter


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
