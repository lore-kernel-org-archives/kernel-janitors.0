From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Fri, 02 Aug 2019 08:59:45 +0000
Subject: Re: [PATCH net-next] net: can: Fix compiling warning
Message-Id: <133b3357-e0a4-64c8-40b7-02d386e12cef@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190802033643.84243-1-maowenan@huawei.com>
In-Reply-To: <20190802033643.84243-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, socketcan@hartkopp.net, davem@davemloft.net, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello!

On 02.08.2019 6:36, Mao Wenan wrote:

> There are two warings in net/can, fix them by setting bcm_sock_no_ioctlcmd

    Warnings. :-)

> and raw_sock_no_ioctlcmd as static.
> 
> net/can/bcm.c:1683:5: warning: symbol 'bcm_sock_no_ioctlcmd' was not declared. Should it be static?
> net/can/raw.c:840:5: warning: symbol 'raw_sock_no_ioctlcmd' was not declared. Should it be static?
> 
> Fixes: 473d924d7d46 ("can: fix ioctl function removal")
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
[...]

MBR, Sergei
