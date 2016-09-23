From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 11:07:30 +0000
Subject: Re: GPU-DRM-TTM: Fine-tuning for several function implementations
Message-Id: <f41a2f39-1d7d-9f40-92e5-66728ed126eb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4d34446f-05ad-c3ce-5d33-8fb4f25af25c@users.sourceforge.net>
 <f079ffc1-042c-0332-98e1-5acc6589e4b6@vodafone.de>
 <05418fb1-ad66-aba3-bd8c-f6b684a83279@users.sourceforge.net>
 <f0172ebe-9036-0e11-42c8-1e1230b01e5c@vodafone.de>
In-Reply-To: <f0172ebe-9036-0e11-42c8-1e1230b01e5c@vodafone.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> It's just the names like "out" or "restart" perfectly explain why the labels exists.

I have got an other impression.


> So they fulfill this requirement from the coding style as far as I can see.

Short identifiers might look more convenient in some cases because
they are quicker to type.


> So why do you want to change them?

1. I suggest to select identifiers also for jump labels which are more meaningful
   and eventually unique for some function implementations.

2. How do you think about to add a single space character before any label?

Regards,
Markus
