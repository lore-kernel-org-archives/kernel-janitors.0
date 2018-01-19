From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Jan 2018 16:43:00 +0000
Subject: Re: Coccinelle: zalloc-simple: Checking consequences from the usage of at signs in Python strings
Message-Id: <5db0f153-2e51-6728-79af-e15b8989d017@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <ff8a1313-90a3-d009-dbc4-034fdbae82af@users.sourceforge.net>
 <alpine.DEB.2.20.1801191717510.3668@hadrien>
In-Reply-To: <alpine.DEB.2.20.1801191717510.3668@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Himanshu Jha <himanshujha199640@gmail.com>
Cc: cocci@systeme.lip6.fr, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>

> So it works, but you are complaining anyway?

I dare to point a contradiction out between two information sources
once more.

Is this SmPL script really working in intended way already?


> I guess the conclusion is that it woks in strings (which are pretty
> universal) and not in comments (which are language specific).

Does the documentation need another update for the Coccinelle software
to achieve the desired correctness?


Which software design direction will get priority in such an use case?

Regards,
Markus
