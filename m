From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 01 Jul 2020 15:32:06 +0000
Subject: Re: [v2] Documentation: Coccinelle: fix typos and command example
Message-Id: <f4a8c007-f572-aee1-c0a0-9f1d97be8ace@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0616dd0c-bb86-be2b-3dc6-1c695a92c3ca@infradead.org>
 <c2c1dec0-2bd1-b0e2-1aa4-38d0e954d5ba@web.de>
 <efc8b0c9-db3b-3c9c-d876-897b53a9e278@infradead.org>
 <2a3940de-6a81-1aff-8109-53c1c5a6aa1b@web.de>
 <f2aaa91a-f935-bc2d-26f2-712576c1bbd7@infradead.org>
 <2f80fb10-dc7f-29be-dc3e-2715f8bafc6d@web.de>
 <dfa2ed9f-fe68-58d1-c3d0-ac436f9bee09@infradead.org>
 <648d287e-3636-1858-1439-103d317f8571@web.de>
 <34065299-03cf-5b62-db37-0acc9830be72@infradead.org>
 <65db3f88-1ac8-374d-e3fe-2ea0970ffd67@web.de>
 <30b722ca-1bd8-2b96-ca41-1e9bc7212b66@infradead.org>
In-Reply-To: <30b722ca-1bd8-2b96-ca41-1e9bc7212b66@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jonathan Corbet <corbet@lwn.net>

>> Do we stumble on a target conflict according to a specific technical detail?
>>
>> How do you think about to compare source code analysis results
>> from programs like “sparse” and “spatch” (by the mentioned make command)?
>
> None of that has anything to do with the current patch.

Both analysis tools can (and should be) be invoked according to
the command parameter “CHECK”.
I hope that the relationship to the compilation of a single source file
will be clarified better.

Regards,
Markus
