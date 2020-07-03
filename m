From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 03 Jul 2020 19:21:51 +0000
Subject: =?UTF-8?Q?Documentation=3a_Coccinelle=3a_Checking_information_aroun?= =?UTF-8?B?ZCB0aGUgbWFrZSBwYXJh
Message-Id: <e546930c-0022-c0ea-059f-0c5ec782b5ab@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-doc@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Julia Lawall <julia.lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Randy Dunlap <rdunlap@infradead.org>

Hello,

I have taken another look also at places from two information sources.

A)
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile?id=cdd3bb54332f82295ed90cd0c09c78cd0c0ee822#n201

“…
# Use 'make C=1' to enable checking of only re-compiled files.
# Use 'make C=2' to enable checking of *all* source files, regardless
# of whether they are re-compiled or not.
…”

B)
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/dev-tools/coccinelle.rst?id=cdd3bb54332f82295ed90cd0c09c78cd0c0ee822#n182

“…
To check only newly edited code, use the value 2 for the C flag, i.e.::
…”


How good do these description variants fit together?

Regards,
Markus
