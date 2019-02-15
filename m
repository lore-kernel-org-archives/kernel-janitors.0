From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 15 Feb 2019 13:15:17 +0000
Subject: Re: [v5] Coccinelle: semantic code search for missing put_device()
Message-Id: <712603d6-a2b8-4b00-10f5-879d915c0724@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550217319-40418-1-git-send-email-wen.yang99@zte.com.cn>
 <94e4b3e6-87a4-aea2-dfef-44d308f0fb4f@web.de>
 <alpine.DEB.2.20.1902151400440.3617@hadrien>
In-Reply-To: <alpine.DEB.2.20.1902151400440.3617@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Wen Yang <wen.yang99@zte.com.cn>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

>>> +id = of_find_device_by_node@p1(x)
…
>>> +if (id == NULL || ...) { ... return ...; }
>>> +... when != put_device(&id->dev)
>> …
>>> +    when != if (id) { ... put_device(&id->dev) ... }
>> …
>>
>> I would interpret this SmPL code in the way that the if statement
>> for the pointer check is “optional” in this line.
>> Is it an extra and redundant SmPL specification when the reference
>> release function could eventually be found just anywhere within
>> an implementation?
>
> The proposed when code is correct.

I agree that this SmPL code can work in the way it was designed.


> It is not redundant, because it checks for a particular control-flow pattern.

It took another moment until I dared to express a different software
development opinion also on this implementation detail.

Does the first SmPL when specification include the case that a call
of the function “put_device” can occur within a branch of an if statement?

Regards,
Markus
