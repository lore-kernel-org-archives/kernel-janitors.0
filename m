From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 06 Jun 2020 15:10:08 +0000
Subject: Re: coccinelle: api: add kvfree script
Message-Id: <c0cfb9da-16a5-f37d-e98c-a57fc303fcc5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <119d91fd-1ad0-8842-10eb-ee8fa16da1b0@web.de>
 <alpine.DEB.2.21.2006061634130.19534@hadrien>
In-Reply-To: <alpine.DEB.2.21.2006061634130.19534@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>> * A limited search approach was expressed. Will additional source code variations
>>   become relevant?
>>   + switch statement
>>   + if branches with single statements
>>   + conditional operator
>
> The point is that there is a kmalloc in one branch and a vmalloc in
> another branch, so a if with a single branch doesn't seem relevant.

Is an other wording more appropriate to handle if/else statements
without curly brackets?


> The other cases sem highly improbable.

This can be.

But how much do such details influence the confidence level
for such a SmPL script?


>>> +@opportunity depends on !patch …@
>> …
>>> +  E = \(kmalloc\|…\)(..., size, ...)
>>> +  ... when != E = E1
>>> +      when != size = E1
>>
>> I wonder that two assignments should be excluded here according to
>> the same expression metavariable.
>
> Doesn't matter.

Would different variable names reduce the potential for confusion?


> The metavariables are considered separately in the different whens.

Is this information relevant for a better software documentation?


>>> +@pkfree depends on patch exists@
>> …
>>> +- \(kfree\|kvfree\)(E)
>>> ++ vfree(E)
>>
>> Would you like to use a SmPL code variant like the following
>> at any more places?
>> (Is it occasionally helpful to increase the change precision?)
>>
>> +-\(kfree\|kvfree\)
>> ++vfree
>> +      (E)
>
> "increase the change precision" seems to be an obscure way to say "improve
> the formatting".

We come along a different understanding of such a transformation approach
once more.


> Indeed, leaving (E) as is would have the effect of not changing the formatting.

I just propose to leave source code unmodified as much as possible here.


> But the problem seems unlikely for a functoin with such a short name.

This can be.


> And this presentation will likely run afoul of the fact
> that you can't attach + code to a disjunction.

There is a minus character before such SmPL disjunctions.


> So the original presentation was more concise, and should be fine in practice.

Is less duplicated SmPL code useful?

I point a design alternative out.
Would you like to integrate it anyhow?

Regards,
Markus
