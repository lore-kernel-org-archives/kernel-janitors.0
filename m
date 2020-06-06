From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 06 Jun 2020 11:06:23 +0000
Subject: Re: coccinelle: api: add kvfree script
Message-Id: <51a176d4-8c59-5da1-b4d2-c97b17b691a7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
 <alpine.DEB.2.21.2006060944320.2578@hadrien>
In-Reply-To: <alpine.DEB.2.21.2006060944320.2578@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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

I have got recurring understanding difficulties with such a response.
Will quoted patch review issues clarified in any other ways?


> Coccinelle is not able to optimize its search process according to
> the information in constraints.  It will needlessly parse many files.

The software supports also SmPL constraints for some reasons.
Why should such functionality be used at all if the immediate reminder is
there seem to be more important optimisation aspects to consider before?

Regards,
Markus
