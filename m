From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Date: Mon, 28 Nov 2016 08:20:38 +0000
Subject: Re: [patch 2/2] mtd: spi-nor: Fix some error codes in cqspi_setup_flash()
Message-Id: <1368be77-903a-6fa2-e3e6-2724998c7599@atmel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013080857.GC3389@mwanda>
 <3ebab16e-ddf8-0a4b-aaaf-d5b424720eb2@denx.de>
 <CAAtXAHey9fxQJ12=xt8jd4ZYTsYLs8s-TJ=YS=ob8CB03mnXpA@mail.gmail.com>
In-Reply-To: <CAAtXAHey9fxQJ12=xt8jd4ZYTsYLs8s-TJ=YS=ob8CB03mnXpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Moritz Fischer <moritz.fischer@ettus.com>, Marek Vasut <marex@denx.de>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, Graham Moore <grmoore@opensource.altera.com>

Le 16/10/2016 =E0 00:09, Moritz Fischer a =E9crit :
> On Fri, Oct 14, 2016 at 9:16 AM, Marek Vasut <marex@denx.de> wrote:
>> On 10/13/2016 10:30 AM, Dan Carpenter wrote:
>>> We return success or possibly uninitialized values on these error paths
>>> instead of proper error codes.
>>>
>>> Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Fla=
sh Controller")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>
>> Nice
>>
>> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Moritz Fischer <moritz.fischer@ettus.com>
Applied to git://github.com/spi-nor/linux.git

Thanks!

>=20
> Thanks,
>=20
> Moritz
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
