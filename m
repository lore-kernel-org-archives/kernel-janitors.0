From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 04 Jun 2020 16:08:05 +0000
Subject: Re: coccinelle: api: add kzfree script
Message-Id: <e814fbbe-37a9-a059-fcbb-64cebba4c8e2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <96653281-3812-8b44-0dd8-6e7540a26a89@web.de>
 <alpine.DEB.2.21.2006041755360.2577@hadrien>
In-Reply-To: <alpine.DEB.2.21.2006041755360.2577@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>>> +virtual context
>>> +virtual org
>>> +virtual report
>>> +virtual patch
>>
>> +virtual context, org, report, patch
>
> This is pointless.

I find the proposed SmPL code variant more succinct.


>> How does the SmPL asterisk functionality fit to the operation
>> modes “org” and “report”?
>
> make coccicheck uses the option --no-show-diff for the org and report modes.

Can it be nicer to avoid the usage of specific functionality
in the SmPL script directly?
Should the corresponding SmPL rule dependencies become clearer?

Regards,
Markus
