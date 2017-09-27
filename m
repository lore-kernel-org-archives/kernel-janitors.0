From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Wed, 27 Sep 2017 11:09:31 +0000
Subject: Re: ALSA: bebob: Use common error handling code in snd_bebob_stream_start_duplex()
Message-Id: <8e2bbd25-d8d0-0d7b-2d4e-daf495bd523f@sakamocchi.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85f95150-9cec-7a53-7692-837ba543e1ec@users.sourceforge.net>
 <541f0f9f-fc87-f65b-bbd8-fec5d45d5d2e@users.sourceforge.net>
 <a1dee732-f5c4-5b35-9f82-553fc8ce430d@sakamocchi.jp>
 <3afecbef-b7ac-a4e8-f439-a351916f05e5@users.sourceforge.net>
 <09bb0e83-01fe-cd12-a084-31db3f12d663@sakamocchi.jp>
 <06a8e3ee-c3c3-b4c7-0cf9-69a2efdaf0ba@users.sourceforge.net>
In-Reply-To: <06a8e3ee-c3c3-b4c7-0cf9-69a2efdaf0ba@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>

On Sep 27 2017 15:38, SF Markus Elfring wrote:
>> As long as I know, the last product with this solution was shipped
>> at 2010. Thus the driver is under maintenance.
>=20
> Thanks for your information.
>=20
>=20
>> I have some tasks for this driver as well as drivers in ALSA firewire st=
ack,
>> however basically this driver is under maintenance and might not get
>> further integration.
>=20
> Good to know in principle =E2=80=A6
>=20
>=20
>> I think that code cleanup for the driver don't help the other developers.
>=20
> I thought in an other direction if other contributors would like to care
> for longer term support.
>=20
>=20
>> It's better to apply such cleanup to more long-live codes such as
>> core functionality of ALSA.
>=20
> I am trying another general transformation pattern out.
>=20
>=20
>> In this point of view, whether your patchset is worth to be applied
>> or not, Please keep enough time to think about.
>=20
> Automatic source code analysis can find various update candidates.
> I am just unsure if a bit more software development attention is still
> appropriate at some places.
>=20
> Do you find any of the affected software modules so outdated
> so that they should not be touched any more?

Please don't ignore the practicality I've explained, and don't=20
accumulate your questions without it.


Regards

Takashi Sakamoto
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
