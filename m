From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 24 Jun 2020 09:23:03 +0000
Subject: Re: [1/7] irqchip: Fix potential resource leaks
Message-Id: <cc6b95ec-691e-f010-4a04-add39d706c4b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
 <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
 <9ca22645-8bf3-008f-fe55-d432f962cac3@web.de>
 <bd28aef9-ba70-0539-bdc3-6ce7162cefca@loongson.cn>
In-Reply-To: <bd28aef9-ba70-0539-bdc3-6ce7162cefca@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Huacai Chen <chenhc@lemote.com>, Jason Cooper <jason@lakedaemon.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Xuefeng Li <lixuefeng@loongson.cn>

>> [PATCH v3 10/14 RESEND] irqchip/nvic: Fix potential resource leaks
>> https://lore.kernel.org/linux-mips/1592984711-3130-11-git-send-email-yangtiezhu@loongson.cn/
>> https://lore.kernel.org/patchwork/patch/1263191/
>>
>>
>> Can it matter to omit the word “potential” from change descriptions
>> after you detected that specific function calls were missing
>> in if branches?
>
> Oh, I find this issue through code review, I have no test environment
> to trigger the error path, but I think it is better to release the resource
> in the error path, so I use "potential" description.

Did you determine that special function calls were generally missing
in error cases?

Were any known software analysis tools involved for the detection of
questionable source code places?

Regards,
Markus
