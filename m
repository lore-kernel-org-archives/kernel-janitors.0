From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 06 Jun 2020 09:50:11 +0000
Subject: Re: coccinelle: api: add kvfree script
Message-Id: <cfb8a321-1f6e-8d0f-65c4-e7f73a1b111d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
 <alpine.DEB.2.21.2006060944320.2578@hadrien>
In-Reply-To: <alpine.DEB.2.21.2006060944320.2578@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>>> +    E = \(kmalloc@kok\|kzalloc@kok\|krealloc@kok\|kcalloc@kok\|kmalloc_node@kok\|kzalloc_node@kok\|kmalloc_array@kok\|kmalloc_array_node@kok\|kcalloc_node@kok\)(...)
>>
>> I would prefer an other coding style here.
>>
>> * Items for such SmPL disjunctions can be specified also on multiple lines.
>>
>> * The semantic patch language supports further means to handle function name lists
>>   in more convenient ways.
>>   Would you like to work with customised constraints?
>
> Please don't follow this advice.

I suggest to reconsider such feedback.

Do the previous comments contain helpful information?


> Coccinelle is not able to optimize its search process

The software contains some limitations which might be changeable.


> according to the information in constraints.

Will related solution ideas become more interesting?


> It will needlessly parse many files.

Such an effect would be undesirable.

* Would you like to clarify other software development options any more?

* How will design goals evolve?

Regards,
Markus
