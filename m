From: "shenyang (M)" <shenyang39@huawei.com>
Date: Thu, 06 Aug 2020 01:33:51 +0000
Subject: Re: [v4 01/10] crypto: hisilicon/qm - fix wrong release after using strsep
Message-Id: <e470a745-c59e-2baa-426d-816ae64d052f@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <96ffa633-dda1-7ad1-72da-5563906c1561@web.de>
 <425f4bdd-cf55-6537-28bf-0377564b531b@huawei.com>
 <5554863d-f0d7-a396-7d13-e187fa9ca6bf@web.de>
In-Reply-To: <5554863d-f0d7-a396-7d13-e187fa9ca6bf@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, Sihang Chen <chensihang1@hisilicon.com>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Zaibo Xu <xuzaibo@huawei.com>, Zhou Wang <wangzhou1@hisilicon.com>



On 2020/8/5 14:04, Markus Elfring wrote:
>> Thanks for your review. There is only one error branch need to do
>> something uninit. So I think the jump is not necessary and will
>> affect code reading.:)
>
> How does this concern fit to the Linux coding style?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?idMa9f3302615f4191814f826054846bf843e24fa#n481
>
> Regards,
> Markus
>
> .
>

Got it, I'll fix this.

Thanks,
Yang
