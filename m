From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 20 Jun 2019 19:02:50 +0000
Subject: Re: Coccinelle: Add a SmPL script for the reconsideration of redundant dev_err() calls
Message-Id: <532ef0ea-9478-bc2a-c1c1-2ed5e1545879@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
 <alpine.DEB.2.21.1906202046550.3087@hadrien>
In-Reply-To: <alpine.DEB.2.21.1906202046550.3087@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Ding Xiang <dingxiang@cmss.chinamobile.com>, Coccinelle <cocci@systeme.lip6.fr>

>> +@display depends on context@
>> +expression e;
>> +@@
>> + e = devm_ioremap_resource(...);
>> + if (IS_ERR(e))
>> + {
>> +*   dev_err(...);
>> +    return (...);
>> + }
>
> Why do you assume that there is exactly one dev_err and one return after
> the test?

I propose to start with the addition of a simple source code search pattern.
Would you prefer to clarify a more advanced approach?


>> +@script:python to_do depends on org@
>> +p << or.p;
>> +@@
>> +coccilib.org.print_todo(p[0],
>> +                        "WARNING: An error message is probably not needed here because the previously called function contains appropriate error reporting.")
>
> "the previously called function" would be better as "devm_ioremap_resource".

Would you like to get the relevant function name dynamically determined?

Regards,
Markus
