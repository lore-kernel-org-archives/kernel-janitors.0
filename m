From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Wed, 08 Jan 2020 07:20:37 +0000
Subject: Re: [PATCH][next] dmaengine: ti: omap-dma: don't allow a null od->plat pointer to be dereferenced
Message-Id: <f6b24302-a90e-7aa5-b2e8-3c459e6d0598@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200106122325.39121-1-colin.king@canonical.com>
 <b7200998-c8e7-0841-ce91-ad3834c63cae@ti.com>
In-Reply-To: <b7200998-c8e7-0841-ce91-ad3834c63cae@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Tony Lindgren <tony@atomide.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin, Tony,

On 07/01/2020 13.59, Peter Ujfalusi wrote:
> Colin,
>=20
> On 06/01/2020 14.23, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently when the call to dev_get_platdata returns null the driver issu=
es
>> a warning and then later dereferences the null pointer.  Avoid this issue
>> by returning -EPROBE_DEFER errror rather when the platform data is null.
>=20
> Thank you for noticing it!
>=20
> Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>=20
>> Addresses-Coverity: ("Dereference after null check")
>> Fixes: 211010aeb097 ("dmaengine: ti: omap-dma: Pass sdma auxdata to driv=
er and use it")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/dma/ti/omap-dma.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
>> index fc8f7b2fc7b3..335c3fa7a3b1 100644
>> --- a/drivers/dma/ti/omap-dma.c
>> +++ b/drivers/dma/ti/omap-dma.c
>> @@ -1658,8 +1658,10 @@ static int omap_dma_probe(struct platform_device =
*pdev)
>>  	if (conf) {
>>  		od->cfg =3D conf;
>>  		od->plat =3D dev_get_platdata(&pdev->dev);
>> -		if (!od->plat)
>> +		if (!od->plat) {
>>  			dev_warn(&pdev->dev, "no sdma auxdata needed?\n");
>> +			return -EPROBE_DEFER;

I think we should make the print as dev_err("&pdev->dev,
"omap_system_dma_plat_info is missing") and return with -ENODEV. The
omap_system_dma_plat_info is _needed_ and if we have booted with device
tree it is not going to appear later.

Tony, what do you think?

>> +		}
>>  	} else {
>>  		od->cfg =3D &default_cfg;
>> =20
>>

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
