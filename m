From: Liang Yang <liang.yang@amlogic.com>
Date: Wed, 30 Jan 2019 09:43:19 +0000
Subject: Re: [PATCH][next] mtd: rawnand: meson: fix missing assignment of ret on a call to meson_chip_buffer_
Message-Id: <30e51df9-d1ad-9066-41e0-d8ee6aa3ad4a@amlogic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190129105757.19138-1-colin.king@canonical.com>
 <aeadd16e-ed46-28f2-15de-66d1d9f1ed11@amlogic.com>
 <20190130103250.4080a3b3@xps13>
 <25109367-14bc-90b1-f0a9-ad65aac46bf8@canonical.com>
In-Reply-To: <25109367-14bc-90b1-f0a9-ad65aac46bf8@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin Ian King <colin.king@canonical.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org

Hi Miquel, Colin,

On 2019/1/30 17:34, Colin Ian King wrote:
> On 30/01/2019 09:32, Miquel Raynal wrote:
>> Hi Liang, Colin,
>>
>> Liang Yang <liang.yang@amlogic.com> wrote on Wed, 30 Jan 2019 17:26:49
>> +0800:
>>
>>> Hi Colin,
>>>
>>> On 2019/1/29 18:57, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> The call to meson_chip_buffer_init is not assigning ret, however, ret
>>>> is being checked for failure. Fix this by adding in the missing assign=
ment.
>>>>
>>>> Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAN=
D flash controller")
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> ---
>>>>    drivers/mtd/nand/raw/meson_nand.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/=
meson_nand.c
>>>> index e858d58d97b0..b9c543d1054c 100644
>>>> --- a/drivers/mtd/nand/raw/meson_nand.c
>>>> +++ b/drivers/mtd/nand/raw/meson_nand.c
>>>> @@ -1206,7 +1206,7 @@ static int meson_nand_attach_chip(struct nand_ch=
ip *nand)
>>>>    		dev_err(nfc->dev, "16bits bus width not supported");
>>>>    		return -EINVAL;
>>>>    	}
>>>> -	meson_chip_buffer_init(nand);
>>>> +	ret =3D meson_chip_buffer_init(nand);
>>>
>>> Looks good to me:
>>>
>>> Acked-by: Liang Yang <liang.yang@amlogic.com>
>>
>> This is nand/next material, so if you don't mind I would like to squash
>> the two fixes you sent into the original commit inserting the driver.
>=20
> Sure, ok with me, squashing them makes sense.
>=20
> Colin

ok.

>>
>>
>> Thanks,
>> Miqu=C3=A8l
>>
>=20
> .
>=20
