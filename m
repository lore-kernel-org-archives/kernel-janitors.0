From: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Date: Fri, 23 Sep 2016 10:38:07 +0000
Subject: Re: GPU-DRM-TTM: Fine-tuning for several function implementations
Message-Id: <f0172ebe-9036-0e11-42c8-1e1230b01e5c@vodafone.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4d34446f-05ad-c3ce-5d33-8fb4f25af25c@users.sourceforge.net>
 <f079ffc1-042c-0332-98e1-5acc6589e4b6@vodafone.de>
 <05418fb1-ad66-aba3-bd8c-f6b684a83279@users.sourceforge.net>
In-Reply-To: <05418fb1-ad66-aba3-bd8c-f6b684a83279@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>

Am 23.09.2016 um 12:20 schrieb SF Markus Elfring:
>> Additional to that I don't really see the point in renaming some of the =
jump labels,
> I am suggesting changes for another collateral software evolution.
>
>
>> if you call it "restart" or "lock_restart" doesn't make much difference.
> Do other identifiers fit better to a specification from the document "Cod=
ingStyle"
> like the following?

No, not really.

>
> "=85
> Choose label names which say what the goto does or why the goto exists.
> =85"
>
>
> Does this wording need any more adjustments?

Of hand I can't find any better wording.

It's just the names like "out" or "restart" perfectly explain why the=20
labels exists. So they fulfill this requirement from the coding style as=20
far as I can see.

So why do you want to change them?

Regards,
Christian.

>
> Regards,
> Markus


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
