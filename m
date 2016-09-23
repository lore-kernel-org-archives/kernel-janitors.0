From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 10:20:54 +0000
Subject: Re: GPU-DRM-TTM: Fine-tuning for several function implementations
Message-Id: <05418fb1-ad66-aba3-bd8c-f6b684a83279@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4d34446f-05ad-c3ce-5d33-8fb4f25af25c@users.sourceforge.net>
 <f079ffc1-042c-0332-98e1-5acc6589e4b6@vodafone.de>
In-Reply-To: <f079ffc1-042c-0332-98e1-5acc6589e4b6@vodafone.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>

> Additional to that I don't really see the point in renaming some of the j=
ump labels,

I am suggesting changes for another collateral software evolution.


> if you call it "restart" or "lock_restart" doesn't make much difference.

Do other identifiers fit better to a specification from the document "Codin=
gStyle"
like the following?

"=85
Choose label names which say what the goto does or why the goto exists.
=85"


Does this wording need any more adjustments?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
