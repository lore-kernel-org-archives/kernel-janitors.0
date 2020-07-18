From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 18 Jul 2020 09:16:04 +0000
Subject: Re: [v2 1/4] coccinelle: api: extend memdup_user transformation with GFP_USER
Message-Id: <f77f6eb1-9a07-c38d-e6b9-c7cdca119f3b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b9f2c58-e124-22d2-d91d-62a6e831c880@web.de>
 <alpine.DEB.2.22.394.2007180841520.2538@hadrien>
 <fa0ec546-9aee-5c95-428c-a225a3521f6f@web.de>
 <alpine.DEB.2.22.394.2007181034530.2538@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2007181034530.2538@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>> * https://lore.kernel.org/cocci/5c0dae88-e172-3ba6-f86c-d1a6238bb4c4@web.de/
>>>>   https://lkml.org/lkml/2020/6/9/568
>>>
>>> This one it complete nonsense.
>>
>> I hope that different views can be clarified for such a software situation
>> in more constructive ways.
>
> You proposed essentially  \( A \| B \) \( | C \| \)

I suggested also another adjustment.

Can additional minus characters be avoided if such a source code search pattern
would be specified in a single line?


> This is not valid syntax in the semantic patch language.

I hope that a solution can be found by our discussion.


> The branches of a \( \| \) have to be a valid expression, statement, type, etc,

Such information can become more interesting for safe application of
SmPL disjunctions.


> not some random string of tokens.

I got further imaginations in this software area.

Will the handling of optional transformation parameters be clarified better?


>> Patch reviews contain usual risks that suggestions are presented
>> which can be still questionable.
>
> These are not "usual risks".  You can easily test out your suggestion by
> yourself to see if it produces valid code.

Such an expectation can be reasonable in some cases.


> If it doesn't, then don't make the suggestion.

Would software limitations hinder any more improvements then?


>>> like that putting all of the virtual declarations on
>>> the same line would save space (it does, but who cares),
>>
>> It seems that you admit a possibly desirable effect.
>
> No, I don't consider the effect to be desirable.

I propose to take another look at variations around source code verbosity.


>> Your change acceptance is varying to your development mood
>> (and other factors), isn't it?
>
> Not really.  My "change acceptance" increases when the person reporting
> them raises real problems that is blocking them in some work.

I presented open issues accordingly.


> And it decreases rapidly when the changes are almost all related to presumed
> "efficiencies" that have no impact in practice.

Change possibilities can get varying attention and corresponding development priorities.

Regards,
Markus
