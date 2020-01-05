From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 05 Jan 2020 12:07:35 +0000
Subject: Re: coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <ac9f19ae-252b-32ce-0bd2-170ecc0ea14e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200104064448.24314-1-wenyang@linux.alibaba.com>
 <21e9861a-5afc-fd66-cfd1-a9b5b92b230b@web.de>
 <alpine.DEB.2.21.2001051139010.2579@hadrien>
In-Reply-To: <alpine.DEB.2.21.2001051139010.2579@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Wen Yang <wenyang@linux.alibaba.com>, cocci@systeme.lip6.fr
Cc: Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, Thomas Gleixner <tglx@linutronix.de>

>>> +(
>>> +* do_div(f, l);
>>> +|
>>> +* do_div(f, ul);
>>> +|
>>> +* do_div(f, ul64);
>>> +|
>>> +* do_div(f, sl64);
>>> +)
>>
>> I suggest to avoid the specification of duplicate SmPL code.
>>
>> +@@
>> +*do_div(f, \( l \| ul \| ul64 \| sl64 \) );
>
> I don't se any point to this.

Can such succinct SmPL code be occasionally desirable?


> The original code is quite readable,

Yes. - I dare to present a coding style alternative.


> without the ugly \( etc.

I wonder about this view.


>> Please improve the message construction.
>
> Please make more precise comments (I already made some suggestions,

Thus I omitted a repetition.


> so it doesn't matter much here, but "please improve" does not provide any
> concrete guidance).

I guess that Wen Yang can know corresponding software design possibilities
from previous development discussions.

Regards,
Markus
