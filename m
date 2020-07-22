From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 22 Jul 2020 06:44:29 +0000
Subject: Re: [v3 2/3] coccinelle: api: extend memdup_user rule with vmemdup_user()
Message-Id: <c6809db7-2979-7057-5cac-d2d1a57e77e2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e3d2ffb9-2a47-3d77-0501-9d48845435bd@web.de>
 <alpine.DEB.2.22.394.2007211158310.2487@hadrien>
 <0b326e2b-723c-3482-c0ef-5d6592a9c6cb@web.de>
 <alpine.DEB.2.22.394.2007220801590.2918@hadrien>
 <07a06754-94dd-60b1-1ad1-9e602c86b1f8@web.de>
 <alpine.DEB.2.22.394.2007220823050.2918@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2007220823050.2918@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>> Under which circumstances would you begin to care more for involved differences
>> in corresponding run time characteristics?
>
> When the difference is hours vs seconds.

Such a view can be influenced by execution environments in considerable ways.


> In this case, there are tradeoffs between the two options,

I am trying to improve the awareness for possible software design variations.


> andI don't know which would be faster,

I am curious if more contributors would get into the mood to compare
data processing approaches a bit more.


> but I think it is extremely unlikely that the difference is noticible.

But the following effects may be known for the evaluation of a SmPL rule
which was combined for two code parts.

* The SmPL dependencies are checked only once.

* Can the source code search efforts be reduced a bit?


> But if you are concerned about it, you are welcome to try.

Will anybody become interested to measure the software behaviour exactly?

Regards,
Markus
