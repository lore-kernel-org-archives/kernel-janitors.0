From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 24 Jun 2020 12:21:39 +0000
Subject: Re: [v3 03/14] irqchip/csky-mpintc: Fix potential resource leaks
Message-Id: <4470b5f0-31ec-e43c-b841-5f8f3a3157b1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a0ace7a8-5c26-ee20-fe76-7dff57a18ca3@web.de>
 <be3acb13-2963-ddf1-a867-7e30fd23a0b4@loongson.cn>
In-Reply-To: <be3acb13-2963-ddf1-a867-7e30fd23a0b4@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Xuefeng Li <lixuefeng@loongson.cn>

>> How do you think about another wording variant?
>>
>>     Specific system resources were not released in a few error cases.
>>     Thus add jump targets for the completion of the desired exception handling.
>
> OK, thank you, it looks good to me.

Thanks for your positive feedback.


> Maybe I can use this description for other patches of this series.

Would you like to make any of the affected commit messages more “specific”?

Regards,
Markus
