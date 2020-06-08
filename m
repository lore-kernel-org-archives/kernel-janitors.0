From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 08 Jun 2020 19:24:44 +0000
Subject: Re: [PATCH v2 2/4] coccinelle: api: extend memdup_user rule with vmemdup_user()
Message-Id: <dd5b2ec1-2307-7508-6423-a3a1a371d33d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6c9c6a4c-c305-ddab-8a1b-e4dc448d643f@web.de>
 <alpine.DEB.2.21.2006082035580.3136@hadrien>
In-Reply-To: <alpine.DEB.2.21.2006082035580.3136@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>>> +*  to = \(kvmalloc@p\|kvzalloc@p\)(size,\(GFP_KERNEL\|GFP_USER\));
>>> +   if (to==NULL || ...) S1
>>> +   if (copy_from_user(to, from, size) != 0)
>>> +   S2
>>
>> How does the SmPL asterisk functionality fit to the operation
>> modes “org” and “report”?
>
> Make coccicheck uses --no-show-diff for org and report modes, so the * has
> no effect in those cases.

* Can it be nicer to generate only required data for each operation mode?

* Would you like to compare the usage of this command parameter with other
  design approaches?

Regards,
Markus
