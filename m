From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Date: Sun, 14 Jan 2018 22:48:28 +0000
Subject: Re: [PATCH] EDAC, mv64x60: Remove some code duplication
Message-Id: <68939e8b999644b89080ed049970c9fe@svr-chch-ex1.atlnz.lc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180113072821.8100-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180113072821.8100-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Borislav Petkov <bp@alien8.de>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>

Hi Christophe,

On 14/01/18 06:17, Christophe JAILLET wrote:
> Le 13/01/2018 =E0 15:22, Borislav Petkov a =E9crit=A0:
>> + Chris Packham who's been fixing some stuff in here too.
>>
>> On Sat, Jan 13, 2018 at 08:28:21AM +0100, Christophe JAILLET wrote:
>>> Reorder the error handling code in order to release the resources in
>>> reverse order than allocation.
>>>
>>> Introduce a new 'release_group' label in the error handling path and use
>>> it to void some code duplication.
>>>
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>>    drivers/edac/mv64x60_edac.c | 7 ++++---
>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/edac/mv64x60_edac.c b/drivers/edac/mv64x60_edac.c
>>> index 3c68bb525d5d..aa5bc1d8f424 100644
>>> --- a/drivers/edac/mv64x60_edac.c
>>> +++ b/drivers/edac/mv64x60_edac.c
>>> @@ -450,8 +450,8 @@ static int mv64x60_cpu_err_probe(struct platform_de=
vice *pdev)
>>>    					      "cpu", 1, NULL, 0, 0, NULL, 0,
>>>    					      edac_dev_idx);
>>>    	if (!edac_dev) {
>>> -		devres_release_group(&pdev->dev, mv64x60_cpu_err_probe);
>>> -		return -ENOMEM;
>>> +		res =3D -ENOMEM;
>>> +		goto release_group;
>>>    	}
>>>   =20
>>>    	pdata =3D edac_dev->pvt_info;
>>> @@ -561,8 +561,9 @@ static int mv64x60_cpu_err_probe(struct platform_de=
vice *pdev)
>>>    err2:
>>>    	edac_device_del_device(&pdev->dev);
>>>    err:
>>> -	devres_release_group(&pdev->dev, mv64x60_cpu_err_probe);
>>>    	edac_device_free_ctl_info(edac_dev);
>>> +release_group:
>>> +	devres_release_group(&pdev->dev, mv64x60_cpu_err_probe);
>>>    	return res;
>>>    }
>>>   =20
>>> --=20
>> Thanks, looks good. But looking at this driver, mv64x60_mc_err_probe()
>> and mv64x60_sram_err_probe() have the same problem too. Can you address =
them
>> with your patch too pls?
> Will do. mv64x60_pci_err_probe() also needs some tweaks.
>=20
>> Also, if you feel like fixing more stuff in this driver, it doesn't use
>> the edac_printk() infrastructure but naked printk() calls. It could be
>> converted to it.
> I will only propose to remove a useless message and improve another one,
> but won't convert the whole driver, sorry.
>=20

I take this you mean you have a system with a mv64x60 SoC? You might=20
want to make yourself known to the linuxppc-dev list. A while back the=20
prospects of dropping CONFIG_MV64X60 was raised[1]. I don't see anyone=20
actually following through on this yet but I'm not really following=20
linuxppc that closely.

[1] - https://marc.info/?l=3Dlinux-edac&m=3D149518763115206&w=3D2
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
