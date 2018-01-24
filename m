From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 08:41:39 +0000
Subject: Re: Coccinelle: zalloc-simple: Checking consequences from the usage of at signs in Python strings
Message-Id: <993840d6-112c-215a-8b28-53affa1e7a76@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <ff8a1313-90a3-d009-dbc4-034fdbae82af@users.sourceforge.net>
 <alpine.DEB.2.20.1801191717510.3668@hadrien>
In-Reply-To: <alpine.DEB.2.20.1801191717510.3668@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Himanshu Jha <himanshujha199640@gmail.com>
Cc: cocci@systeme.lip6.fr, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>

> So it works, but you are complaining anyway?

How serious do you interpret such information in the SmPL manual?


>> https://github.com/coccinelle/coccinelle/blob/bf1c6a5869dd324f5faeeaa3a12d57270e478b21/docs/manual/cocci_syntax.tex#L50
>>
>> “…
>> Furthermore, @ should not be used in this code.
…
>> …”
> 
> I guess the conclusion is that it woks in strings (which are pretty
> universal) and not in comments (which are language specific).

Would you like to achieve any safer data processing for potentially “reserved” characters?

Regards,
Markus
