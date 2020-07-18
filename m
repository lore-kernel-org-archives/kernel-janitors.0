From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 18 Jul 2020 07:09:10 +0000
Subject: Re: [v2 1/4] coccinelle: api: extend memdup_user transformation with GFP_USER
Message-Id: <fa0ec546-9aee-5c95-428c-a225a3521f6f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b9f2c58-e124-22d2-d91d-62a6e831c880@web.de>
 <alpine.DEB.2.22.394.2007180841520.2538@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2007180841520.2538@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>> Applied.
>>
>> Do you care for patch review concerns according to this SmPL script adjustment?
>>
>> * https://lore.kernel.org/cocci/5c0dae88-e172-3ba6-f86c-d1a6238bb4c4@web.de/
>>   https://lkml.org/lkml/2020/6/9/568
>
> This one it complete nonsense.

I hope that different views can be clarified for such a software situation
in more constructive ways.


>> * https://lore.kernel.org/cocci/c3464cad-e567-9ef5-b4e3-a01e3b11120b@web.de/
>>   https://lkml.org/lkml/2020/6/8/637
>
> This on is indeed a problem.

I find this feedback interesting.

* How does it fit to your response “Applied”?

* Will it trigger any more consequences?


> Markus, if you would limit your comments to suggesting SmPL code
> that is actually correct, ie that you have tested,

Patch reviews contain usual risks that suggestions are presented
which can be still questionable.


> and 2) stop suggesting stupid things over and over

We come along different development views.


> like that putting all of the virtual declarations on
> the same line would save space (it does, but who cares),

It seems that you admit a possibly desirable effect.
Will any more developers care also for SmPL coding style aspects?


> then I would take your suggestions more seriously.

Your change acceptance is varying to your development mood
(and other factors), isn't it?

Regards,
Markus
