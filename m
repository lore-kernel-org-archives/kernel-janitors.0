From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 15 Jun 2020 16:27:50 +0000
Subject: Re: coccinelle: api: add device_attr_show script
Message-Id: <6ce5346f-127d-e2fd-c703-9adf21060e30@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1f028ee6-b014-c240-21d8-0c1950334fe6@web.de>
 <alpine.DEB.2.22.394.2006151742090.23306@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2006151742090.23306@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>> +virtual report, org, context, patch
>>
>> Is such a SmPL code variant more succinct?
>
> This doens't matter.

Can less duplicate code be a bit nicer?


>>> +ssize_t show(struct device *dev, struct device_attribute *attr, char *buf)
>>> +{
>>> +	<...
>>> +*	return snprintf@p(...);
>>> +	...>
>>> +}
>>
>> I suggest to reconsider the selection of the SmPL nest construct.
>> https://github.com/coccinelle/coccinelle/blob/e06b9156dfa02a28cf3cbf0913a10513f3d163ab/docs/manual/cocci_syntax.tex#L783
>>
>> Can the construct “<+... … ...+>” become relevant here?
>
> <... ...> is fine if the only thing that will be used afterwards is what
> is inside the <... ...>

I propose once more to distinguish better if the shown return statement
may be really treated as optional for such a source code search approach
(or not).

Regards,
Markus
