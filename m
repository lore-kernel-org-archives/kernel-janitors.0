From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 13:46:44 +0000
Subject: Re: GPU-DRM-TTM: Fine-tuning for several function implementations
Message-Id: <57a602e8-ba38-6cbb-078d-ac562b024441@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4d34446f-05ad-c3ce-5d33-8fb4f25af25c@users.sourceforge.net>
 <f079ffc1-042c-0332-98e1-5acc6589e4b6@vodafone.de>
 <05418fb1-ad66-aba3-bd8c-f6b684a83279@users.sourceforge.net>
 <20160923125525.GR13620@mwanda>
In-Reply-To: <20160923125525.GR13620@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> Do other identifiers fit better to a specification from the document "Co=
dingStyle"
>> like the following?
>>
>> "=85
>> Choose label names which say what the goto does or why the goto exists.
>> =85"
>>
>>
>> Does this wording need any more adjustments?
>=20
> No.

I have got an other impression.

The terse description can trigger disagreements about the "what" and "why",
can't it?


> I wrote that and "restart" seems like a pretty clear name to me.

This identifier might be good enough to some degree.
I imagined that it would become better by the addition of a bit of informat=
ion
from the jump target.


> I never wrote that you should harrass people with your nonsense patches.

This is true in principle.

But your adjustment for the document "CodingStyle" supported also a reconsi=
deration
of the corresponding identifier selection.

Some developers disagreed with a proposed renaming while others reacted
in a positive way.


> In fact, I have asked you over and over again to stop.

This happened under different software update contexts occasionally.

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
