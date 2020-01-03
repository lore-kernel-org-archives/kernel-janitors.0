From: David Miller <davem@davemloft.net>
Date: Fri, 03 Jan 2020 00:37:44 +0000
Subject: Re: [PATCH net-next] tcp: use REXMIT_NEW instead of magic number
Message-Id: <20200102.163744.410305299962714453.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200102140227.77780-1-maowenan@huawei.com>
In-Reply-To: <20200102140227.77780-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: edumazet@google.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Thu, 2 Jan 2020 22:02:27 +0800

> REXMIT_NEW is a macro for "FRTO-style
> transmit of unsent/new packets", this patch
> makes it more readable.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied.
