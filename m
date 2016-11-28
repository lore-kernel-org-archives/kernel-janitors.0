From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Date: Mon, 28 Nov 2016 08:19:18 +0000
Subject: Re: [patch 1/2] mtd: spi-nor: Off by one in cqspi_setup_flash()
Message-Id: <6be2afea-0981-b625-1c8a-6511e20db759@atmel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013080646.GB3389@mwanda>
 <360bddfc-0495-8836-41ef-4121517011a3@denx.de>
In-Reply-To: <360bddfc-0495-8836-41ef-4121517011a3@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Marek Vasut <marex@denx.de>, Dan Carpenter <dan.carpenter@oracle.com>, David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org

Le 14/10/2016 =E0 09:19, Marek Vasut a =E9crit :
> On 10/13/2016 10:06 AM, Dan Carpenter wrote:
>> There are CQSPI_MAX_CHIPSELECT elements in the ->f_pdata array so the >
>> should be >=3D.
>>
>> Fixes: 140623410536 ('mtd: spi-nor: Add driver for Cadence Quad SPI Flas=
h Controller')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Reviewed-by: Marek Vasut <marex@denx.de>
Applied to git://github.com/spi-nor/linux.git

Thanks!
>=20
>> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor=
/cadence-quadspi.c
>> index d403ba7..944863b 100644
>> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
>> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
>> @@ -1082,7 +1082,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqsp=
i, struct device_node *np)
>>  			goto err;
>>  		}
>> =20
>> -		if (cs > CQSPI_MAX_CHIPSELECT) {
>> +		if (cs >=3D CQSPI_MAX_CHIPSELECT) {
>>  			dev_err(dev, "Chip select %d out of range.\n", cs);
>>  			goto err;
>>  		}
>>
>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
