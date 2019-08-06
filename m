From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Aug 2019 13:52:31 +0000
Subject: Re: [PATCH net-next] net: can: Fix compiling warning
Message-Id: <20190806135231.GJ1974@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190802033643.84243-1-maowenan@huawei.com>
 <0050efdb-af9f-49b9-8d83-f574b3d46a2e@hartkopp.net>
In-Reply-To: <0050efdb-af9f-49b9-8d83-f574b3d46a2e@hartkopp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: Mao Wenan <maowenan@huawei.com>, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 02, 2019 at 10:10:20AM +0200, Oliver Hartkopp wrote:
> On 02/08/2019 05.36, Mao Wenan wrote:
> > There are two warings in net/can, fix them by setting bcm_sock_no_ioctlcmd
> > and raw_sock_no_ioctlcmd as static.
> > 
> > net/can/bcm.c:1683:5: warning: symbol 'bcm_sock_no_ioctlcmd' was not declared. Should it be static?
> > net/can/raw.c:840:5: warning: symbol 'raw_sock_no_ioctlcmd' was not declared. Should it be static?
> > 
> > Fixes: 473d924d7d46 ("can: fix ioctl function removal")
> > 
> > Signed-off-by: Mao Wenan <maowenan@huawei.com>
> 
> Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>
> 
> Thanks Mao!
> 
> Btw. what kind of compiler/make switches are you using so that I can see
> these warnings myself the next time?

These are Sparse warnings, not from GCC.

regards,
dan carpenter
