From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Sep 2017 06:38:48 +0000
Subject: Re: ALSA: bebob: Use common error handling code in snd_bebob_stream_start_duplex()
Message-Id: <06a8e3ee-c3c3-b4c7-0cf9-69a2efdaf0ba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85f95150-9cec-7a53-7692-837ba543e1ec@users.sourceforge.net>
 <541f0f9f-fc87-f65b-bbd8-fec5d45d5d2e@users.sourceforge.net>
 <a1dee732-f5c4-5b35-9f82-553fc8ce430d@sakamocchi.jp>
 <3afecbef-b7ac-a4e8-f439-a351916f05e5@users.sourceforge.net>
 <09bb0e83-01fe-cd12-a084-31db3f12d663@sakamocchi.jp>
In-Reply-To: <09bb0e83-01fe-cd12-a084-31db3f12d663@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>

> As long as I know, the last product with this solution was shipped
> at 2010. Thus the driver is under maintenance.

Thanks for your information.


> I have some tasks for this driver as well as drivers in ALSA firewire sta=
ck,
> however basically this driver is under maintenance and might not get
> further integration.

Good to know in principle =E2=80=A6


> I think that code cleanup for the driver don't help the other developers.

I thought in an other direction if other contributors would like to care
for longer term support.


> It's better to apply such cleanup to more long-live codes such as
> core functionality of ALSA.

I am trying another general transformation pattern out.


> In this point of view, whether your patchset is worth to be applied
> or not, Please keep enough time to think about.

Automatic source code analysis can find various update candidates.
I am just unsure if a bit more software development attention is still
appropriate at some places.

Do you find any of the affected software modules so outdated
so that they should not be touched any more?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
