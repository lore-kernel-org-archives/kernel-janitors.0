From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 08 Jul 2019 11:50:49 +0000
Subject: Re: mfd: asic3: One function call less in asic3_irq_probe()
Message-Id: <b116fc90-9558-8609-d803-7d8da2b66e0a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <01f6a8cd-0205-8d34-2aa3-e4b691e7eb95@web.de>
 <20190707005251.GQ17978@ZenIV.linux.org.uk>
 <4b06e2fb-a0ba-56e5-b46b-98e986e6f2fd@web.de>
 <6e8eab5f-1f5c-b3dc-6b65-96a874ec2789@metux.net>
In-Reply-To: <6e8eab5f-1f5c-b3dc-6b65-96a874ec2789@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Enrico Weigelt <lkml@metux.net>, kernel-janitors@vger.kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>, Lee Jones <lee.jones@linaro.org>, LKML <linux-kernel@vger.kernel.org>

>> I suggest to reduce a bit of duplicate source code also at this place.
>
> Duplicate code (logic) or just characters ?

Both.


> IMHO, readability is an important aspect, so we could be careful about that.

This is usual.

The code text size can influence this aspect in considerable ways.


>> We can have different opinions about the criteria which are relevant here.
>
> Which criterias are you operating on ?

I suggest occasionally again to reconsider consequences around a principle
like “Don't repeat yourself”.


> I think it's good that you're using tools like cocci for pointing out
> *possible* points of useful refactoring.

Thanks for your general understanding.


> But that doesn't mean that a particular patch can be accepted
> or not in the greater context.

Would you like to find the corresponding change acceptance out at all?


> Note that such issues are pretty subjective

The situation depends on some factors.


> - it's not a technical

I got an other impression.


> but an asthetic matter,

This matters also.


> so such issues can't be resolved by logic.

I guess that it can help.

Regards,
Markus
