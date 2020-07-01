From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 01 Jul 2020 11:56:58 +0000
Subject: Re: [PATCH v2] Documentation: Coccinelle: fix typos and command example
Message-Id: <2a3940de-6a81-1aff-8109-53c1c5a6aa1b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0616dd0c-bb86-be2b-3dc6-1c695a92c3ca@infradead.org>
 <c2c1dec0-2bd1-b0e2-1aa4-38d0e954d5ba@web.de>
 <efc8b0c9-db3b-3c9c-d876-897b53a9e278@infradead.org>
In-Reply-To: <efc8b0c9-db3b-3c9c-d876-897b53a9e278@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jonathan Corbet <corbet@lwn.net>

>> …
>>> +++ linux-next-20200629/Documentation/dev-tools/coccinelle.rst
>> …
>> > @@ -177,13 +177,13 @@ For example, to check drivers/net/wirele
>>>  To apply Coccinelle on a file basis, instead of a directory basis, the
>>>  following command may be used::
>>>
>>> -    make C=1 CHECK="scripts/coccicheck"
>>> +    make C=1 CHECK="scripts/coccicheck" path/to/file.c
…
>> We might stumble on different interpretations according to the wording “file basis”.
>> Do you find a message like “make: Nothing to be done for 'path/to/file.c'.” interesting then?
>>
>> * Would you like to add any links for information around the support for
>>   source code checkers?
>>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile?id=7c30b859a947535f2213277e827d7ac7dcff9c84#n198
…
> Feel free to submit patches.

How do you think about to use the following command variant
for the adjustment of the software documentation?

+    make C=1 CHECK='scripts/coccicheck' 'path/to/file.o'

Regards,
Markus
