From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 07 Sep 2019 14:54:26 +0000
Subject: =?UTF-8?B?QWRqdXN0aW5nIFNtUEwgc2NyaXB0IOKAnHB0cl9yZXQuY29jY2nigJ0/?=
Message-Id: <c8e0db8a-1f96-dac0-791c-43e2d1e1cf05@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Coccinelle <cocci@systeme.lip6.fr>, kernel-janitors@vger.kernel.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Allison Randal <allison@lohutok.net>

Hello,

I have taken another look at a known script for the semantic patch language.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/api/ptr_ret.cocci?id=1e3778cb223e861808ae0daccf353536e7573eed#n3

I got the impression that duplicate SmPL code can be reduced here.
So I tried the following approach out.

…
@depends on patch@
expression ptr;
@@
(
(
- if (IS_ERR(ptr)) return PTR_ERR(ptr); else return 0;
|
- if (IS_ERR(ptr)) return PTR_ERR(ptr); return 0;
)
+ return PTR_ERR_OR_ZERO(ptr);
|
- (IS_ERR(ptr) ? PTR_ERR(ptr) : 0)
+ PTR_ERR_OR_ZERO(ptr)
)
…


Unfortunately, I got the following information then for a test transformation.

elfring@Sonne:~/Projekte/Linux/next-patched> spatch -D patch scripts/coccinelle/api/ptr_ret.cocci drivers/spi/spi-gpio.c
…
29: no available token to attach to


It seems that the Coccinelle software “1.0.7-00218-gf284bf36” does not like
the addition of the shown return statement after a nested SmPL disjunction.
But the following SmPL code variant seems to work as expected.


…
@depends on patch@
expression ptr;
@@
(
- if (IS_ERR(ptr)) return PTR_ERR(ptr); else return 0;
+ return PTR_ERR_OR_ZERO(ptr);
|
- if (IS_ERR(ptr)) return PTR_ERR(ptr); return 0;
+ return PTR_ERR_OR_ZERO(ptr);
|
- (IS_ERR(ptr) ? PTR_ERR(ptr) : 0)
+ PTR_ERR_OR_ZERO(ptr)
)
…


How do you think about to reduce subsequent SmPL rules also according to
a possible recombination of affected implementation details?

Regards,
Markus
