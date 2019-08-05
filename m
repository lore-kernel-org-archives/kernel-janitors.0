From: maowenan <maowenan@huawei.com>
Date: Mon, 05 Aug 2019 01:13:59 +0000
Subject: Re: [PATCH net-next] net: can: Fix compiling warning
Message-Id: <1d9e329a-eafc-6c32-ee2a-df3b15231a2a@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190802033643.84243-1-maowenan@huawei.com>
 <133b3357-e0a4-64c8-40b7-02d386e12cef@cogentembedded.com>
In-Reply-To: <133b3357-e0a4-64c8-40b7-02d386e12cef@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, socketcan@hartkopp.net, davem@davemloft.net, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2019/8/2 16:59, Sergei Shtylyov wrote:
> Hello!
> 
> On 02.08.2019 6:36, Mao Wenan wrote:
> 
>> There are two warings in net/can, fix them by setting bcm_sock_no_ioctlcmd
> 
>    Warnings. :-)

Thanks, I will send v2.

> 
>> and raw_sock_no_ioctlcmd as static.
>>
>> net/can/bcm.c:1683:5: warning: symbol 'bcm_sock_no_ioctlcmd' was not declared. Should it be static?
>> net/can/raw.c:840:5: warning: symbol 'raw_sock_no_ioctlcmd' was not declared. Should it be static?
>>
>> Fixes: 473d924d7d46 ("can: fix ioctl function removal")
>>
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> [...]
> 
> MBR, Sergei
> 
> 
