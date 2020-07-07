From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 07 Jul 2020 14:16:43 +0000
Subject: =?UTF-8?Q?Re=3a_kbuild=3a_Improve_descriptions_for_the_make_paramet?= =?UTF-8?B?ZXIg4oCcQ+KAnQ==?=
Message-Id: <f4012005-ade5-5c2f-c9b2-4c93fbc6b835@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e546930c-0022-c0ea-059f-0c5ec782b5ab@web.de>
In-Reply-To: <e546930c-0022-c0ea-059f-0c5ec782b5ab@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Coccinelle <cocci@systeme.lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Julia Lawall <julia.lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Randy Dunlap <rdunlap@infradead.org>

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile?id=cdd3bb54332f82295ed90cd0c09c78cd0c0ee822#n201
>
> “…
> # Use 'make C=1' to enable checking of only re-compiled files.
> # Use 'make C=2' to enable checking of *all* source files, regardless
> # of whether they are re-compiled or not.
> …”

I got the impression that source files would be checked according to
such build parameters before a corresponding compilation try.
How do you think about to adjust descriptions which were added with
the commit 1c7bafe7206d928eaccbcbd08d868733e0fb7054 ("kbuild: clarify
"make C=" build option")?
https://lkml.org/lkml/2006/9/24/176
https://lore.kernel.org/patchwork/patch/65119/
https://lore.kernel.org/lkml/115913270694-git-send-email-sam@ravnborg.org/

Regards,
Markus
