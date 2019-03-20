From: David Miller <davem@davemloft.net>
Date: Wed, 20 Mar 2019 18:05:01 +0000
Subject: Re: [PATCH net-next] net: bridge: use eth_broadcast_addr() to assign broadcast address
Message-Id: <20190320.110501.903028894297149241.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190320020657.31423-1-maowenan@huawei.com>
In-Reply-To: <20190320020657.31423-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: bridge@lists.linux-foundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, nikolay@cumulusnetworks.com, roopa@cumulusnetworks.com

From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 20 Mar 2019 10:06:57 +0800

> This patch is to use eth_broadcast_addr() to assign broadcast address
> insetad of memset().
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied.
