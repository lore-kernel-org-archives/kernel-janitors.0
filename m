From: Randy Dunlap <rdunlap@infradead.org>
Date: Wed, 01 Jul 2020 13:20:34 +0000
Subject: Re: [PATCH v2] Documentation: Coccinelle: fix typos and command example
Message-Id: <f2aaa91a-f935-bc2d-26f2-712576c1bbd7@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0616dd0c-bb86-be2b-3dc6-1c695a92c3ca@infradead.org>
 <c2c1dec0-2bd1-b0e2-1aa4-38d0e954d5ba@web.de>
 <efc8b0c9-db3b-3c9c-d876-897b53a9e278@infradead.org>
 <2a3940de-6a81-1aff-8109-53c1c5a6aa1b@web.de>
In-Reply-To: <2a3940de-6a81-1aff-8109-53c1c5a6aa1b@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-doc@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On 7/1/20 4:56 AM, Markus Elfring wrote:
>>> …
>>>> +++ linux-next-20200629/Documentation/dev-tools/coccinelle.rst
>>> …
>>>> @@ -177,13 +177,13 @@ For example, to check drivers/net/wirele
>>>>  To apply Coccinelle on a file basis, instead of a directory basis, the
>>>>  following command may be used::
>>>>
>>>> -    make C=1 CHECK="scripts/coccicheck"
>>>> +    make C=1 CHECK="scripts/coccicheck" path/to/file.c
> …
>>> We might stumble on different interpretations according to the wording “file basis”.
>>> Do you find a message like “make: Nothing to be done for 'path/to/file.c'.” interesting then?
>>>
>>> * Would you like to add any links for information around the support for
>>>   source code checkers?
>>>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile?id|30b859a947535f2213277e827d7ac7dcff9c84#n198
> …
>> Feel free to submit patches.
> 
> How do you think about to use the following command variant
> for the adjustment of the software documentation?
> 
> +    make C=1 CHECK='scripts/coccicheck' 'path/to/file.o'
> 

I don't understand the reason for that change...


-- 
~Randy
