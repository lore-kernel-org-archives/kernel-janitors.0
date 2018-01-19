From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Jan 2018 16:14:23 +0000
Subject: Re: Coccinelle: zalloc-simple: Checking consequences from the usage of at signs in Python strings
Message-Id: <ff8a1313-90a3-d009-dbc4-034fdbae82af@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
In-Reply-To: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: cocci@systeme.lip6.fr, Masahiro Yamada <yamada.masahiro@socionext.com>, Himanshu Jha <himanshujha199640@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>

> I removed the blank line at EOF,
> then applied to linux-kbuild/misc.

This script for the semantic patch language is using the at sign within string
literals for Python code.

It is nice when this character seems to work also with the current software.
How does its usage fit to the following information in the SmPL manual?

https://github.com/coccinelle/coccinelle/blob/bf1c6a5869dd324f5faeeaa3a12d57270e478b21/docs/manual/cocci_syntax.tex#L50

“…
Furthermore, @ should not be used in this code.
Spatch scans the script code for the next @ and considers that to be the
beginning of the next rule, even if @ occurs within e.g., a comment.
…”


See also:
Configuration or escaping of @ characters for embedded programming language scripts
https://github.com/coccinelle/coccinelle/issues/36

Regards,
Markus
