From: Randy Dunlap <rdunlap@infradead.org>
Date: Tue, 30 Jun 2020 15:11:18 +0000
Subject: Re: [PATCH v2] Documentation: Coccinelle: fix typos and command example
Message-Id: <efc8b0c9-db3b-3c9c-d876-897b53a9e278@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0616dd0c-bb86-be2b-3dc6-1c695a92c3ca@infradead.org>
 <c2c1dec0-2bd1-b0e2-1aa4-38d0e954d5ba@web.de>
In-Reply-To: <c2c1dec0-2bd1-b0e2-1aa4-38d0e954d5ba@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-doc@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On 6/30/20 5:23 AM, Markus Elfring wrote:
> …
>> +++ linux-next-20200629/Documentation/dev-tools/coccinelle.rst
> …> @@ -177,13 +177,13 @@ For example, to check drivers/net/wirele
>>  To apply Coccinelle on a file basis, instead of a directory basis, the
>>  following command may be used::
>>
>> -    make C=1 CHECK="scripts/coccicheck"
>> +    make C=1 CHECK="scripts/coccicheck" path/to/file.c
> 
> I would like to clarify further software design aspects around such make functionality.
> 
> We might stumble on different interpretations according to the wording “file basis”.
> Do you find a message like “make: Nothing to be done for 'path/to/file.c'.” interesting then?
> 
> * Would you like to add any links for information around the support for
>   source code checkers?
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile?id|30b859a947535f2213277e827d7ac7dcff9c84#n198
> 
> * How do you think about to enclose the path for the shown parameter
>   by single quotes instead of double quotes?
> 
> * Can such path specifications become more interesting occasionally
>   if also an other file extension would be chosen than “.c”?
>   Would you like to achieve any software extensions around suffix rules?
> 
> Regards,
> Markus

Markus:

Feel free to submit patches.

-- 
~Randy
