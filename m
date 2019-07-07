From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 07 Jul 2019 07:56:11 +0000
Subject: Re: [PATCH] mfd: asic3: One function call less in asic3_irq_probe()
Message-Id: <4b06e2fb-a0ba-56e5-b46b-98e986e6f2fd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <01f6a8cd-0205-8d34-2aa3-e4b691e7eb95@web.de>
 <20190707005251.GQ17978@ZenIV.linux.org.uk>
In-Reply-To: <20190707005251.GQ17978@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>, LKML <linux-kernel@vger.kernel.org>

>> Avoid an extra function call by using a ternary operator instead of
>> a conditional statement.
>
> Which is a good thing, because...?

I suggest to reduce a bit of duplicate source code also at this place.


>> This issue was detected by using the Coccinelle software.
>
> Oh, I see - that answers all questions.

Obviously not so far.


> "Software has detected an issue", so of course an issue it is.

The mentioned development tool can help to point refactoring
possibilities out.


>> -		if (irq < asic->irq_base + ASIC3_NUM_GPIOS)
>> -			irq_set_chip(irq, &asic3_gpio_irq_chip);
>> -		else
>> -			irq_set_chip(irq, &asic3_irq_chip);
>> -
>> +		irq_set_chip(irq,
>> +			     (irq < asic->irq_base + ASIC3_NUM_GPIOS)
>> +			     ? &asic3_gpio_irq_chip
>> +			     : &asic3_irq_chip);
>
> ... except that the result is not objectively better by any real criteria.

We can have different opinions about the criteria which are relevant here.


> It's not more readable,

This is a possible view.


> it conveys _less_ information to reader

I guess that the interpretation of this feedback can become more interesting.


> (the fact that calls differ only by the last argument
> had been visually obvious already,

Can the repeated code specification make the recognition of this
implementation detail a bit harder actually?


> had been visually obvious already, and logics used to be easier
> to see), it (obviously) does not generate better (or different) code.

The functionality should be equivalent for the shown software refactoring.


> What the hell is the point?

I dare to point another change possibility out.
I am unsure if this adjustment will be picked up finally.

Regards,
Markus
