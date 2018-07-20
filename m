From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jul 2018 09:40:30 +0000
Subject: Re: [v3] Coccinelle: suggest replacing strncpy+truncation by strscpy
Message-Id: <6c657df2-a524-df22-eceb-6237cb5a9faa@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532047018-23754-1-git-send-email-asmadeus@codewreck.org>
In-Reply-To: <1532047018-23754-1-git-send-email-asmadeus@codewreck.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dominique Martinet <asmadeus@codewreck.org>, kernel-janitors@vger.kernel.org
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

> I didn't move all virtuals in a single line because none of the other
> kernel patch do it,

It can be occasionally useful to preserve another bit of coding tradition.
I dared to propose the reconsideration of such an implementation detail.


> and still do not see any advantage of moving the string to not use a variable
> so kept that as well.

I am curious if other software developers (besides me) would like to achieve
more source code reduction according to the principle “Don't repeat yourself”.


> This should hopefully be the last version :)

* Do any related development concerns need further safety checks for this
  evolving source code transformation pattern?

* Julia Lawall has presented additional development ideas today.
  https://lore.kernel.org/lkml/alpine.DEB.2.20.1807200759230.2349@hadrien/
  https://lkml.org/lkml/2018/7/20/71


Regards,
Markus
