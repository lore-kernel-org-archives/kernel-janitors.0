From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 24 Jun 2020 08:42:53 +0000
Subject: Re: [1/7] irqchip: Fix potential resource leaks
Message-Id: <9ca22645-8bf3-008f-fe55-d432f962cac3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
 <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
In-Reply-To: <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Huacai Chen <chenhc@lemote.com>, Jason Cooper <jason@lakedaemon.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Xuefeng Li <lixuefeng@loongson.cn>

>> Can it helpful to add jump targets so that a bit of exception handling
>> can be better reused at the end of this function?
>
> OK, no problem, I will do it in the v2.

It seems that the software evolution will be continued with another
update suggestion like the following.

[PATCH v3 10/14 RESEND] irqchip/nvic: Fix potential resource leaks
https://lore.kernel.org/linux-mips/1592984711-3130-11-git-send-email-yangtiezhu@loongson.cn/
https://lore.kernel.org/patchwork/patch/1263191/


Can it matter to omit the word “potential” from change descriptions
after you detected that specific function calls were missing
in if branches?

Regards,
Markus
