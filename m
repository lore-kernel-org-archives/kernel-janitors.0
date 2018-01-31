From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 31 Jan 2018 17:53:13 +0000
Subject: =?UTF-8?Q?Re:_[v2]_Coccinelle:_zalloc-simple:_Delete_function_?= =?UTF-8?B?4oCca21lbV9jYWNoZV9hbGxvY
Message-Id: <f182b411-d378-56dd-1ab5-0e8f039d493e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <243e83a2-ae0c-2dd2-7f8f-83ac0978cc0e@users.sourceforge.net>
 <alpine.DEB.2.20.1801311836320.3707@hadrien>
In-Reply-To: <alpine.DEB.2.20.1801311836320.3707@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Himanshu Jha <himanshujha199640@gmail.com>
Cc: cocci@systeme.lip6.fr, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>

>> Will the rule set be more consistent then?
> 
> If E1 is not bound by the kem_cache_alloc rule, then it will match anything.

How much was such a software behaviour intended by the discussed SmPL script?


> The user can check if it is appropriate.

How does such an information fit to expectations for safe source code analysis?


> Another option would be to use the type of the variable storing the result
> of the call to compute the expected size.

How would this suggestion help here?

Regards,
Markus
