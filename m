From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 07 Jun 2020 14:02:35 +0000
Subject: Re: Coccinelle: Extending capabilities for source file pre-selection
Message-Id: <4c70ade8-1ab0-6a9a-30c0-d25b0e22ec8c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
 <alpine.DEB.2.21.2006060944320.2578@hadrien>
 <cfb8a321-1f6e-8d0f-65c4-e7f73a1b111d@web.de>
In-Reply-To: <cfb8a321-1f6e-8d0f-65c4-e7f73a1b111d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>> Coccinelle is not able to optimize its search process
>
> The software contains some limitations which might be changeable.
>
>
>> according to the information in constraints.
>
> Will related solution ideas become more interesting?

I propose to move parts of the mentioned concerns out of the way.


The software performs a source file pre-selection.
https://github.com/coccinelle/coccinelle/blob/7cf2c23e64066d5249a64a316cc5347831f7a63f/docs/manual/spatch_options.tex#L183

File indexes can become involved according to search tools like
“GLIMPSE” and “GNU idutils”.
They can restrict the support for desired queries on file contents.

I got the impression that SmPL constraint variants can be specified in ways
which would fit also to such data format restrictions.

Higher level SmPL constraints can be more challenging to map to advanced queries.


How are the chances to improve the software situation here?

Regards,
Markus
