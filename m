From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 11 Jan 2020 07:30:18 +0000
Subject: Re: [v3] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <5a9f1ad1-3881-2004-2a7b-d61f1d201cf9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110131526.60180-1-wenyang@linux.alibaba.com>
 <91abb141-57b8-7659-25ec-8080e290d846@web.de>
 <c4ada2f2-19b0-91ef-ddf3-a1999f4209ea@linux.alibaba.com>
In-Reply-To: <c4ada2f2-19b0-91ef-ddf3-a1999f4209ea@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wenyang@linux.alibaba.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

>> * I suggest once more to adjust the dependency specifications for the usage
>>   of these functions by SmPL rules.
>
> Most of the functions here are for all operation modes.

I got an other understanding for this software.

You added the information “also filter out safe consts for context mode”
to the patch change log.


>> * Can the local variable “msg” be omitted?

I would appreciate another fine-tuning also at this place.


>>> +coccilib.org.print_todo(p[0], construct_warnings("div64_ul"))
>>
>> I suggest again to move the prefix “div64_” into the string literal
>> of the function implementation.
>
> “div64_ul” indicates the function name we recommend.

The intention can be fine.


> If we delete the prefix "div64_",

I suggest to use the text at an other place.


> it may reduce readability.

I find an other code variant also readable good enough.


> +*do_div(f, \( l \| ul \| ul64 \| sl64 \) );
>
> We agree with Julia:
> I don't se any point to this.

Can the avoidance of duplicate source code (according to SmPL disjunctions)
trigger positive effects on run time characteristics and software maintenance?

Regards,
Markus
