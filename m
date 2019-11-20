From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 20 Nov 2019 09:38:33 +0000
Subject: Re: [2/4] coccinelle: platform_get_irq: handle 2-statement branches
Message-Id: <5de8c4b9-2537-283d-4ef0-49fb22c18fe6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1574184500-29870-3-git-send-email-Julia.Lawall@lip6.fr>
 <d178b6b3-7ef1-4ad7-a747-d65249a9667a@web.de>
 <alpine.DEB.2.21.1911192235010.2592@hadrien>
In-Reply-To: <alpine.DEB.2.21.1911192235010.2592@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org

> Sorry, I seem to have done something quite wrong on this patch.

Interesting …


> I will fix it.

Thanks.

Development will be continued:
https://lkml.org/lkml/2019/11/19/1681
https://lore.kernel.org/patchwork/patch/1156089/
https://lore.kernel.org/cocci/1574197705-31132-3-git-send-email-Julia.Lawall@lip6.fr/


>> How do you think about to use the following SmPL code variant?
>
> And the benefit is what?
…
>> + ret =
>> +(platform_get_irq
>> +|platform_get_irq_byname
>> +)(E, ...);
>> +
>> + if ( \( ret < 0 \| ret <= 0 \) )
>> +-{
>> +-dev_err(...);
>> + S
>> +-}

* I suggest to use a different coding style for the specification of
  two function names in the SmPL disjunction.

* Would you like to avoid the mixing of code items in the first text column?

Regards,
Markus
