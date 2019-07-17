From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 17 Jul 2019 08:00:35 +0000
Subject: Re: [v3] coccinelle: semantic code search for missing of_node_put
Message-Id: <17342c44-256f-8899-0662-b0fe7168f647@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201907171143136548526@zte.com.cn>
In-Reply-To: <201907171143136548526@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>

> 2), Then SmPL A generates another SmPL B based on the function name list;

This would be a general data processing possibility.
Another option would be to let SmPL scripts to import relevant data
from external files or to query facts from databases.


> You expect the entire process above to be automated.

I hope that this can be achieved finally.


> This idea may be interesting,

Thanks for your feedback.


> but it can't be done now,

I got an other view. - Why is your view so limited at the moment?


> and it will introduce uncontrollable factors.

I suggest to take additional design options into account so that you might get
more control on some factors.
Which software development challenges are still waiting for better solutions?


> We agree with julia's comments:
> I would prefer not to put semantic patches that involve iteration into the kernel, for simplicity.

I guess that this kind of change reluctance can be also adjusted.
Some source code analysis approaches can look simple enough
while advanced ones will show more of the inherent complexity.


> Our file is called of_node_put.cocci, which contains three rules: r_miss_put,
>  r_miss_put_ext and r_use_after_put.

This combination is interesting, isn't it?


> If you separate them, it seems inappropriate.

* Would you like to be able to let each source code analysis task to be executed
  on its own?

* I guess that it can become possible with additional development efforts
  to support also a mixture of analysis patterns.

* The patch subject “… missing …” does probably not fit to the detection “use after …”.


>>> v3: delete the global set, …
>>
>> To which previous implementation detail do you refer here?
>
> Here is an improvement based on julia's comments:
> https://lkml.org/lkml/2019/7/5/55

I would find an other description clearer then.
* Drop of functions around “add_if_not_present”
* Omission of iteration functionality


Are any more adjustments worth to be explicitly mentioned in this patch change log?


> Here are some improvements.

Are you going to contribute further patch versions?


> Adding an asterisk here is more convenient to use,

This might be. - I wonder how good additional data fit to supported output formats.


> it can mark the location of the code of interest, such as:

I know its functionality also. - I got the impression that the use of SmPL asterisks
will be safe for the operation mode “context”.


>>> +... when != e = (T)x
>>> +    when != true x == NULL
>>
>> Will assignment exclusions get any more software development attention?
>> https://lore.kernel.org/lkml/03cc4df5-ce7f-ba91-36b5-687fec8c7297@web.de/
>> https://lore.kernel.org/patchwork/patch/1095169/#1291892
>> https://lkml.org/lkml/2019/6/29/193

Will this aspect evolve further anyhow?


>> You propose once more to use a SmPL conjunction in the rule “r_miss_put_ext”.
>> I am also still waiting for a definitive explanation on the applicability
>> of this combination.

Would you like to clarify this software detail any more?


>>> +@r_use_after_put exists@
>>> +expression r_put.E, subE<=r_put.E;
>>
>> I have got an understanding difficulty around the interpretation
>> of the shown SmPL constraint.
>> How will the clarification be continued?

More helpful information?


> +|
> + f(...,c,...,(T)E,...)

I would interpret such passing of a pointer for a device node
as an undesirable “use after free (or put)”.
Will this SmPL disjunction need further adjustments?

Regards,
Markus
