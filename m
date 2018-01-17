From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 Jan 2018 16:47:03 +0000
Subject: Re: [v2] Coccinelle: zalloc-simple: Safer transformations with SmPL
Message-Id: <ccb782c1-decb-6181-cdf0-022965b3df59@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
In-Reply-To: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr, Masahiro Yamada <yamada.masahiro@socionext.com>, Himanshu Jha <himanshujha199640@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>

> I removed the blank line at EOF,
> then applied to linux-kbuild/misc.

This script for the semantic patch language was extended. Now I find
that this development version contains some update candidates.
Implementation details can become safer in a few software design directions.

I suggest to start with another look at the distinction between pointer data types
and the other types. How much can corresponding source code review result in
further software improvements?

Regards,
Markus
