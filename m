From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Wed, 24 Jun 2020 11:30:02 +0000
Subject: Re: [1/7] irqchip: Fix potential resource leaks
Message-Id: <8556e402-52ae-849f-2f6e-e56406057dce@loongson.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
 <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
 <9ca22645-8bf3-008f-fe55-d432f962cac3@web.de>
 <bd28aef9-ba70-0539-bdc3-6ce7162cefca@loongson.cn>
 <cc6b95ec-691e-f010-4a04-add39d706c4b@web.de>
 <423f83e0-c533-c346-ab8b-f2c6ccc828a2@loongson.cn>
 <37ff7ca4-dc7c-6a43-94a3-9628efe69b25@web.de>
In-Reply-To: <37ff7ca4-dc7c-6a43-94a3-9628efe69b25@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Huacai Chen <chenhc@lemote.com>, Jason Cooper <jason@lakedaemon.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Xuefeng Li <lixuefeng@loongson.cn>

On 06/24/2020 06:06 PM, Markus Elfring wrote:
>>> Were any known software analysis tools involved for the detection of
>>> questionable source code places?
>> kmemleak can detect memory leak,
>> but I do not know how to detect other kind of leaks.
> How do you think about to extend source code analysis tools accordingly?

I have no good idea,
maybe some simple match check tools can do this.

>
>
>> I think consciously release resource in the error path can avoid leaks.
> Is it often too easy to overlook relevant function calls?

Yes,  I think code review can avoid this issue in some certain degree.

>
> Regards,
> Markus
