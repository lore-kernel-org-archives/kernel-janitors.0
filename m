From: Oliver Hartkopp <socketcan@hartkopp.net>
Date: Mon, 12 Aug 2019 08:11:11 +0000
Subject: Re: [PATCH net-next] net: can: Fix compiling warning
Message-Id: <04055e63-c2c0-78e3-1b24-47be08976750@hartkopp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190802033643.84243-1-maowenan@huawei.com>
 <0050efdb-af9f-49b9-8d83-f574b3d46a2e@hartkopp.net>
 <20190806135231.GJ1974@kadam>
 <6e1c5aa0-8ed3-eec3-a34d-867ea8f54e9d@hartkopp.net>
 <5018f6ca-53b5-c712-a012-a0fcda5c10c2@huawei.com>
In-Reply-To: <5018f6ca-53b5-c712-a012-a0fcda5c10c2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan <maowenan@huawei.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12/08/2019 07.48, maowenan wrote:
> On 2019/8/7 0:41, Oliver Hartkopp wrote:

>> I compiled the code (the original version), but I do not get that "Should it be static?" warning:

> here are my steps for net/can/bcm.c,
> make allmodconfig ARCH=mips CROSS_COMPILE=mips-linux-gnu-
> make C=2 net/can/bcm.o ARCH=mips CROSS_COMPILE=mips-linux-gnu-

There were some sparse _errors_ in my setup that hide that "static" 
warning. I will use sparse by default now.

Many thanks,
Oliver
