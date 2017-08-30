From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 20:56:54 +0000
Subject: Re: [PATCH 13/14] vme: tsi148: Improve 17 size determinations
Message-Id: <4cd218be-0b0e-bf9c-e65a-1ba3dd57fc26@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
 <1cb8956d-2862-9f64-d19c-32b4a797a3b1@users.sourceforge.net>
 <20170825205721.GA11181@hades.home>
 <934e298f-596d-dc13-f3e3-797a49c74e84@users.sourceforge.net>
 <CAEccXeea6760kaDw5pLEqDJuLwG3PbFvCKCxY2_PGAe3bJ-YxA@mail.gmail.com>
In-Reply-To: <CAEccXeea6760kaDw5pLEqDJuLwG3PbFvCKCxY2_PGAe3bJ-YxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Martyn Welch <martyn@welchs.me.uk>, devel <devel@driverdev.osuosl.org>
Cc: Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>>> @@ -2363,5 +2364,5 @@ static int tsi148_probe(struct pci_dev *pdev, co=
nst struct pci_device_id *id)
>>>>              master_num--;
>>>>
>>>>              tsi148_device->flush_image >>>> -                    kmal=
loc(sizeof(struct vme_master_resource), GFP_KERNEL);
>>>> +                    kmalloc(sizeof(*tsi148_device->flush_image), GFP_=
KERNEL);
>>>
>>> This line is now a tiny bit too long
>>
>> Can you eventually tolerate a line length of 81 characters at such a sou=
rce code place?
>>
>=20
> I think there's some irony here. On the one hand you are submitting
> patches that correct coding style issues, on the other you are asking
> whether we can ignore the coding style...

I test somehow how strict you would like to handle the length limit there.

I imagine that the affected source code formatting could also become differ=
ent
if the involved variable name would be shorter.


>> * It seems that you would not like to perform such a tweak yourself.
>=20
> To be honest, it is quicker and easier in this instance to do just that.

Interesting =E2=80=A6


> So that's now done.

Thanks that you picked some of my ideas up.


> Patches now in my testing branch:
>=20
> https://gitlab.collabora.com/martyn/linux/commits/vme-testing

I am curious on how the shown change possibilities will evolve from
this repository.


>> * Do you expect a resend for the complete patch series?
>>
>=20
> Unless the maintainer has commented that they have accepted patches x,
> y and z, then sending the entire series again is generally the right
> thing to do.

Would you like to respond further to Greg's comments (from 2017-08-26)
for this patch series?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
