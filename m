From: David Miller <davem@davemloft.net>
Date: Thu, 12 Dec 2019 18:52:58 +0000
Subject: Re: [PATCH net-next] net: Remove unused including <linux/version.h>
Message-Id: <20191212.105258.579549471896891617.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191212091527.35293-1-yuehaibing@huawei.com>
In-Reply-To: <20191212091527.35293-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: Jason@zx2c4.com, wireguard@lists.zx2c4.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 12 Dec 2019 09:15:27 +0000

> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Appropriate subject line for this should have been:

	Subject: [PATCH net-next] wireguard: Remove unused include <linux/version.h>

'net' is too broad a subsystem prefix as it basically encompases half of the
entire kernel tree.  When people look at the git shortlog output you need to
be specific enough that people can tell what touches what.
